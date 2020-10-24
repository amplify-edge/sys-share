package shared

import (
	"fmt"
	"github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	"github.com/segmentio/ksuid"
)

func IsSuperadmin(in *pkg.UserRoles) bool {
	return in.Role == pkg.SUPERADMIN
}

func IsAdmin(in *pkg.UserRoles) bool {
	return in.Role == pkg.ADMIN
}

func validKsuid(in string) error {
	_, err := ksuid.Parse(in)
	if err != nil {
		return err
	}
	return nil
}

func AllowOrgMember(curAcc *pkg.Account, accountOrgId string) (bool, error) {
	allowed := curAcc.Role.OrgID == accountOrgId || IsSuperadmin(curAcc.Role)
	if !allowed {
		return false, fmt.Errorf("not allowed to access org: %s", accountOrgId)
	}
	return allowed, nil
}

func AllowProjectMember(curAcc *pkg.Account, accountProjectId string) (bool, error) {
	allowed := curAcc.Role.ProjectID == accountProjectId || IsSuperadmin(curAcc.Role)
	if !allowed {
		return false, fmt.Errorf("not allowed to access project: %s", accountProjectId)
	}
	return allowed, nil
}

func AllowOrgAdmin(curAcc *pkg.Account, accountOrgId string) (bool, error) {
	isAdm := IsAdmin(curAcc.Role)
	allowMember, err := AllowOrgMember(curAcc, accountOrgId)
	if err != nil {
		return false, err
	}
	return (isAdm && allowMember) || IsSuperadmin(curAcc.Role), nil
}

func AllowProjectAdmin(curAcc *pkg.Account, accountOrgId, accountProjectId string) (bool, error) {
	isAdm := IsAdmin(curAcc.Role)
	allowMember, err := AllowProjectMember(curAcc, accountProjectId)
	if err != nil {
		return false, err
	}
	if accountOrgId != "" {
		allowOrgAdmin, err := AllowOrgAdmin(curAcc, accountOrgId)
		if err != nil {
			return false, err
		}
		return (isAdm && allowMember) || allowOrgAdmin || IsSuperadmin(curAcc.Role), nil
	}
	return (isAdm && allowMember) || IsSuperadmin(curAcc.Role), nil
}

func AllowSelf(curAcc *pkg.Account, accountId string) bool {
	return curAcc.Id == accountId && !curAcc.Disabled && curAcc.Verified
}
