package config

import "io/ioutil"

// TODO @gutterbacon: use this as abstraction for per module configs.
type Configer interface {
	NewConfig(filepath string) (Configer, error)
	validate(cfg Configer) error
}

func LoadFile(filepath string) ([]byte, error) {
	return ioutil.ReadFile(filepath)
}
