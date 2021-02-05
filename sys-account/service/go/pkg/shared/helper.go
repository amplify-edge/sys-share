package shared

import (
	"fmt"
	"go.amplifyedge.org/sys-share-v2/sys-account/service/go/pkg"
	"github.com/segmentio/ksuid"
)

func IsSuperadmin(in []*pkg.UserRoles) bool {
	for _, userRole := range in {
		if userRole.Role == pkg.SUPERADMIN {
			return true
		}
	}
	return false
}

func IsDisabled(in *pkg.Account) bool {
	return in.Disabled
}

func IsVerified(in *pkg.Account) bool {
	return in.Verified
}

func IsAdmin(in []*pkg.UserRoles) (bool, *int) {
	for idx, userRole := range in {
		if userRole.Role == pkg.ADMIN {
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

func findOrgId(curAcc *pkg.Account, orgId string) bool {
	for _, role := range curAcc.Role {
		if role.OrgID == orgId {
			return true
		}
	}
	return false
}

func findProjectId(curAcc *pkg.Account, projId string) bool {
	for _, role := range curAcc.Role {
		if role.ProjectID == projId {
			return true
		}
	}
	return false
}

func AllowOrgMember(curAcc *pkg.Account, accountOrgId string) (bool, error) {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	allowed := findOrgId(curAcc, accountOrgId) || IsSuperadmin(curAcc.Role)
	if !allowed {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	return allowed, nil
}

func AllowProjectMember(curAcc *pkg.Account, accountProjectId string) (bool, error) {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false, fmt.Errorf("not allowed to access project: %s", accountProjectId)
	}
	allowed := findProjectId(curAcc, accountProjectId) || IsSuperadmin(curAcc.Role)
	if !allowed {
		return false, fmt.Errorf("not allowed to access project: %s", accountProjectId)
	}
	return allowed, nil
}

func AllowOrgAdmin(curAcc *pkg.Account, accountOrgId string) (bool, error) {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	if accountOrgId == "" {
		return false, fmt.Errorf("not allowed, empty org id")
	}
	isAdm, idx := IsAdmin(curAcc.Role)
	if !isAdm || IsSuperadmin(curAcc.Role) {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	return curAcc.Role[*idx].OrgID == accountOrgId || IsSuperadmin(curAcc.Role), nil
}

func AllowProjectAdmin(curAcc *pkg.Account, accountOrgId, accountProjectId string) (bool, error) {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false, fmt.Errorf("not allowed to access project: %s", accountProjectId)
	}
	isAdm, idx := IsAdmin(curAcc.Role)
	if !isAdm || IsSuperadmin(curAcc.Role) {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	if accountProjectId == "" && accountOrgId != "" {
		allowOrgAdmin, err := AllowOrgAdmin(curAcc, accountOrgId)
		if err != nil {
			return false, err
		}
		return allowOrgAdmin, nil
	}
	return curAcc.Role[*idx].ProjectID == accountProjectId || IsSuperadmin(curAcc.Role), nil
}

func AllowSelf(curAcc *pkg.Account, accountId string) bool {
	if IsDisabled(curAcc) || !IsVerified(curAcc) {
		return false
	}
	return curAcc.Id == accountId && !curAcc.Disabled && curAcc.Verified
}
