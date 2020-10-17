package config

import (
	"crypto/rand"
	"io/ioutil"
	"math/big"
	"os"
)

// TODO @gutterbacon: use this as abstraction for per module configs.
type Configurator interface {
	Validate() error
}

func LoadFile(filepath string) ([]byte, error) {
	return ioutil.ReadFile(filepath)
}

func GenRandomByteSlice(length int) ([]byte, error) {
	const legalChars = "01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_"
	rnd := make([]byte, length)
	for i := 0; i < length; i++ {
		num, err := rand.Int(rand.Reader, big.NewInt(int64(len(legalChars))))
		if err != nil {
			return nil, err
		}
		rnd = append(rnd, legalChars[num.Int64()])
	}
	return rnd, nil
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
