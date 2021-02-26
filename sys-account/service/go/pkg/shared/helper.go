package shared

import (
	"fmt"
	"github.com/segmentio/ksuid"
	authRpc "go.amplifyedge.org/sys-share-v2/sys-account/service/go/rpc/v2"
)

func IsSuperadmin(in []*authRpc.UserRoles) bool {
	for _, userRole := range in {
		if userRole.Role == authRpc.Roles_SUPERADMIN {
			return true
		}
	}
	return false
}

func IsDisabled(in *authRpc.Account) bool {
	return in.Disabled
}

func IsVerified(in *authRpc.Account) bool {
	return in.Verified
}

func IsAdmin(in []*authRpc.UserRoles) (bool, *int) {
	for idx, userRole := range in {
		if userRole.Role == authRpc.Roles_ADMIN {
			return true, &idx
		}
	}
	return false, nil
}

func validKsuid(in string) error {
	_, err := ksuid.Parse(in)
	if err != nil {
		return err
	}
	return nil
}

func findOrgId(curAcc *authRpc.Account, orgId string) bool {
	for _, role := range curAcc.Roles {
		if role.OrgId == orgId {
			return true
		}
	}
	return false
}

func findProjectId(curAcc *authRpc.Account, projId string) bool {
	for _, role := range curAcc.Roles {
		if role.ProjectId == projId {
			return true
		}
	}
	return false
}

func AllowOrgMember(curAcc *authRpc.Account, accountOrgId string) (bool, error) {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	allowed := findOrgId(curAcc, accountOrgId) || IsSuperadmin(curAcc.Roles)
	if !allowed {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	return allowed, nil
}

func AllowProjectMember(curAcc *authRpc.Account, accountProjectId string) (bool, error) {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false, fmt.Errorf("not allowed to access project: %s", accountProjectId)
	}
	allowed := findProjectId(curAcc, accountProjectId) || IsSuperadmin(curAcc.Roles)
	if !allowed {
		return false, fmt.Errorf("not allowed to access project: %s", accountProjectId)
	}
	return allowed, nil
}

func AllowOrgAdmin(curAcc *authRpc.Account, accountOrgId string) (bool, error) {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	if accountOrgId == "" {
		return false, fmt.Errorf("not allowed, empty org id")
	}
	isAdm, idx := IsAdmin(curAcc.Roles)
	if !isAdm || IsSuperadmin(curAcc.Roles) {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	return curAcc.Roles[*idx].OrgId == accountOrgId || IsSuperadmin(curAcc.Roles), nil
}

func AllowProjectAdmin(curAcc *authRpc.Account, accountOrgId, accountProjectId string) (bool, error) {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false, fmt.Errorf("not allowed to access project: %s", accountProjectId)
	}
	isAdm, idx := IsAdmin(curAcc.Roles)
	if !isAdm || IsSuperadmin(curAcc.Roles) {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	if accountProjectId == "" && accountOrgId != "" {
		allowOrgAdmin, err := AllowOrgAdmin(curAcc, accountOrgId)
		if err != nil {
			return false, err
		}
		return allowOrgAdmin, nil
	}
	return curAcc.Roles[*idx].ProjectId == accountProjectId || IsSuperadmin(curAcc.Roles), nil
}

func AllowSelf(curAcc *authRpc.Account, accountId string) bool {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false
	}
	return curAcc.Id == accountId && !curAcc.Disabled && curAcc.Verified
}
