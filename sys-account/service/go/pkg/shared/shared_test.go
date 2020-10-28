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
			Role: []*pkg.UserRoles{
				{Role: 4, // Superadmin
					All: true},
			},
		},
		{
			Id:       "1hpMToJZs40ZHEiIuDGQkqtd8oV",
			Email:    "winwisely267@example.com",
			Password: "A_CI_BEING_SCORNED",
			Role: []*pkg.UserRoles{{
				Role:  3, // Org Admin
				OrgID: "1hpMx8pkde4IGFYdhrASY5cPei2",
			}},
		},
		{
			Id:       "1hpMToJZs40ZHEiIuDGQkqtd8oV",
			Email:    "winwisely267@example.com",
			Password: "WE_WANT_GO_GENERICS",
			Role: []*pkg.UserRoles{{
				Role:      2, // Project Admin
				ProjectID: "1hpMx8pkde4IGFYdhrASY5cPei2",
			}},
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
	t.Run("TestSuperadmin", testIsSuperadmin)
	t.Run("Test Admin", testIsAdmin)
	t.Run("Test Allow Org Member", testAllowOrgMember)
	t.Run("Test Allow Org Admin", testAllowOrgAdmin)
	t.Run("Test Allow Project Member", testAllowProjectMember)
	t.Run("Test Allow Project Admin", testAllowProjectAdmin)
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

func testIsSuperadmin(t *testing.T) {
	role := &pkg.UserRoles{Role: pkg.SUPERADMIN}
	isSuper := shared.IsSuperadmin([]*pkg.UserRoles{role})
	assert.Equal(t, true, isSuper)
}

func testIsAdmin(t *testing.T) {
	role1 := &pkg.UserRoles{Role: pkg.ADMIN}
	role2 := &pkg.UserRoles{Role: pkg.USER}
	isAdmin, _ := shared.IsAdmin([]*pkg.UserRoles{role1, role2})
	assert.Equal(t, true, isAdmin)
}

func testAllowOrgMember(t *testing.T) {
	validOrg := utilities.NewID()
	roleErr := []*pkg.UserRoles{&pkg.UserRoles{Role: pkg.ADMIN}}
	allowed, err := shared.AllowOrgMember(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleErr,
		Verified: true,
	}, validOrg)
	assert.Error(t, err)
	assert.Equal(t, false, allowed)

	roleValid := []*pkg.UserRoles{{Role: pkg.USER, OrgID: validOrg}}
	allowed, err = shared.AllowOrgMember(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleValid,
		Verified: true,
	}, validOrg)
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)
}

func testAllowOrgAdmin(t *testing.T) {
	validOrg := utilities.NewID()
	roleErr := []*pkg.UserRoles{{Role: pkg.ADMIN}, {Role: pkg.USER, OrgID: validOrg}}
	allowed, err := shared.AllowOrgAdmin(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleErr,
		Verified: true,
		Disabled: false,
	}, "")
	assert.Error(t, err)
	assert.Equal(t, false, allowed)

	roleValid := []*pkg.UserRoles{{Role: pkg.USER}, {Role: pkg.ADMIN, OrgID: validOrg}}
	allowed, err = shared.AllowOrgAdmin(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleValid,
		Verified: true,
		Disabled: false,
	}, validOrg)
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)
}

func testAllowProjectMember(t *testing.T) {
	validOrg := utilities.NewID()
	validProject := utilities.NewID()
	t.Log("with no projectId")
	roleValid3 := []*pkg.UserRoles{{Role: pkg.ADMIN}, {Role: pkg.USER, OrgID: validOrg}}
	allowed, err := shared.AllowProjectMember(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleValid3,
		Verified: true,
	}, validProject)
	assert.Error(t, err)
	assert.Equal(t, false, allowed)

	t.Log("with right project id")
	roleValid1 := []*pkg.UserRoles{{Role: pkg.USER, OrgID: validOrg, ProjectID: validProject}}
	allowed, err = shared.AllowProjectMember(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleValid1,
		Verified: true,
	}, validProject)
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)
}

func testAllowProjectAdmin(t *testing.T) {
	validOrg := utilities.NewID()
	validProject := utilities.NewID()
	roleErr := []*pkg.UserRoles{{Role: pkg.USER, OrgID: validOrg}}
	allowed, err := shared.AllowProjectAdmin(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleErr,
		Verified: true,
	}, validOrg, validProject)
	assert.Error(t, err)
	assert.Equal(t, false, allowed)

	roleValid1 := []*pkg.UserRoles{{Role: pkg.ADMIN, OrgID: validOrg}}
	allowed, err = shared.AllowProjectAdmin(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleValid1,
		Verified: true,
	}, validOrg, "")
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)

	roleValid2 := []*pkg.UserRoles{{Role: pkg.ADMIN, OrgID: validOrg, ProjectID: validProject}}
	allowed, err = shared.AllowProjectAdmin(&pkg.Account{
		Id:    utilities.NewID(),
		Email: "someemail@example.com",
		Role:  roleValid2,
		Verified: true,
	}, validOrg, validProject)
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)
}
