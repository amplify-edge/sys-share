package common

import sharedConfig "go.amplifyedge.org/sys-share-v2/sys-core/service/config"

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
