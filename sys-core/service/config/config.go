package config

import (
	"crypto/rand"
	"io/ioutil"
	"math/big"
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
