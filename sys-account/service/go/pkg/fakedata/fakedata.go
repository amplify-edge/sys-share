package fakedata

import (
	"fmt"
	"github.com/brianvoe/gofakeit/v5"
	accountRpc "go.amplifyedge.org/sys-share-v2/sys-account/service/go/rpc/v2"
	sharedConfig "go.amplifyedge.org/sys-share-v2/sys-core/service/config"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/fakehelper"
	"math/rand"
)

type bootstrapRegularUser struct {
	UserAccounts []*accountRpc.AccountNewRequest `fakesize:"15" json:"new_accounts" yaml:"new_accounts"`
}

type bootstrapOrgs struct {
	Orgs []*accountRpc.OrgRequest `fakesize:"3" json:"new_orgs" yaml:"new_orgs"`
}

type bootstrapProjects struct {
	Projects []*accountRpc.ProjectRequest `fakesize:"6" json:"new_projects" yaml:"new_projects"`
}

type BootstrapSysAccount struct {
	UserAccounts bootstrapRegularUser `json:"bootstrap_user_accounts" yaml:"bootstrap_regular_accounts"`
	Orgs         bootstrapOrgs        `json:"bootstrap_orgs" yaml:"bootstrap_orgs"`
	Projects     bootstrapProjects    `json:"bootstrap_projects" yaml:"bootstrap_projects"`
}

func (b *BootstrapSysAccount) GetUserAccounts() []*accountRpc.AccountNewRequest {
	return b.UserAccounts.UserAccounts
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
	// gofakeit.AddFuncLookup(fakehelper.FakeAvatarGen())
	gofakeit.AddFuncLookup(fakehelper.FakeAvatarGenBytes())
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
	var bso bootstrapOrgs
	var bsru bootstrapRegularUser
	gofakeit.Struct(&bso)
	gofakeit.Struct(&bsp)
	gofakeit.Struct(&bsru)
	bmd := &BootstrapSysAccount{
		Projects:     bsp,
		Orgs:         bso,
		UserAccounts: bsru,
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
