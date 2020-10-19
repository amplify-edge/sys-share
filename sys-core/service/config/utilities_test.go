package config_test

import (
	utilities "github.com/getcouragenow/sys-share/sys-core/service/config"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestGenRandomByteSlice(t *testing.T) {
	randomBytes, err := utilities.GenRandomByteSlice(32)
	assert.NoError(t, err)
	t.Logf("Generated random byte: %s", string(randomBytes))
}
