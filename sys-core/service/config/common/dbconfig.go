package common

import (
	"fmt"
	"os"
	"path/filepath"

	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
)

const (
	errDbNameEmpty  = "error: db name empty"
	errDbRotation   = "error: db rotation has to be greater than or equal to 1 (day)"
	errCronSchedule = "error: db cron schedule is in wrong format / empty"
	defaultDirPerm  = 0755
)

type DbConfig struct {
	Name             string `json:"name" yaml:"name" mapstructure:"name"`
	EncryptKey       string `json:"encryptKey" yaml:"encryptKey" mapstructure:"encryptKey"`
	RotationDuration int    `json:"rotationDuration" yaml:"rotationDuration" mapstructure:"rotationDuration"`
	DbDir            string `json:"dbDir" yaml:"dbDir" mapstructure:"dbDir"`
	DeletePrevious   bool   `json:"deletePrevious" yaml:"deletePrevious" mapstructure:"deletePrevious"`
}

func (d DbConfig) Validate() error {
	if d.Name == "" {
		return fmt.Errorf(errDbNameEmpty)
	}
	if d.RotationDuration < 1 {
		return fmt.Errorf(errDbRotation)
	}
	if d.EncryptKey == "" {
		encKey, err := sharedConfig.GenRandomByteSlice(32)
		if err != nil {
			return err
		}
		d.EncryptKey = string(encKey)
	}
	abspath, err := filepath.Abs(d.DbDir)
	if err != nil {
		return err
	}
	exists, err := sharedConfig.PathExists(abspath)
	if err != nil || !exists {
		return os.MkdirAll(abspath, defaultDirPerm)
	}
	d.DbDir = abspath

	if d.DeletePrevious {
		return os.RemoveAll(abspath + "/" + d.Name)
	}

	return nil
}

type CronConfig struct {
	BackupSchedule string `json:"backupSchedule" yaml:"backupSchedule" mapstructure:"backupSchedule"`
	RotateSchedule string `json:"rotateSchedule" yaml:"rotateSchedule" mapstructure:"rotateSchedule"`
	BackupDir      string `json:"backupDir" yaml:"backupDir" mapstructure:"backupDir"`
}

func (c CronConfig) Validate() error {
	if c.BackupSchedule == "" || c.RotateSchedule == "" {
		return fmt.Errorf(errCronSchedule)
	}
	if exists, err := sharedConfig.PathExists(c.BackupDir); err != nil || !exists {
		return os.MkdirAll(c.BackupDir, defaultDirPerm)
	}
	c.BackupDir, _ = filepath.Abs(c.BackupDir)
	return nil
}

type Config struct {
	DbConfig   DbConfig   `json:"db" yaml:"db" mapstructure:"db"`
	CronConfig CronConfig `json:"cron" yaml:"cron" mapstructure:"cron"`
}

func (c Config) Validate() error {
	if err := c.DbConfig.Validate(); err != nil {
		return err
	}
	if err := c.CronConfig.Validate(); err != nil {
		return err
	}
	return nil

}
