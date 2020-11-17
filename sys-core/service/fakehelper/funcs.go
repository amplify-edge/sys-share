package fakehelper

import (
	"fmt"
	"github.com/brianvoe/gofakeit/v5"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	"io/ioutil"
	"math/rand"
	"path/filepath"
	"time"
)

var popularYts = []string{
	"https://www.youtube.com/watch?v=MkNeIUgNPQ8",
	"https://www.youtube.com/watch?v=Ssvu2yncgWU",
	"https://www.youtube.com/watch?v=tDexBj46oNI",
	"https://www.youtube.com/watch?v=PQC7VaL7xlc",
	"https://www.youtube.com/watch?v=DHNZeIy4kjs",
	"https://www.youtube.com/watch?v=J5JZNdb50B8",
	"https://www.youtube.com/watch?v=x1T6QFpd0J4",
	"https://www.youtube.com/watch?v=NstTz8iyl-c",
	"https://www.youtube.com/watch?v=r6En29azNBA",
	"https://www.youtube.com/watch?v=hY4yspCQRaM",
}

type RefCount struct {
	Sequence      int
	Previous      int
	LastReference int
}

func NewRefCount() *RefCount {
	return &RefCount{
		Sequence:      0,
		Previous:      0,
		LastReference: 0,
	}
}

// Copies the refcount and resets the last reference
func (r *RefCount) ResetLastReference() *RefCount {
	rc := r
	rc.LastReference = 0
	return rc
}

func FakeNameSequence(callFunc func(prefix, referral string, isRef, isUniqueRef, reset bool) (interface{}, error)) (string, gofakeit.Info) {
	return "nameseq", gofakeit.Info{
		Category:    "nameseq",
		Description: "generate sequential string with number, i.e.: sys_account_project_1",
		Example:     "sys_account",
		Output:      "string",
		Params: []gofakeit.Param{
			{Field: "prefix", Type: "string", Description: "module name or prefix"},
			{Field: "isRef", Type: "bool", Description: "the current field is a reference to another field in another struct", Default: "false"},
			{Field: "referral", Type: "string", Description: "the current field refers to which field"},
			{Field: "isUnique", Type: "bool", Description: "unique flag for reference"},
			{Field: "reset", Type: "bool", Description: "reset reference"},
		},
		Call: func(m *map[string][]string, info *gofakeit.Info) (interface{}, error) {
			prefix, err := info.GetString(m, "prefix")
			if err != nil {
				return nil, err
			}
			isRef, err := info.GetBool(m, "isRef")
			if err != nil {
				return nil, err
			}
			referral, err := info.GetString(m, "referral")
			if err != nil {
				return nil, err
			}
			isUniqueRef, err := info.GetBool(m, "isUnique")
			if err != nil {
				return nil, err
			}
			reset, err := info.GetBool(m, "reset")
			if err != nil {
				return nil, err
			}
			return callFunc(prefix, referral, isRef, isUniqueRef, reset)
		},
	}
}

func FakeMailSequence(callFunc func(prefix, referral string, isRef, isUniqueRef bool) (interface{}, error)) (string, gofakeit.Info) {
	return "mailseq", gofakeit.Info{
		Category:    "mailseq",
		Description: "generate sequential email string with number, i.e.: account1@domain.com",
		Example:     "sys_account",
		Output:      "string",
		Params: []gofakeit.Param{
			{Field: "prefix", Type: "string", Description: "module name or prefix"},
			{Field: "isRef", Type: "bool", Description: "the current field is a reference to another field in another struct", Default: "false"},
			{Field: "referral", Type: "string", Description: "the current field refers to which field"},
			{Field: "isUnique", Type: "bool", Description: "unique flag for reference"},
		},
		Call: func(m *map[string][]string, info *gofakeit.Info) (interface{}, error) {
			prefix, err := info.GetString(m, "prefix")
			if err != nil {
				return nil, err
			}
			isRef, err := info.GetBool(m, "isRef")
			if err != nil {
				return nil, err
			}
			referral, err := info.GetString(m, "referral")
			if err != nil {
				return nil, err
			}
			isUniqueRef, err := info.GetBool(m, "isUnique")
			if err != nil {
				return nil, err
			}
			return callFunc(prefix, referral, isRef, isUniqueRef)
		},
	}
}

func FakeRandomTs() (string, gofakeit.Info) {
	return "randomts", gofakeit.Info{
		Category:    "randomts",
		Description: "generate random protobuf timestamp",
		Example:     "randomts",
		Output:      "int64",
		Params:      []gofakeit.Param{},
		Call: func(m *map[string][]string, info *gofakeit.Info) (interface{}, error) {
			min := time.Date(2021, 1, 0, 0, 0, 0, 0, time.UTC).Unix()
			max := time.Date(2025, 1, 0, 0, 0, 0, 0, time.UTC).Unix()
			delta := max - min

			sec := rand.Int63n(delta) + min
			randDate := time.Unix(sec, 0).UnixNano()
			return randDate, nil
		},
	}
}

// FakeYtUrls generates a random slice of royalty free youtube music video url
// Thanks to Audio Library Plus Channel (https://www.youtube.com/channel/UCht8qITGkBvXKsR1Byln-wA)
// TODO: fetch the channel and append it here instead of hardcoding it.
func FakeYtUrls() (string, gofakeit.Info) {
	return "randomyt", gofakeit.Info{
		Category:    "randomyt",
		Description: "generate a slice of random youtube urls",
		Example:     "randomyt",
		Output:      "string",
		Params:      []gofakeit.Param{},
		Call: func(m *map[string][]string, info *gofakeit.Info) (interface{}, error) {
			ytCount := len(popularYts)
			randomPicks := rand.Intn(ytCount)
			return popularYts[randomPicks], nil
		},
	}
}

// FakeAvatarGen generates and writes random user / project / org letter avatar
// Outputs the filepath to the generated image
// func FakeAvatarGen() (string, gofakeit.Info) {
// 	return "avatargen", gofakeit.Info{
// 		Category: "avatargen",
// 		Description: "generate random user / project / org avatar",
// 		Example: "avatargen:<SEPARATOR i.e. @ or _>,<OUTPUT_DIR>",
// 		Output: "string",
// 		Params: []gofakeit.Param{
// 			{Field: "separator", Type: "string", Description: "separator (i.e. email is @), others are _"},
// 			{Field: "outputdir", Type: "string", Description: "output directory for the generated avatars"},
// 		},
// 		Call: func(m *map[string][]string, info *gofakeit.Info) (interface{}, error) {
// 			sep, err := info.GetString(m, "separator")
// 			if err != nil {
// 				return nil, err
// 			}
// 			outDir, err := info.GetString(m, "outputdir")
// 			if err != nil {
// 				return nil, err
// 			}
// 			if ex, _ := sharedConfig.PathExists(outDir); !ex {
// 				_ = os.MkdirAll(outDir, 0755)
// 			}
// 			switch sep {
// 			case "@": // user's avatar
// 				email := utf8.DecodeRuneInString()
// 			}
//
// 		},
// 	}
// }

func UnmarshalFromFilepath(path string, any interface{}) error {
	f, err := ioutil.ReadFile(path)
	if err != nil {
		return err
	}
	ext := filepath.Ext(path)
	switch ext {
	case ".json":
		if err = sharedConfig.UnmarshalJson(f, any); err != nil {
			return err
		}
	case ".yml", ".yaml":
		if err = sharedConfig.UnmarshalYAML(f, any); err != nil {
			return err
		}
	default:
		return fmt.Errorf("invalid format specified, cannot load bootstrap")
	}
	return nil
}
