package fakedata

import (
	"fmt"
	"github.com/brianvoe/gofakeit/v5"
	accountRpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	"github.com/getcouragenow/sys-share/sys-core/service/fakehelper"
	"math/rand"
)

type bootstrapSuperUser struct {
	SuperUsers []*accountRpc.LoginRequest `fakesize:"4" json:"new_superusers" yaml:"new_superusers"`
}

type bootstrapOrgs struct {
	Orgs []*accountRpc.OrgRequest `fakesize:"20" json:"new_orgs" yaml:"new_orgs"`
}

type bootstrapProjects struct {
	Projects []*accountRpc.ProjectRequest `fakesize:"100" json:"new_projects" yaml:"new_projects"`
}

type BootstrapSysAccount struct {
	SuperUsers bootstrapSuperUser `json:"bootstrap_superusers" yaml:"bootstrap_superusers"`
	Orgs       bootstrapOrgs      `json:"bootstrap_orgs" yaml:"bootstrap_orgs"`
	Projects   bootstrapProjects  `json:"bootstrap_projects" yaml:"bootstrap_projects"`
}

func (b *BootstrapSysAccount) GetSuperUsers() []*accountRpc.LoginRequest {
	return b.SuperUsers.SuperUsers
}

func (b *BootstrapSysAccount) GetOrgs() []*accountRpc.OrgRequest {
	return b.Orgs.Orgs
}

func (b *BootstrapSysAccount) GetProjects() []*accountRpc.ProjectRequest {
	return b.Projects.Projects
}

func (b *BootstrapSysAccount) MarshalPretty() ([]byte, error) {
	return sharedConfig.MarshalPretty(b)
}

func (b *BootstrapSysAccount) MarshalYAML() ([]byte, error) {
	return sharedConfig.MarshalYAML(b)
}

func BootstrapFakeData(domain string) (*fakehelper.RefCount, *fakehelper.RefCount, *fakehelper.RefCount, *BootstrapSysAccount, error) {
	// internal counter
	accRefCount, orgRefCount, projectRefCount := fakehelper.NewRefCount(), fakehelper.NewRefCount(), fakehelper.NewRefCount()
	// seeder
	gofakeit.Seed(sharedConfig.CurrentTimestamp())
	// generate fake sequence
	gofakeit.AddFuncLookup(fakehelper.FakeAvatarGen())
	gofakeit.AddFuncLookup(fakehelper.FakeNameSequence(
		func(prefix, referral string, isRef, isUniqueRef, reset bool) (interface{}, error) {
			var rc, referralRc *fakehelper.RefCount
			switch prefix {
			case "sys_account_email":
				rc = accRefCount
			case "sys_account_org":
				rc = orgRefCount
			case "sys_account_project":
				rc = projectRefCount
			default:
				rc = fakehelper.NewRefCount()
			}
			if isRef {
				switch referral {
				case "sys_account_email":
					referralRc = accRefCount
				case "sys_account_org":
					referralRc = orgRefCount
				case "sys_account_project":
					referralRc = projectRefCount
				default:
					referralRc = fakehelper.NewRefCount()
				}
				if isUniqueRef {
					if referralRc.LastReference > referralRc.Sequence {
						return nil, fmt.Errorf("reference amounted more than available referral")
					}
					seq := referralRc.LastReference
					referralRc.LastReference += 1
					return fmt.Sprintf("%s_%d", prefix, seq), nil
				} else {
					return fmt.Sprintf("%s_%d", prefix, rand.Intn(referralRc.Sequence)), nil
				}
			}
			rc.Previous = rc.Sequence
			rc.Sequence += 1
			return fmt.Sprintf("%s_%d", prefix, rc.Previous), nil
		},
	))
	gofakeit.AddFuncLookup(fakehelper.FakeMailSequence(
		func(prefix, referral string, isRef, isUniqueRef bool) (interface{}, error) {
			var rc, referralRc *fakehelper.RefCount
			rc = accRefCount
			if isRef {
				switch referral {
				case "sys_account_email":
					referralRc = accRefCount
				default:
					referralRc = fakehelper.NewRefCount()
				}
				if isUniqueRef {
					if referralRc.LastReference > referralRc.Sequence {
						return nil, fmt.Errorf("reference amounted more than available referral")
					}
					seq := referralRc.LastReference
					referralRc.LastReference += 1
					return fmt.Sprintf("%s_%d@%s", prefix, seq, domain), nil
				} else {
					return fmt.Sprintf("%s_%d@%s", prefix, rand.Intn(referralRc.Sequence), domain), nil
				}
			}
			rc.Previous = rc.Sequence
			rc.Sequence += 1
			return fmt.Sprintf("%s_%d@%s", prefix, rc.Previous, domain), nil
		},
	))
	var bsp bootstrapProjects
	var bsu bootstrapSuperUser
	var bso bootstrapOrgs
	gofakeit.Struct(&bsu)
	gofakeit.Struct(&bso)
	gofakeit.Struct(&bsp)
	bmd := &BootstrapSysAccount{
		Projects:   bsp,
		SuperUsers: bsu,
		Orgs:       bso,
	}
	// mp, err := bmd.MarshalPretty()
	accRc := accRefCount.ResetLastReference()
	orgRc := orgRefCount.ResetLastReference()
	projRc := projectRefCount.ResetLastReference()
	return accRc, orgRc, projRc, bmd, nil
}

func BootstrapFromFilepath(path string) (*BootstrapSysAccount, error) {
	var bsAccount BootstrapSysAccount
	if err := fakehelper.UnmarshalFromFilepath(path, &bsAccount); err != nil {
		return nil, err
	}
	return &bsAccount, nil
}
