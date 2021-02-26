package shared_test

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"go.amplifyedge.org/sys-share-v2/sys-account/service/go/pkg/shared"
	authRpc "go.amplifyedge.org/sys-share-v2/sys-account/service/go/rpc/v2"
	utilities "go.amplifyedge.org/sys-share-v2/sys-core/service/config"
)

var (
	tc             *shared.TokenConfig
	accountSeeders = []*authRpc.Account{
		{
			Id:       "1hpMOKQj30jOrqtB8hLmclWtXGx",
			Email:    "winwisely268@example.com",
			Password: "SOME_HASHED_ARGON",
			Roles:    nil,
		},
		{
			Id:       "1hpMToJZs40ZHEiIuDGQkqtd8oV",
			Email:    "winwisely269@example.com",
			Password: "HATH_NO_FURY_LIKE",
			Roles: []*authRpc.UserRoles{
				{Role: 4, // Superadmin
				},
			},
		},
		{
			Id:       "1hpMToJZs40ZHEiIuDGQkqtd8oV",
			Email:    "winwisely267@example.com",
			Password: "A_CI_BEING_SCORNED",
			Roles: []*authRpc.UserRoles{{
				Role:  3, // Org Admin
				OrgId: "1hpMx8pkde4IGFYdhrASY5cPei2",
			}},
		},
		{
			Id:       "1hpMToJZs40ZHEiIuDGQkqtd8oV",
			Email:    "winwisely267@example.com",
			Password: "WE_WANT_GO_GENERICS",
			Roles: []*authRpc.UserRoles{{
				Role:      2, // Project Admin
				ProjectId: "1hpMx8pkde4IGFYdhrASY5cPei2",
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
	role := &authRpc.UserRoles{Role: authRpc.Roles_SUPERADMIN}
	isSuper := shared.IsSuperadmin([]*authRpc.UserRoles{role})
	assert.Equal(t, true, isSuper)
}

func testIsAdmin(t *testing.T) {
	role1 := &authRpc.UserRoles{Role: authRpc.Roles_ADMIN}
	role2 := &authRpc.UserRoles{Role: authRpc.Roles_USER}
	isAdmin, _ := shared.IsAdmin([]*authRpc.UserRoles{role1, role2})
	assert.Equal(t, true, isAdmin)
}

func testAllowOrgMember(t *testing.T) {
	validOrg := utilities.NewID()
	roleErr := []*authRpc.UserRoles{&authRpc.UserRoles{Role: authRpc.Roles_ADMIN}}
	allowed, err := shared.AllowOrgMember(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleErr,
		Verified: true,
	}, validOrg)
	assert.Error(t, err)
	assert.Equal(t, false, allowed)

	roleValid := []*authRpc.UserRoles{{Role: authRpc.Roles_USER, OrgId: validOrg}}
	allowed, err = shared.AllowOrgMember(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleValid,
		Verified: true,
	}, validOrg)
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)
}

func testAllowOrgAdmin(t *testing.T) {
	validOrg := utilities.NewID()
	roleErr := []*authRpc.UserRoles{{Role: authRpc.Roles_ADMIN}, {Role: authRpc.Roles_USER, OrgId: validOrg}}
	allowed, err := shared.AllowOrgAdmin(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleErr,
		Verified: true,
		Disabled: false,
	}, "")
	assert.Error(t, err)
	assert.Equal(t, false, allowed)

	roleValid := []*authRpc.UserRoles{{Role: authRpc.Roles_USER}, {Role: authRpc.Roles_ADMIN, OrgId: validOrg}}
	allowed, err = shared.AllowOrgAdmin(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleValid,
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
	roleValid3 := []*authRpc.UserRoles{{Role: authRpc.Roles_ADMIN}, {Role: authRpc.Roles_USER, OrgId: validOrg}}
	allowed, err := shared.AllowProjectMember(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleValid3,
		Verified: true,
	}, validProject)
	assert.Error(t, err)
	assert.Equal(t, false, allowed)

	t.Log("with right project id")
	roleValid1 := []*authRpc.UserRoles{{Role: authRpc.Roles_USER, OrgId: validOrg, ProjectId: validProject}}
	allowed, err = shared.AllowProjectMember(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleValid1,
		Verified: true,
	}, validProject)
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)
}

func testAllowProjectAdmin(t *testing.T) {
	validOrg := utilities.NewID()
	validProject := utilities.NewID()
	roleErr := []*authRpc.UserRoles{{Role: authRpc.Roles_USER, OrgId: validOrg}}
	allowed, err := shared.AllowProjectAdmin(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleErr,
		Verified: true,
	}, validOrg, validProject)
	assert.Error(t, err)
	assert.Equal(t, false, allowed)

	roleValid1 := []*authRpc.UserRoles{{Role: authRpc.Roles_ADMIN, OrgId: validOrg}}
	allowed, err = shared.AllowProjectAdmin(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleValid1,
		Verified: true,
	}, validOrg, "")
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)

	roleValid2 := []*authRpc.UserRoles{{Role: authRpc.Roles_ADMIN, OrgId: validOrg, ProjectId: validProject}}
	allowed, err = shared.AllowProjectAdmin(&authRpc.Account{
		Id:       utilities.NewID(),
		Email:    "someemail@example.com",
		Roles:    roleValid2,
		Verified: true,
	}, validOrg, validProject)
	assert.NoError(t, err)
	assert.Equal(t, true, allowed)
}
