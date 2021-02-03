package filehelper

import (
	"bytes"
	"fmt"
	"image"
	"image/png"
	"io/ioutil"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"github.com/disintegration/imaging"

	sharedConfig "github.com/amplify-cms/sys-share/sys-core/service/config"
	dbrpc "github.com/amplify-cms/sys-share/sys-core/service/go/rpc/v2"
)

const (
	defaultJpgQuality = 80
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

	b, err := imgEncode(fpath, nil)
	if err != nil {
		return nil, nil, err
	}
	return finfo, b, nil
}

func ReadFileFromBytes(fpath string, content []byte) (*dbrpc.FileInfo, []byte, error) {
	finfo := sharedReadFrom(fpath, content)
	buf, err := imgEncode(fpath, content)
	if err != nil {
		return nil, nil, err
	}
	return finfo, buf, nil
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

func imgEncode(fpath string, content []byte) ([]byte, error) {
	var ext string
	if fpath != "" {
		ext = filepath.Ext(fpath)
	} else {
		ext = fmt.Sprintf(".%s", strings.Split(http.DetectContentType(content), "/")[1])
	}
	b := bytes.Buffer{}
	var img image.Image
	var fmtExt imaging.Format
	var f []byte
	var err error
	if ext[1:] == "png" || ext[1:] == "jpg" || ext[1:] == "jpeg" {
		fmtExt, err = imaging.FormatFromExtension(ext)
		if fpath != "" && content == nil {
			img, err = imaging.Open(fpath)
			if err != nil {
				return nil, err
			}
		} else {
			buf := bytes.NewBuffer(content)
			img, err = imaging.Decode(buf)
			if err != nil {
				return nil, err
			}
		}
	} else {
		if fpath != "" && content == nil {
			f, err = ioutil.ReadFile(fpath)
			if err != nil {
				return nil, err
			}
			b.Write(f)
		} else if content != nil {
			b.Write(content)
		}
	}
	if fmtExt.String() != "" {
		switch fmtExt {
		case imaging.JPEG:
			err = imaging.Encode(&b, img, fmtExt, imaging.JPEGQuality(defaultJpgQuality))
		case imaging.PNG:
			err = imaging.Encode(&b, img, fmtExt, imaging.PNGCompressionLevel(png.BestSpeed))
		default:
			err = fmt.Errorf("invalid image format, only supports jp(e)g and png currently, got: %s", fmtExt.String())
		}
		if err != nil {
			return nil, err
		}
	}
	return b.Bytes(), nil
}
