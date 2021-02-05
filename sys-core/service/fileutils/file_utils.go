// package fileutils contains
// all the helper the application needed in order to process file and directory.
package fileutils

import (
	"fmt"
	"io/ioutil"
	"os"
	"sort"
	"strings"

	"github.com/karrick/godirwalk"
)

// LoadFile helper, reads a file from the filepath
// returns its content and error if it doesn't exists.
func LoadFile(filepath string) ([]byte, error) {
	return ioutil.ReadFile(filepath)
}

// FileExists checks if a file exists and is not a directory before we
// try using it to prevent further errors.
func FileExists(filename string) bool {
	info, err := os.Stat(filename)
	if os.IsNotExist(err) {
		return false
	}
	return !info.IsDir()
}

// PathExists checks if a directory exists.
func PathExists(path string) (bool, error) {
	_, err := os.Stat(path)
	if err == nil {
		return true, nil
	}
	if os.IsNotExist(err) {
		return false, nil
	}
	return false, err
}

// IsDirectory checks whether path is a directory
func IsDirectory(path string) (bool, error) {
	fileInfo, err := os.Stat(path)
	if err != nil {
		return false, err
	}
	return fileInfo.IsDir(), err
}

// ListFiles checks a directory and gets all the files and dir from it
// it also sorts the directory content
func ListFiles(dirpath string) ([]os.FileInfo, error) {
	files, err := ioutil.ReadDir(dirpath)
	if err != nil {
		return nil, err
	}
	sort.SliceStable(files, func(i, j int) bool {
		return files[i].Name() < files[j].Name()
	})
	return files, nil
}

// LookupFile in a directory, if it exists, returns the full path to the file
// if it doesn't returns error
// takes the directory of the file, and the string containing parts of the file (or the whole file name)
func LookupFile(dirname, contains string) (string, error) {
	var matched string
	_ = godirwalk.Walk(dirname, &godirwalk.Options{
		FollowSymbolicLinks: true,
		Callback: func(osPathname string, de *godirwalk.Dirent) error {
			if de.IsRegular() && strings.Contains(de.Name(), contains) {
				matched = osPathname
				return nil
			}
			return nil
		},
		Unsorted: true, // (optional) set true for faster yet non-deterministic enumeration (see godoc)
	})
	if matched == "" {
		return "", fmt.Errorf("file contains %s not found", contains)
	}

	return matched, nil
}
