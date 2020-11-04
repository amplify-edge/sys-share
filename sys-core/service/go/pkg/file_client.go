package pkg

import (
	"bufio"
	"bytes"
	"context"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"time"

	"github.com/sirupsen/logrus"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/encoding/protojson"

	dbrpc "github.com/getcouragenow/sys-share/sys-core/service/go/rpc/v2"
)

type FileClient struct {
	svc    dbrpc.FileServiceClient
	logger *logrus.Entry
}

func NewFileServiceClient(cc grpc.ClientConnInterface) *FileClient {
	svc := dbrpc.NewFileServiceClient(cc)
	return &FileClient{svc: svc}
}

func (fc *FileClient) UploadFile(filePath string, r io.ReadCloser, fileInfo *dbrpc.FileInfo) ([]byte, error) {
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

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	stream, err := fc.svc.Upload(ctx)
	if err != nil {
		return nil, fmt.Errorf("cannot upload file: %v", err)
	}

	req := &dbrpc.FileUploadRequest{
		FileInfo: fileInfo,
		Chunk:    nil, // doesn't send chunk first
	}

	err = stream.Send(req)
	if err != nil {
		return nil, fmt.Errorf("cannot send fileInfo to server: %v %v", err, stream.RecvMsg(nil))
	}

	reader := bufio.NewReader(file)
	buffer := make([]byte, 1024)

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
	}

	res, err := stream.CloseAndRecv()
	if err != nil {
		return nil, fmt.Errorf("cannot receive file upload response: %v", err)
	}
	m := protojson.MarshalOptions{
		Multiline:       true,
		Indent:          "  ",
		EmitUnpopulated: true,
	}
	return m.Marshal(res)
}

func (fc *FileClient) DownloadFile(id string) ([]byte, error) {
	if id == "" {
		return nil, fmt.Errorf("download error: id is empty")
	}
	req := &dbrpc.FileDownloadRequest{Id: id}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	stream, err := fc.svc.Download(ctx, req)
	if err != nil {
		return nil, fmt.Errorf("initiating download error: %v", err)
	}
	// errChan := make(chan error, 1)
	// go func() {
	b := bytes.Buffer{}
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
	}
	// }()
	// if err = <-errChan; err != nil {
	// 	return nil, fmt.Errorf("error downloading file with id: %s => %v", id, err)
	// }
	return b.Bytes(), nil
}
