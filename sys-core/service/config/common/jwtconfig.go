package common

import sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"

type TokenConfig struct {
	Secret string `json:"secret" yaml:"secret" mapstructure:"secret"`
	Expiry int    `json:"expiry" yaml:"expiry" mapstructure:"expiry"`
}

func (t TokenConfig) Validate() error {
	if t.Secret == "" {
		secret, err := sharedConfig.GenRandomByteSlice(32)
		if err != nil {
			return err
		}
		t.Secret = string(secret)
	}
	return nil
}
