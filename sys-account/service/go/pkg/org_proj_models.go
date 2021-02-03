package pkg

import (
	"github.com/segmentio/encoding/json"

	sharedConfig "github.com/amplify-cms/sys-share/sys-core/service/config"

	accountRpc "github.com/amplify-cms/sys-share/sys-account/service/go/rpc/v2"
)

type Project struct {
	Id             string `json:"id,omitempty"`
	Name           string `json:"name,omitempty"`
	LogoResourceId string `json:"logo_resource_id,omitempty"`
	CreatedAt      int64  `json:"created_at,omitempty"`
	CreatorId      string `json:"creator_id,omitempty"`
	OrgId          string `json:"org_id,omitempty"`
	OrgName        string `json:"org_name,omitempty"`
	Org            *Org   `json:"org,omitempty"`
	Logo           []byte `json:"logo,omitempty"`
}

func (p *Project) ToProto() *accountRpc.Project {
	return &accountRpc.Project{
		Id:             p.Id,
		Name:           p.Name,
		LogoResourceId: p.LogoResourceId,
		CreatedAt:      unixToUtcTS(p.CreatedAt),
		CreatorId:      p.CreatorId,
		OrgId:          p.OrgId,
		Org:            p.Org.ToProto(),
		Logo:           p.Logo,
	}
}

func ProjectFromProto(in *accountRpc.Project) *Project {
	return &Project{
		Id:             in.GetId(),
		Name:           in.GetName(),
		LogoResourceId: in.GetLogoResourceId(),
		Logo:           in.GetLogo(),
		CreatedAt:      tsToUnixUTC(in.GetCreatedAt()),
		CreatorId:      in.GetCreatorId(),
		OrgId:          in.OrgId,
		Org:            OrgFromProto(in.Org),
	}
}

type ProjectRequest struct {
	Name            string `json:"name,omitempty"`
	LogoFilepath    string `json:"logo_filepath,omitempty"`
	LogoUploadBytes string `json:"logo_upload_bytes,omitempty"`
	CreatedAt       int64  `json:"created_at,omitempty"`
	CreatorId       string `json:"creator_id,omitempty"`
	OrgId           string `json:"org_id,omitempty"`
	OrgName         string `json:"org_name,omitempty"`
}

func (p *ProjectRequest) ToProto() *accountRpc.ProjectRequest {
	return &accountRpc.ProjectRequest{
		Name:            p.Name,
		LogoFilepath:    p.LogoFilepath,
		LogoUploadBytes: p.LogoUploadBytes,
		CreatorId:       p.CreatorId,
		OrgId:           p.OrgId,
		OrgName:         p.OrgName,
	}
}

func ProjectRequestFromProto(in *accountRpc.ProjectRequest) *ProjectRequest {
	return &ProjectRequest{
		Name:            in.GetName(),
		LogoFilepath:    in.GetLogoFilepath(),
		LogoUploadBytes: in.GetLogoUploadBytes(),
		CreatorId:       in.GetCreatorId(),
		OrgId:           in.GetOrgId(),
		OrgName:         in.GetOrgName(),
	}
}

type ProjectUpdateRequest struct {
	Id              string `json:"id,omitempty"`
	Name            string `json:"name,omitempty"`
	LogoFilepath    string `json:"logo_filepath,omitempty"`
	LogoUploadBytes []byte `json:"logo_upload_bytes,omitempty"`
}

func (p *ProjectUpdateRequest) ToProto() *accountRpc.ProjectUpdateRequest {
	return &accountRpc.ProjectUpdateRequest{
		Id:              p.Id,
		Name:            p.Name,
		LogoFilepath:    p.LogoFilepath,
		LogoUploadBytes: p.LogoUploadBytes,
	}
}

func ProjectUpdateRequestFromProto(in *accountRpc.ProjectUpdateRequest) *ProjectUpdateRequest {
	return &ProjectUpdateRequest{
		Id:              in.GetId(),
		Name:            in.GetName(),
		LogoFilepath:    in.GetLogoFilepath(),
		LogoUploadBytes: in.GetLogoUploadBytes(),
	}
}

type Org struct {
	Id             string     `json:"id,omitempty"`
	Name           string     `json:"name,omitempty"`
	LogoResourceId string     `json:"logo_resource_id,omitempty"`
	Contact        string     `json:"contact,omitempty"`
	CreatedAt      int64      `json:"createdAt,omitempty"`
	CreatorId      string     `json:"creatorId,omitempty"`
	Projects       []*Project `json:"projects,omitempty"`
	Logo           []byte     `json:"logo,omitempty"`
}

func (o *Org) ToProto() *accountRpc.Org {
	var projects []*accountRpc.Project
	if o.Projects != nil && len(o.Projects) != 0 {
		for _, p := range o.Projects {
			projects = append(projects, p.ToProto())
		}
	}
	return &accountRpc.Org{
		Id:             o.Id,
		Name:           o.Name,
		LogoResourceId: o.LogoResourceId,
		Contact:        o.Contact,
		CreatedAt:      unixToUtcTS(o.CreatedAt),
		CreatorId:      o.CreatorId,
		Projects:       projects,
		Logo:           o.Logo,
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
		Id:             in.GetId(),
		Name:           in.GetName(),
		LogoResourceId: in.GetLogoResourceId(),
		Logo:           in.GetLogo(),
		Contact:        in.GetContact(),
		CreatedAt:      tsToUnixUTC(in.GetCreatedAt()),
		CreatorId:      in.GetCreatorId(),
		Projects:       projects,
	}
}

type OrgRequest struct {
	Name            string `json:"name,omitempty"`
	LogoFilepath    string `json:"logo_filepath,omitempty"`
	LogoUploadBytes string `json:"logo_upload_bytes,omitempty"`
	Contact         string `json:"contact,omitempty"`
	CreatorId       string `json:"creatorId,omitempty"`
}

func (o *OrgRequest) ToProto() *accountRpc.OrgRequest {
	return &accountRpc.OrgRequest{
		Name:            o.Name,
		LogoFilepath:    o.LogoFilepath,
		LogoUploadBytes: o.LogoUploadBytes,
		Contact:         o.Contact,
		CreatorId:       o.CreatorId,
	}
}

func OrgRequestFromProto(in *accountRpc.OrgRequest) *OrgRequest {
	return &OrgRequest{
		Name:            in.GetName(),
		LogoFilepath:    in.GetLogoFilepath(),
		LogoUploadBytes: in.GetLogoUploadBytes(),
		Contact:         in.GetContact(),
		CreatorId:       in.GetCreatorId(),
	}
}

type OrgUpdateRequest struct {
	Id              string `json:"id,omitempty"`
	Name            string `json:"name,omitempty"`
	LogoFilepath    string `json:"logo_filepath,omitempty"`
	LogoUploadBytes []byte `json:"logo_upload_bytes,omitempty"`
	Contact         string `json:"contact,omitempty"`
}

func (o *OrgUpdateRequest) ToProto() *accountRpc.OrgUpdateRequest {
	return &accountRpc.OrgUpdateRequest{
		Id:           o.Id,
		Name:         o.Name,
		LogoFilepath: o.LogoFilepath,
		Contact:      o.Contact,
	}
}

func OrgUpdateRequestFromProto(in *accountRpc.OrgUpdateRequest) *OrgUpdateRequest {
	return &OrgUpdateRequest{
		Id:           in.GetId(),
		Name:         in.GetName(),
		LogoFilepath: in.GetLogoFilepath(),
		Contact:      in.GetContact(),
	}
}

type ListRequest struct {
	PerPageEntries int64                  `json:"per_page_entries,omitempty"`
	OrderBy        string                 `json:"order_by,omitempty"`
	CurrentPageId  string                 `json:"current_page_id,omitempty"`
	IsDescending   bool                   `json:"is_descending,omitempty"`
	Filters        map[string]interface{} `json:"filters,omitempty"`
	AccountId      string                 `json:"account_id,omitempty"`
	Matcher        string                 `json:"matcher,omitempty"`
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
		AccountId:      l.AccountId,
		Matcher:        l.Matcher,
	}, nil
}

func ListRequestFromProto(in *accountRpc.ListRequest) (*ListRequest, error) {
	pkgFilter := map[string]interface{}{}
	var err error
	if in.Filters != nil {
		err = sharedConfig.UnmarshalJson(in.Filters, &pkgFilter)
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
		AccountId:      in.GetAccountId(),
		Matcher:        in.GetMatcher(),
	}, nil
}

type ListResponse struct {
	Projects   []*Project `json:"projects,omitempty"`
	Orgs       []*Org     `json:"orgs,omitempty"`
	NextPageId string     `json:"next_page_id,omitempty"`
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
	Id   string `json:"id,omitempty"`
	Name string `json:"name,omitempty"`
}

func (i *IdRequest) ToProto() *accountRpc.IdRequest {
	return &accountRpc.IdRequest{Id: i.Id, Name: i.Name}
}

func IdRequestFromProto(in *accountRpc.IdRequest) *IdRequest {
	return &IdRequest{Id: in.GetId(), Name: in.GetName()}
}
