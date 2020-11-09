package filehelper

import (
	"bytes"
	"fmt"
	"io"
	"net/http"
	"os"
	"path/filepath"

	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	dbrpc "github.com/getcouragenow/sys-share/sys-core/service/go/rpc/v2"
)

// ReadFileFromPath takes a filepath as an input
// i.e. /Users/blah/somefile.jpg
// and it will return its mimetype, abspath in FileInfo
// its content as slice of utf8 bytes
// and an error if there's any
func ReadFileFromPath(fpath string) (*dbrpc.FileInfo, []byte, error) {
	if fpath == "" {
		return nil, nil, fmt.Errorf("path must be provided")
	}
	abspath, err := filepath.Abs(fpath)
	if err != nil {
		return nil, nil, err
	}
	file, err := os.Open(abspath)
	if err != nil {
		return nil, nil, err
	}
	defer file.Close()
	buffer := make([]byte, 512)
	_, err = file.Read(buffer)
	if err != nil {
		return nil, nil, err
	}
	finfo := sharedReadFrom(abspath, buffer)
	buf := bytes.Buffer{}
	if _, err = io.Copy(&buf, file); err != nil {
		return nil, nil, err
	}
	return finfo, buf.Bytes(), nil
}

func ReadFileFromBytes(fpath string, content []byte) (*dbrpc.FileInfo, []byte, error) {
	finfo := sharedReadFrom(fpath, content)
	buf := bytes.Buffer{}
	if _, err := io.Copy(&buf, bytes.NewBuffer(content)); err != nil {
		return nil, nil, err
	}
	return finfo, buf.Bytes(), nil
}

func sharedReadFrom(fpath string, content []byte) *dbrpc.FileInfo {
	contentType := http.DetectContentType(content)
	resourceId := getFileResourceId(fpath)
	return &dbrpc.FileInfo{
		MimeType:   contentType,
		IsDir:      false,
		ResourceId: resourceId,
	}
}

func getFileResourceId(fpath string) string {
	return fmt.Sprintf("%s_%d", fpath, sharedConfig.CurrentTimestamp())
}
