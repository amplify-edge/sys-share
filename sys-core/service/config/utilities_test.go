package config_test

import (
	utilities "github.com/amplify-cms/sys-share/sys-core/service/config"
	"github.com/stretchr/testify/require"
	"testing"
)

func TestGenRandomByteSlice(t *testing.T) {
	randomBytes, err := utilities.GenRandomByteSlice(32)
	require.NoError(t, err)
	t.Logf("Generated random byte: %s", string(randomBytes))
}

func TestLookupFile(t *testing.T) {
	fpath, err := utilities.LookupFile("./testdata", "test")
	require.NoError(t, err)
	t.Logf("Filepath: %s", fpath)

	fpath, err = utilities.LookupFile("./testdata", "test2")
	require.NoError(t, err)
	t.Logf("Filepath: %s", fpath)
}
