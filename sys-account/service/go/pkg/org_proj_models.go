package pkg

import (
	accountRpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
	"github.com/segmentio/encoding/json"
)

type Project struct {
	Id        string `json:"id,omitempty"`
	Name      string `json:"name,omitempty"`
	LogoUrl   string `json:"logoUrl,omitempty"`
	CreatedAt int64  `json:"createdAt,omitempty"`
	CreatorId string `json:"creatorId,omitempty"`
	OrgId     string `json:"orgId,omitempty"`
	Org       *Org   `json:"org,omitempty"`
}

func (p *Project) ToProto() *accountRpc.Project {
	return &accountRpc.Project{
		Id:        p.Id,
		Name:      p.Name,
		LogoUrl:   p.LogoUrl,
		CreatedAt: unixToUtcTS(p.CreatedAt),
		CreatorId: p.CreatorId,
		OrgId:     p.OrgId,
		Org:       p.Org.ToProto(),
	}
}

func ProjectFromProto(in *accountRpc.Project) *Project {
	return &Project{
		Id:        in.GetId(),
		Name:      in.GetName(),
		LogoUrl:   in.GetLogoUrl(),
		CreatedAt: tsToUnixUTC(in.GetCreatedAt()),
		CreatorId: in.GetCreatorId(),
		OrgId:     in.OrgId,
		Org:       OrgFromProto(in.Org),
	}
}

type ProjectRequest struct {
	Name      string `json:"name,omitempty"`
	LogoUrl   string `json:"logoUrl,omitempty"`
	CreatedAt int64  `json:"createdAt,omitempty"`
	CreatorId string `json:"creatorId,omitempty"`
	OrgId     string `json:"orgId,omitempty"`
}

func (p *ProjectRequest) ToProto() *accountRpc.ProjectRequest {
	return &accountRpc.ProjectRequest{
		Name:      p.Name,
		LogoUrl:   p.LogoUrl,
		CreatorId: p.CreatorId,
		OrgId:     p.OrgId,
	}
}

func ProjectRequestFromProto(in *accountRpc.ProjectRequest) *ProjectRequest {
	return &ProjectRequest{
		Name:      in.GetName(),
		LogoUrl:   in.GetLogoUrl(),
		CreatorId: in.GetCreatorId(),
		OrgId:     in.OrgId,
	}
}

type ProjectUpdateRequest struct {
	Id      string `json:"id,omitempty"`
	Name    string `json:"name,omitempty"`
	LogoUrl string `json:"logoUrl,omitempty"`
}

func (p *ProjectUpdateRequest) ToProto() *accountRpc.ProjectUpdateRequest {
	return &accountRpc.ProjectUpdateRequest{
		Id:      p.Id,
		Name:    p.Name,
		LogoUrl: p.LogoUrl,
	}
}

func ProjectUpdateRequestFromProto(in *accountRpc.ProjectUpdateRequest) *ProjectUpdateRequest {
	return &ProjectUpdateRequest{
		Id:      in.GetId(),
		Name:    in.GetName(),
		LogoUrl: in.GetLogoUrl(),
	}
}

type Org struct {
	Id        string     `json:"id,omitempty"`
	Name      string     `json:"name,omitempty"`
	LogoUrl   string     `json:"logoUrl,omitempty"`
	Contact   string     `json:"contact,omitempty"`
	CreatedAt int64      `json:"createdAt,omitempty"`
	CreatorId string     `json:"creatorId,omitempty"`
	Projects  []*Project `json:"projects,omitempty"`
}

func (o *Org) ToProto() *accountRpc.Org {
	var projects []*accountRpc.Project
	if o.Projects != nil && len(o.Projects) != 0 {
		for _, p := range o.Projects {
			projects = append(projects, p.ToProto())
		}
	}
	return &accountRpc.Org{
		Id:        o.Id,
		Name:      o.Name,
		LogoUrl:   o.LogoUrl,
		Contact:   o.Contact,
		CreatedAt: unixToUtcTS(o.CreatedAt),
		CreatorId: o.CreatorId,
		Projects:  projects,
	}
}

func OrgFromProto(in *accountRpc.Org) *Org {
	var projects []*Project
	if in.Projects != nil && len(in.Projects) != 0 {
		for _, p := range in.Projects {
			projects = append(projects, ProjectFromProto(p))
		}
	}
	return &Org{
		Id:        in.GetId(),
		Name:      in.GetName(),
		LogoUrl:   in.GetLogoUrl(),
		Contact:   in.GetContact(),
		CreatedAt: tsToUnixUTC(in.GetCreatedAt()),
		CreatorId: in.GetCreatorId(),
		Projects:  projects,
	}
}

type OrgRequest struct {
	Name      string `json:"name,omitempty"`
	LogoUrl   string `json:"logoUrl,omitempty"`
	Contact   string `json:"contact,omitempty"`
	CreatorId string `json:"creatorId,omitempty"`
}

func (o *OrgRequest) ToProto() *accountRpc.OrgRequest {
	return &accountRpc.OrgRequest{
		Name:      o.Name,
		LogoUrl:   o.LogoUrl,
		Contact:   o.Contact,
		CreatorId: o.CreatorId,
	}
}

func OrgRequestFromProto(in *accountRpc.OrgRequest) *OrgRequest {
	return &OrgRequest{
		Name:      in.GetName(),
		LogoUrl:   in.GetLogoUrl(),
		Contact:   in.GetContact(),
		CreatorId: in.GetCreatorId(),
	}
}

type OrgUpdateRequest struct {
	Id      string `json:"id,omitempty"`
	Name    string `json:"name,omitempty"`
	LogoUrl string `json:"logoUrl,omitempty"`
	Contact string `json:"contact,omitempty"`
}

func (o *OrgUpdateRequest) ToProto() *accountRpc.OrgUpdateRequest {
	return &accountRpc.OrgUpdateRequest{
		Id:      o.Id,
		Name:    o.Name,
		LogoUrl: o.LogoUrl,
		Contact: o.Contact,
	}
}

func OrgUpdateRequestFromProto(in *accountRpc.OrgUpdateRequest) *OrgUpdateRequest {
	return &OrgUpdateRequest{
		Id:      in.GetId(),
		Name:    in.GetName(),
		LogoUrl: in.GetLogoUrl(),
		Contact: in.GetContact(),
	}
}

type ListRequest struct {
	PerPageEntries int64                  `json:"perPageEntries,omitempty"`
	OrderBy        string                 `json:"orderBy,omitempty"`
	CurrentPageId  string                 `json:"currentPageId,omitempty"`
	IsDescending   bool                   `json:"isDescending,omitempty"`
	Filters        map[string]interface{} `json:"filters,omitempty"`
}

func (l *ListRequest) ToProto() (*accountRpc.ListRequest, error) {
	rpcFilter := []byte{}
	var err error
	if l.Filters != nil {
		rpcFilter, err = json.Marshal(l.Filters)
		if err != nil {
			return nil, err
		}
	}
	return &accountRpc.ListRequest{
		PerPageEntries: l.PerPageEntries,
		OrderBy:        l.OrderBy,
		CurrentPageId:  l.CurrentPageId,
		IsDescending:   l.IsDescending,
		Filters:        rpcFilter,
	}, nil
}

func ListRequestFromProto(in *accountRpc.ListRequest) (*ListRequest, error) {
	pkgFilter := map[string]interface{}{}
	var err error
	if in.Filters != nil {
		err = json.Unmarshal(in.Filters, &pkgFilter)
		if err != nil {
			return nil, err
		}
	}
	return &ListRequest{
		PerPageEntries: in.GetPerPageEntries(),
		OrderBy:        in.GetOrderBy(),
		CurrentPageId:  in.GetCurrentPageId(),
		IsDescending:   in.GetIsDescending(),
		Filters:        pkgFilter,
	}, nil
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
