package shared_test

import (
	"testing"

	pkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	"github.com/getcouragenow/sys-share/sys-account/service/go/pkg/shared"
	utilities "github.com/getcouragenow/sys-share/sys-core/service/config"
	"github.com/stretchr/testify/assert"
)

var (
	tc             *shared.TokenConfig
	accountSeeders = []*pkg.Account{
		{
			Id:       "1hpMOKQj30jOrqtB8hLmclWtXGx",
			Email:    "winwisely268@example.com",
			Password: "SOME_HASHED_ARGON",
			Role:     nil,
		},
		{
			Id:       "1hpMToJZs40ZHEiIuDGQkqtd8oV",
			Email:    "winwisely269@example.com",
			Password: "HATH_NO_FURY_LIKE",
			Role: &pkg.UserRoles{
				Role: 4, // Superadmin
				All:  true,
			},
		},
		{
			Id:       "1hpMToJZs40ZHEiIuDGQkqtd8oV",
			Email:    "winwisely267@example.com",
			Password: "A_CI_BEING_SCORNED",
			Role: &pkg.UserRoles{
				Role:  3, // Org Admin
				OrgID: "1hpMx8pkde4IGFYdhrASY5cPei2",
			},
		},
		{
			Id:       "1hpMToJZs40ZHEiIuDGQkqtd8oV",
			Email:    "winwisely267@example.com",
			Password: "WE_WANT_GO_GENERICS",
			Role: &pkg.UserRoles{
				Role:      2, // Project Admin
				ProjectID: "1hpMx8pkde4IGFYdhrASY5cPei2",
			},
		},
	}
)

func TestTokenAll(t *testing.T) {
	accessSecret, err := utilities.GenRandomByteSlice(32)
	assert.NoError(t, err)
	refreshSecret, err := utilities.GenRandomByteSlice(32)
	assert.NoError(t, err)
	tc = shared.NewTokenConfig(accessSecret, refreshSecret)
	t.Run("TestNewTokenPairs", testNewTokenPairs)
	t.Parallel()
}

func testNewTokenPairs(t *testing.T) {
	for _, acc := range accountSeeders {
		tpairs, err := tc.NewTokenPairs(acc)
		assert.NoError(t, err)
		t.Logf("Successfully generated token pairs for: %s => Access: %s\n, Refresh: %s\n",
			acc.GetEmail(), tpairs.AccessToken, tpairs.RefreshToken)
	}
}
