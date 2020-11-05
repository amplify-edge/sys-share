package pkg

import (
	"archive/tar"
	"bufio"
	"bytes"
	"compress/gzip"
	"context"
	"encoding/binary"
	"fmt"
	"github.com/getcouragenow/sys-share/sys-core/service/config"
	"github.com/spf13/cobra"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
	"time"

	bar "github.com/schollz/progressbar/v2"
	"github.com/sirupsen/logrus"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/encoding/protojson"

	dbrpc "github.com/getcouragenow/sys-share/sys-core/service/go/rpc/v2"
)

const (
	chunkSize             = 1 << 20 / 10 // 100KB each
	printInterval         = 10 * time.Millisecond
	defaultContextTimeout = 5 * time.Second
)

type FileClient struct {
	svc    dbrpc.FileServiceClient
	logger *logrus.Entry
}

type progressBar struct {
	pbar *bar.ProgressBar
}

func newProgressBar(max int64) *progressBar {
	return &progressBar{pbar: bar.NewOptions64(max, bar.OptionClearOnFinish(), bar.OptionSetRenderBlankState(true))}
}

// Add adds sent / received byte to the progress bar
func (p *progressBar) Add(b int) {
	_ = p.pbar.Add(b)
}

func NewFileServiceClient(cc grpc.ClientConnInterface) *FileClient {
	svc := dbrpc.NewFileServiceClient(cc)
	return &FileClient{svc: svc}
}

func (fc *FileClient) CobraCommand() *cobra.Command {
	rootCmd := &cobra.Command{
		Use:   "file-service <COMMANDS>",
		Short: "file-service <upload|download>",
		Long:  "",
	}
	rootCmd.AddCommand(fc.uploadFileCommand(), fc.downloadFileCommand())
	return rootCmd
}

// UploadFile client library
func (fc *FileClient) UploadFile(filepath string, r io.ReadCloser, fileInfo *dbrpc.FileInfo) ([]byte, error) {
	return fc.uploadFile(filepath, r, fileInfo, false)
}

func (fc *FileClient) uploadFileCommand() *cobra.Command {
	var fpath string
	req := &dbrpc.FileInfo{}
	cmd := &cobra.Command{
		Use:   "Upload <OPTIONS only choose one for id> <PATH>",
		Short: "Upload file or dir from path, directory uploaded will be saved in compressed format",
		Long:  "Upload file or dir from path, directory uploaded will be saved in compressed format",
		RunE: func(cmd *cobra.Command, args []string) error {
			if fpath == "" {
				return fmt.Errorf("path must be provided")
			}
			abspath, err := filepath.Abs(fpath)
			if err != nil {
				return err
			}
			isDir, err := config.IsDirectory(abspath)
			if err != nil {
				return err
			}
			fpath = abspath
			if isDir {
				buf := bytes.Buffer{}
				if err = archive(abspath, &buf); err != nil {
					return err
				}
				saveName := fmt.Sprintf("%s%s", abspath, ".tar.gz")
				if err = ioutil.WriteFile(saveName, buf.Bytes(), 0644); err != nil {
					return err
				}
				fpath = saveName
				req.IsDir = true
			}
			res, err := fc.uploadFile(fpath, nil, req, true)
			if err != nil {
				return err
			}
			if _, err = fmt.Fprintln(os.Stdout, string(res)); err != nil {
				return err
			}
			return nil
		},
	}
	cmd.PersistentFlags().StringVar(&req.SysAccountProjectId, "org-id", "", "organization id")
	cmd.PersistentFlags().StringVar(&req.SysAccountProjectId, "project-id", "", "project id")
	cmd.PersistentFlags().StringVar(&req.SysAccountProjectId, "account-id", "", "account id")
	cmd.PersistentFlags().StringVar(&fpath, "path", "", "path to file or dir")
	return nil
}

func (fc *FileClient) downloadFileCommand() *cobra.Command {
	var fpath string
	var req string
	cmd := &cobra.Command{
		Use:   "Download <OPTIONS only choose one for id> <PATH>",
		Short: "Download file or dir from path, directory uploaded will be extracted",
		Long:  "Download file or dir from path, directory uploaded will be extracted",
		RunE: func(cmd *cobra.Command, args []string) error {
			if fpath == "" {
				return fmt.Errorf("path must be provided")
			}
			abspath, err := filepath.Abs(fpath)
			if err != nil {
				return err
			}
			fileDir := filepath.Dir(abspath)
			res, isDir, err := fc.downloadFile(req, true)
			if err != nil {
				return err
			}
			if isDir {
				if err = unarchive(bytes.NewBuffer(res), filepath.Join(fileDir, "extracted")); err != nil {
					return err
				}
				return nil
			}
			if err = ioutil.WriteFile(abspath, res, 0644); err != nil {
				return err
			}
			return nil
		},
	}
	cmd.PersistentFlags().StringVar(&fpath, "dest", "", "destination path of downloaded file")
	cmd.PersistentFlags().StringVar(&req, "id", "", "file id")
	return nil
}

// uploadFile will be used by both client and CLI
func (fc *FileClient) uploadFile(filePath string, r io.ReadCloser, fileInfo *dbrpc.FileInfo, withProgress bool) ([]byte, error) {
	var file io.ReadCloser
	var err error
	if fileInfo == nil {
		return nil, fmt.Errorf("fileInfo cannot be nil")
	}
	if filePath != "" && r == nil {
		var abspath string
		abspath, err = filepath.Abs(filePath)
		if err != nil {
			return nil, err
		}
		file, err = os.Open(abspath)
		if err != nil {
			return nil, fmt.Errorf("cannot open file: %v\n", err)
		}
	}
	if r != nil {
		file = r
	}
	defer file.Close()

	var pbar *progressBar
	if withProgress {
		pbar = newProgressBar(int64(binary.Size(file)))
	}

	ctx, cancel := context.WithTimeout(context.Background(), defaultContextTimeout)
	defer cancel()

	stream, err := fc.svc.Upload(ctx)
	if err != nil {
		return nil, fmt.Errorf("cannot upload file: %v", err)
	}

	req := &dbrpc.FileUploadRequest{
		FileInfo: fileInfo,
	}

	err = stream.Send(req)
	if err != nil {
		return nil, fmt.Errorf("cannot send fileInfo to server: %v %v", err, stream.RecvMsg(nil))
	}

	reader := bufio.NewReader(file)
	buffer := make([]byte, chunkSize)

	for {
		var n int
		n, err = reader.Read(buffer)
		if err != nil {
			if err == io.EOF {
				break
			}
			return nil, fmt.Errorf("cannot read chunk to buffer: %v", err)
		}
		req.Chunk = buffer[:n]
		err = stream.Send(req)
		if err != nil {
			return nil, fmt.Errorf("cannot send chunk to server: %v %v", err, stream.RecvMsg(nil))
		}
		if withProgress {
			pbar.Add(n)
		}
	}

	res, err := stream.CloseAndRecv()
	if err != nil {
		return nil, fmt.Errorf("cannot receive file upload response: %v", err)
	}
	if withProgress {
		fmt.Println("") // End
	}
	m := protojson.MarshalOptions{
		Multiline:       true,
		Indent:          "  ",
		EmitUnpopulated: true,
	}
	return m.Marshal(res)
}

// client library
func (fc *FileClient) DownloadFile(id string) ([]byte, error) {
	res, _, err := fc.downloadFile(id, false)
	return res, err
}

// downloadFile will be used by both client library and CLI
func (fc *FileClient) downloadFile(id string, withProgress bool) ([]byte, bool, error) {
	if id == "" {
		return nil, false, fmt.Errorf("download error: id is empty")
	}
	req := &dbrpc.FileDownloadRequest{Id: id}

	ctx, cancel := context.WithTimeout(context.Background(), defaultContextTimeout)
	defer cancel()

	stream, err := fc.svc.Download(ctx, req)
	if err != nil {
		return nil, false, fmt.Errorf("initiating download error: %v", err)
	}
	b := bytes.Buffer{}
	var pb *progressBar
	if withProgress {
		pb = newProgressBar(int64(b.Len()))
	}
	lastProgressPrint := time.Time{}
	isDir := false
	for {
		var chunk *dbrpc.FileDownloadResponse
		chunk, err = stream.Recv()
		if err != nil {
			if err == io.EOF {
				break
			}
			return nil, false, err
		}
		_, err = b.Write(chunk.GetChunk())
		if err != nil {
			return nil, false, err
		}
		if chunk.IsCompressed {
			isDir = true
		}
		total := chunk.GetTotalSize()
		count := len(chunk.GetChunk())
		if withProgress {
			pb.pbar.ChangeMax64(total)
			now := time.Now()
			if now.After(lastProgressPrint.Add(printInterval)) {
				lastProgressPrint = now
				fmt.Println(count)
				pb.Add(count)
			}
		}
	}
	return b.Bytes(), isDir, nil
}

func archive(src string, buf io.Writer) error {
	zr := gzip.NewWriter(buf)
	tw := tar.NewWriter(zr)
	fi, err := os.Stat(src)
	if err != nil {
		return err
	}
	mode := fi.Mode()
	if mode.IsRegular() {
		header, err := tar.FileInfoHeader(fi, src)
		if err != nil {
			return err
		}
		if err := tw.WriteHeader(header); err != nil {
			return err
		}
		data, err := os.Open(src)
		if err != nil {
			return err
		}
		if _, err := io.Copy(tw, data); err != nil {
			return err
		}
	} else if mode.IsDir() {
		filepath.Walk(src, func(file string, fi os.FileInfo, err error) error {
			header, err := tar.FileInfoHeader(fi, file)
			if err != nil {
				return err
			}
			header.Name = filepath.ToSlash(file)
			if err := tw.WriteHeader(header); err != nil {
				return err
			}
			if !fi.IsDir() {
				data, err := os.Open(file)
				if err != nil {
					return err
				}
				if _, err := io.Copy(tw, data); err != nil {
					return err
				}
			}
			return nil
		})
	} else {
		return fmt.Errorf("error: file type not supported")
	}
	if err := tw.Close(); err != nil {
		return err
	}
	if err := zr.Close(); err != nil {
		return err
	}
	return nil
}

func checkRelativePath(pth string) bool {
	if strings.Contains(pth, `\`) || strings.HasPrefix(pth, "/") || strings.Contains(pth, "../") || pth == "" {
		return false
	}
	return true
}

func unarchive(src io.Reader, dst string) error {
	zr, err := gzip.NewReader(src)
	if err != nil {
		return err
	}
	tr := tar.NewReader(zr)
	// recursively unarchive each file / dir
	for {
		header, err := tr.Next()
		if err == io.EOF {
			break
		}
		if err != nil {
			return err
		}
		target := header.Name
		if !checkRelativePath(header.Name) {
			return fmt.Errorf("invalid name error %q", target)
		}
		target = filepath.Join(dst, header.Name)

		switch header.Typeflag {
		// create directory with permission 755 (unix default)
		case tar.TypeDir:
			if _, err := os.Stat(target); err != nil {
				if err := os.MkdirAll(target, 0755); err != nil {
					return err
				}
			}
		// create file with the same permission as it was pre archiving
		case tar.TypeReg:
			fileToWrite, err := os.OpenFile(target, os.O_CREATE|os.O_RDWR, os.FileMode(header.Mode))
			if err != nil {
				return err
			}
			if _, err = io.Copy(fileToWrite, tr); err != nil {
				return err
			}
			fileToWrite.Close()
		}
	}
	return nil
}
