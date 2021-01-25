package pkg

import (
	"archive/tar"
	"bufio"
	"bytes"
	"compress/gzip"
	"context"
	"encoding/binary"
	"fmt"
	log "github.com/getcouragenow/sys-share/sys-core/service/logging"
	"github.com/getcouragenow/sys-share/sys-core/service/logging/zaplog"
	"github.com/spf13/cobra"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/getcouragenow/protoc-gen-cobra/client"
	"github.com/getcouragenow/protoc-gen-cobra/flag"
	"github.com/getcouragenow/protoc-gen-cobra/iocodec"
	bar "github.com/schollz/progressbar/v2"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/encoding/protojson"

	"github.com/getcouragenow/sys-share/sys-core/service/config"

	dbrpc "github.com/getcouragenow/sys-share/sys-core/service/go/rpc/v2"
)

const (
	chunkSize             = 1 << 20 / 10 // 100KB each
	printInterval         = 10 * time.Millisecond
	defaultContextTimeout = 5 * time.Second
)

type FileClient struct {
	svc    dbrpc.FileServiceClient
	logger log.Logger
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
	logger := zaplog.NewZapLogger(zaplog.DEBUG, "sys-file-client", true, "")
	logger.InitLogger(nil)
	return &FileClient{svc: svc, logger: logger}
}

func NewFileServiceClientCommand(options ...client.Option) *cobra.Command {
	cfg := client.NewConfig(options...)
	rootCmd := &cobra.Command{
		Use:   cfg.CommandNamer("FileService"),
		Short: "file-service <upload|download>",
		Long:  "",
	}
	cfg.BindFlags(rootCmd.PersistentFlags())
	rootCmd.AddCommand(uploadFileCommand(cfg), downloadFileCommand(cfg))
	return rootCmd
}

// UploadFile client library
func (fc *FileClient) UploadFile(filepath string, r io.ReadCloser, fileInfo *dbrpc.FileInfo) ([]byte, error) {
	return fc.uploadFile(filepath, r, fileInfo, false)
}

func uploadFileCommand(cfg *client.Config) *cobra.Command {
	var fpath string
	req := &dbrpc.FileInfo{}
	cmd := &cobra.Command{
		Use:   "upload <OPTIONS only choose one for id> <PATH>",
		Short: "upload file from path, directory uploaded will be saved in compressed format",
		Long:  "upload file from path, directory uploaded will be saved in compressed format",
		RunE: func(cmd *cobra.Command, args []string) error {
			if cfg.UseEnvVars {
				if err := flag.SetFlagsFromEnv(cmd.Parent().PersistentFlags(), true, cfg.EnvVarNamer, cfg.EnvVarPrefix, "FileService"); err != nil {
					return err
				}
				if err := flag.SetFlagsFromEnv(cmd.PersistentFlags(), false, cfg.EnvVarNamer, cfg.EnvVarPrefix, "FileService", "Upload"); err != nil {
					return err
				}
			}
			return client.RoundTrip(cmd.Context(), cfg, func(cc grpc.ClientConnInterface, in iocodec.Decoder, out iocodec.Encoder) error {
				fc := NewFileServiceClient(cc)
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
					if err = archive(fpath, &buf); err != nil {
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
			})
		},
	}
	cmd.PersistentFlags().StringVarP(&req.ResourceId, "resource-id", "r", "", "organization id")
	cmd.PersistentFlags().StringVarP(&fpath, "path", "f", "", "path to file or dir")
	return cmd
}

func downloadFileCommand(cfg *client.Config) *cobra.Command {
	var fpath string
	var req string
	cmd := &cobra.Command{
		Use:   "download <OPTIONS only choose one for id> <PATH>",
		Short: "download file or dir from path, directory uploaded will be extracted",
		Long:  "download file or dir from path, directory uploaded will be extracted",
		RunE: func(cmd *cobra.Command, args []string) error {
			if cfg.UseEnvVars {
				if err := flag.SetFlagsFromEnv(cmd.Parent().PersistentFlags(), true, cfg.EnvVarNamer, cfg.EnvVarPrefix, "FileService"); err != nil {
					return err
				}
				if err := flag.SetFlagsFromEnv(cmd.PersistentFlags(), false, cfg.EnvVarNamer, cfg.EnvVarPrefix, "FileService", "Upload"); err != nil {
					return err
				}
			}
			return client.RoundTrip(cmd.Context(), cfg, func(cc grpc.ClientConnInterface, in iocodec.Decoder, out iocodec.Encoder) error {
				fc := NewFileServiceClient(cc)
				if fpath == "" {
					return fmt.Errorf("path must be provided")
				}
				abspath, err := filepath.Abs(fpath)
				if err != nil {
					return err
				}
				// fileDir := filepath.Dir(abspath)
				res, isDir, err := fc.downloadFile(req, true)
				if err != nil {
					return err
				}
				if isDir {
					destpath := filepath.Join(abspath, "downloaded.tar.gz")
					fc.logger.Warnf("Destination: %s", destpath)
					file, err := os.OpenFile(destpath, os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0644)
					if err != nil {
						fc.logger.Warnf("Cannot open file tar gz : %v", err)
						return err
					}
					if _, err = io.Copy(file, bytes.NewBuffer(res)); err != nil {
						fc.logger.Warnf("Cannot copy to file : %v", err)
						return err
					}
					// if err = unarchive(bytes.NewBuffer(res), abspath); err != nil {
					// 	return err
					// }
					return nil
				}
				if err = ioutil.WriteFile(abspath, res, 0644); err != nil {
					return err
				}
				return nil
			})
		},
	}
	cmd.PersistentFlags().StringVar(&fpath, "dest", "", "destination path of downloaded file")
	cmd.PersistentFlags().StringVar(&req, "id", "", "file id")
	return cmd
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
	cwd, err := os.Getwd()
	if err != nil {
		return err
	}
	relpath, err := filepath.Rel(cwd, src)
	if err != nil {
		return err
	}
	fi, err := os.Stat(relpath)
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
		if err = filepath.Walk(relpath, func(file string, fi os.FileInfo, err error) error {
			header, err := tar.FileInfoHeader(fi, fi.Name())
			if err != nil {
				return err
			}
			relFilePath := file
			if filepath.IsAbs(file) {
				relFilePath, err = filepath.Rel(relpath, file)
				if err != nil {
					return err
				}
			}
			header.Name = relFilePath
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
		}); err != nil {
			return err
		}
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
		var hdr *tar.Header
		hdr, err = tr.Next()
		if err == io.EOF {
			break
		}
		if err != nil {
			return err
		}
		finfo := hdr.FileInfo()
		fileName := hdr.Name
		if filepath.IsAbs(fileName) {
			fmt.Printf("removing / prefix from %s\n", fileName)
			fileName, err = filepath.Rel("/", fileName)
			if err != nil {
				return err
			}
		}
		target := filepath.Join(dst, fileName)

		if finfo.Mode().IsDir() {
			if err := os.MkdirAll(target, 0755); err != nil {
				return err
			}
			continue
		}

		// create new file with original file mode
		file, err := os.OpenFile(target, os.O_RDWR|os.O_CREATE|os.O_TRUNC, finfo.Mode().Perm())
		if err != nil {
			return err
		}
		fmt.Printf("x %s\n", target)
		n, cpErr := io.Copy(file, tr)
		if closeErr := file.Close(); closeErr != nil { // close file immediately
			return err
		}
		if cpErr != nil {
			return cpErr
		}
		if n != finfo.Size() {
			return fmt.Errorf("unexpected bytes written: wrote %d, want %d", n, finfo.Size())
		}
	}
	return nil
}
