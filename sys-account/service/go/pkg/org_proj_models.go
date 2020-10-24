package pkg

import (
	accountRpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
)

type Project struct {
	Id        string `json:"id,omitempty"`
	Name      string `json:"name,omitempty"`
	LogoUrl   string `json:"logoUrl,omitempty"`
	CreatedAt int64  `json:"createdAt,omitempty"`
	CreatorId string `json:"creatorId,omitempty"`
}

func (p *Project) ToProto() *accountRpc.Project {
	return &accountRpc.Project{
		Id:        p.Id,
		Name:      p.Name,
		LogoUrl:   p.LogoUrl,
		CreatedAt: unixToUtcTS(p.CreatedAt),
		CreatorId: p.CreatorId,
	}
}

func ProjectFromProto(in *accountRpc.Project) *Project {
	return &Project{
		Id:        in.GetId(),
		Name:      in.GetName(),
		LogoUrl:   in.GetLogoUrl(),
		CreatedAt: tsToUnixUTC(in.GetCreatedAt()),
		CreatorId: in.GetCreatorId(),
	}
}

type Org struct {
	Id        string `json:"id,omitempty"`
	Name      string `json:"name,omitempty"`
	LogoUrl   string `json:"logoUrl,omitempty"`
	Contact   string `json:"contact,omitempty"`
	CreatedAt int64  `json:"createdAt,omitempty"`
	CreatorId string `json:"creatorId,omitempty"`
}

func (o *Org) ToProto() *accountRpc.Org {
	return &accountRpc.Org{
		Id:        o.Id,
		Name:      o.Name,
		LogoUrl:   o.LogoUrl,
		Contact:   o.Contact,
		CreatedAt: unixToUtcTS(o.CreatedAt),
		CreatorId: o.CreatorId,
	}
}

func OrgFromProto(in *accountRpc.Org) *Org {
	return &Org{
		Id:        in.GetId(),
		Name:      in.GetName(),
		LogoUrl:   in.GetLogoUrl(),
		Contact:   in.GetContact(),
		CreatedAt: tsToUnixUTC(in.GetCreatedAt()),
		CreatorId: in.GetCreatorId(),
	}
}

type ListRequest struct {
	PerPageEntries int64  `json:"perPageEntries,omitempty"`
	OrderBy        string `json:"orderBy,omitempty"`
	CurrentPageId  string `json:"currentPageId,omitempty"`
	IsDescending   bool   `json:"isDescending,omitempty"`
}

func (l *ListRequest) ToProto() *accountRpc.ListRequest {
	return &accountRpc.ListRequest{
		PerPageEntries: l.PerPageEntries,
		OrderBy:        l.OrderBy,
		CurrentPageId:  l.CurrentPageId,
		IsDescending:   l.IsDescending,
	}
}

func ListRequestFromProto(in *accountRpc.ListRequest) *ListRequest {
	return &ListRequest{
		PerPageEntries: in.GetPerPageEntries(),
		OrderBy:        in.GetOrderBy(),
		CurrentPageId:  in.GetCurrentPageId(),
		IsDescending:   in.GetIsDescending(),
	}
}

type ListResponse struct {
	Projects   []*Project `json:"projects,omitempty"`
	Orgs       []*Org     `json:"orgs,omitempty"`
	NextPageId string     `json:"nextPageId,omitempty"`
}

func (l *ListResponse) ToProto() *accountRpc.ListResponse {
	var projs []*accountRpc.Project
	var orgs []*accountRpc.Org
	if l.Projects != nil && len(l.Projects) != 0 {
		for _, p := range l.Projects {
			projs = append(projs, p.ToProto())
		}
	}
	if l.Orgs != nil && len(l.Orgs) != 0 {
		for _, org := range l.Orgs {
			orgs = append(orgs, org.ToProto())
		}
	}
	return &accountRpc.ListResponse{
		Projects:   projs,
		Orgs:       orgs,
		NextPageId: l.NextPageId,
	}
}

func ListResponseFromProto(in *accountRpc.ListResponse) *ListResponse {
	var projs []*Project
	var orgs []*Org
	if in.Projects != nil && len(in.Projects) != 0 {
		for _, p := range in.Projects {
			projs = append(projs, ProjectFromProto(p))
		}
	}
	if in.Orgs != nil && len(in.Orgs) != 0 {
		for _, org := range in.Orgs {
			orgs = append(orgs, OrgFromProto(org))
		}
	}
	return &ListResponse{
		Projects:   projs,
		Orgs:       orgs,
		NextPageId: in.GetNextPageId(),
	}
}

type IdRequest struct {
	Id string `json:"id,omitempty"`
}

func (i *IdRequest) ToProto() *accountRpc.IdRequest {
	return &accountRpc.IdRequest{Id: i.Id}
}

func IdRequestFromProto(in *accountRpc.IdRequest) *IdRequest {
	return &IdRequest{Id: in.GetId()}
}
