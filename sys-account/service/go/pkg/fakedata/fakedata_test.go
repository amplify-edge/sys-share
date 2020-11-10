package fakedata_test

import (
	"io/ioutil"
	"testing"

	"github.com/stretchr/testify/require"

	"github.com/getcouragenow/sys-share/sys-account/service/go/pkg/fakedata"
)

func TestBootstrapFakeData(t *testing.T) {
	b, err := fakedata.BootstrapFakeData()
	require.NoError(t, err)
	t.Log(string(b))

	require.NoError(t, ioutil.WriteFile("./bs-sys-account.json", b, 0644))

	bmd, err := fakedata.BootstrapSysAccountFromFilepath("./bs-sys-account.json")
	require.NoError(t, err)

	nsps := bmd.GetOrgs()
	require.NotEmpty(t, nsps)
}
