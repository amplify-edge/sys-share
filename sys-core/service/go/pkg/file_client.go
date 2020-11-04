package pkg

import (
	"bufio"
	"bytes"
	"context"
	"encoding/binary"
	"fmt"
	"github.com/spf13/cobra"
	"io"
	"os"
	"path/filepath"
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

// UploadFile client library
func (fc *FileClient) UploadFile(filepath string, r io.ReadCloser, fileInfo *dbrpc.FileInfo) ([]byte, error) {
	return fc.uploadFile(filepath, r, fileInfo, false)
}

func (fc *FileClient) uploadFileCommand() *cobra.Command {
	// TODO
	return nil
}

func (fc *FileClient) downloadFileCommand() *cobra.Command {
	// TODO
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
	return fc.downloadFile(id, false)
}

// downloadFile will be used by both client library and CLI
func (fc *FileClient) downloadFile(id string, withProgress bool) ([]byte, error) {
	if id == "" {
		return nil, fmt.Errorf("download error: id is empty")
	}
	req := &dbrpc.FileDownloadRequest{Id: id}

	ctx, cancel := context.WithTimeout(context.Background(), defaultContextTimeout)
	defer cancel()

	stream, err := fc.svc.Download(ctx, req)
	if err != nil {
		return nil, fmt.Errorf("initiating download error: %v", err)
	}
	b := bytes.Buffer{}
	var pb *progressBar
	if withProgress {
		pb = newProgressBar(int64(b.Len()))
	}
	lastProgressPrint := time.Time{}
	for {
		var chunk *dbrpc.FileDownloadResponse
		chunk, err = stream.Recv()
		if err != nil {
			if err == io.EOF {
				break
			}
			return nil, err
		}
		_, err = b.Write(chunk.GetChunk())
		if err != nil {
			return nil, err
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
	return b.Bytes(), nil
}
