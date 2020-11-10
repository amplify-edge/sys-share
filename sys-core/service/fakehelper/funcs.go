package fakehelper

import (
	"github.com/brianvoe/gofakeit/v5"
)

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

func FakeNameSequence(callFunc func(prefix, referral string, isRef, isUniqueRef bool) (interface{}, error)) (string, gofakeit.Info) {
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