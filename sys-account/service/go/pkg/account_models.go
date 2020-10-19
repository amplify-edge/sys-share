package pkg

import (
	"google.golang.org/protobuf/types/known/structpb"

	accountRpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
)

type Permission struct {
	Resource     string   `json:"resource"`
	ResourceKind string   `json:"resourceKind"`
	Activities   []string `json:"activities"`
}

func (p *Permission) ToProto() *accountRpc.Permission {
	return &accountRpc.Permission{
		Resource:     p.Resource,
		ResourceKind: p.ResourceKind,
		Activities:   p.Activities,
	}
}

func PermissionFromProto(ap *accountRpc.Permission) *Permission {
	return &Permission{
		Resource:     ap.Resource,
		ResourceKind: ap.ResourceKind,
		Activities:   ap.Activities,
	}
}

type Roles int32

func (r Roles) ToProto() accountRpc.Roles {
	return accountRpc.Roles(r)
}

func RolesFromProto(r accountRpc.Roles) Roles {
	return Roles(r.Number())
}

type UserRoles struct {
	Role      Roles  `json:"role,omitempty"`
	ProjectID string `json:"projectId,omitempty"`
	OrgID     string `json:"orgId,omitempty"`
	All       bool   `json:"all,omitempty"`
}

func (ur *UserRoles) ToProto() *accountRpc.UserRoles {
	role := ur.Role.ToProto()
	return &accountRpc.UserRoles{
		Role:    role,
		Project: &accountRpc.Project{Id: ur.ProjectID},
		Org:     &accountRpc.Org{Id: ur.OrgID},
		All:     ur.All,
	}
}

func UserRolesFromProto(in *accountRpc.UserRoles) *UserRoles {
	return &UserRoles{
		Role:      RolesFromProto(in.GetRole()),
		ProjectID: in.GetProject().Id,
		OrgID:     in.GetOrg().Id,
		All:       in.GetAll(),
	}
}

type UserDefinedFields struct {
	Fields map[string]interface{} `json:"fields,omitempty"`
}

func UserDefinedFieldsFromProto(in *accountRpc.UserDefinedFields) *UserDefinedFields {
	fields := map[string]interface{}{}
	if in != nil {
		for k, v := range in.Fields {
			fields[k] = v
		}
	}
	return &UserDefinedFields{Fields: fields}
}

func (udf *UserDefinedFields) ToProto() (*accountRpc.UserDefinedFields, error) {
	userFields := map[string]*structpb.Value{}
	var err error
	for k, v := range udf.Fields {
		userFields[k], err = structpb.NewValue(v)
		if err != nil {
			return nil, err
		}
	}
	return &accountRpc.UserDefinedFields{Fields: userFields}, nil
}

type Account struct {
	Id        string             `json:"id,omitempty"`
	Email     string             `json:"email,omitempty"`
	Password  string             `json:"password,omitempty"`
	Role      *UserRoles         `json:"role,omitempty"`
	CreatedAt int64              `json:"created_at,omitempty"`
	UpdatedAt int64              `json:"updated_at,omitempty"`
	LastLogin int64              `json:"last_login,omitempty"`
	Disabled  bool               `json:"disabled,omitempty"`
	Fields    *UserDefinedFields `json:"fields,omitempty"`
	Survey    *UserDefinedFields `json:"survey,omitempty"`
}

func (acc *Account) GetEmail() string {
	return acc.Email
}

func (acc *Account) GetRole() *UserRoles {
	return acc.Role
}

func (acc *Account) ToProto() (*accountRpc.Account, error) {
	role := acc.Role.ToProto()
	surveyFields, err := acc.Survey.ToProto()
	if err != nil {
		return nil, err
	}
	fields, err := acc.Fields.ToProto()
	if err != nil {
		return nil, err
	}
	return &accountRpc.Account{
		Id:        acc.Id,
		Email:     acc.Email,
		Password:  acc.Password,
		Role:      role,
		CreatedAt: unixToUtcTS(acc.CreatedAt),
		UpdatedAt: unixToUtcTS(acc.UpdatedAt),
		LastLogin: unixToUtcTS(acc.LastLogin),
		Disabled:  acc.Disabled,
		Fields:    fields,
		Survey:    surveyFields,
	}, nil
}

func AccountFromProto(in *accountRpc.Account) *Account {
	role := UserRolesFromProto(in.GetRole())
	fields := UserDefinedFieldsFromProto(in.Fields)
	return &Account{
		Id:        in.GetId(),
		Email:     in.GetEmail(),
		Password:  in.GetPassword(),
		Role:      role,
		CreatedAt: tsToUnixUTC(in.GetCreatedAt()),
		UpdatedAt: tsToUnixUTC(in.GetUpdatedAt()),
		LastLogin: tsToUnixUTC(in.GetLastLogin()),
		Disabled:  in.Disabled,
		Fields:    fields,
	}
}

type GetAccountRequest struct {
	Id string `json:"id,omitempty"`
}

func (gar *GetAccountRequest) ToProto() *accountRpc.GetAccountRequest {
	return &accountRpc.GetAccountRequest{Id: gar.Id}
}

type ListAccountsRequest struct {
	PerPageEntries int64  `json:"perPageEntries,omitempty"`
	OrderBy        string `json:"orderBy,omitempty"`
	CurrentPageId  string `json:"currentPageId,omitempty"`
}

func (lar *ListAccountsRequest) ToProto() *accountRpc.ListAccountsRequest {
	return &accountRpc.ListAccountsRequest{
		PerPageEntries: lar.PerPageEntries,
		OrderBy:        lar.OrderBy,
		CurrentPageId:  lar.CurrentPageId,
	}
}

func ListAccountsRequestFromProto(in *accountRpc.ListAccountsRequest) *ListAccountsRequest {
	return &ListAccountsRequest{
		PerPageEntries: in.GetPerPageEntries(),
		OrderBy:        in.GetOrderBy(),
		CurrentPageId:  in.GetCurrentPageId(),
	}
}

type ListAccountsResponse struct {
	Accounts   []*Account `json:"accounts,omitempty"`
	NextPageId string     `json:"nextPageId,omitempty"`
}

func (lsp *ListAccountsResponse) ToProto() (*accountRpc.ListAccountsResponse, error) {
	var accs []*accountRpc.Account
	for _, acc := range lsp.Accounts {
		account, err := acc.ToProto()
		if err != nil {
			return nil, err
		}
		accs = append(accs, account)
	}
	return &accountRpc.ListAccountsResponse{
		Accounts:   accs,
		NextPageId: lsp.NextPageId,
	}, nil
}

func ListAccountsResponseFromProto(resp *accountRpc.ListAccountsResponse) *ListAccountsResponse {
	var accs []*Account
	for _, acc := range resp.Accounts {
		account := AccountFromProto(acc)
		accs = append(accs, account)
	}
	return &ListAccountsResponse{
		Accounts:   accs,
		NextPageId: resp.GetNextPageId(),
	}
}

type SearchAccountsRequest struct {
	Query       map[string]string    `json:"query,omitempty"`
	SearchParam *ListAccountsRequest `json:"searchParam,omitempty"`
}

func (sar *SearchAccountsRequest) ToProto() (*accountRpc.SearchAccountsRequest, error) {
	var err error
	searchParam := sar.SearchParam.ToProto()
	queryFields := map[string]*structpb.Value{}
	for k, v := range sar.Query {
		queryFields[k], err = structpb.NewValue(v)
		if err != nil {
			return nil, err
		}
	}
	return &accountRpc.SearchAccountsRequest{
		Query:        queryFields,
		SearchParams: searchParam,
	}, nil
}

type SearchAccountsResponse struct {
	SearchResponse *ListAccountsResponse `json:"listAccountsResponse,omitempty"`
}

func (sar *SearchAccountsResponse) ToProto() (*accountRpc.SearchAccountsResponse, error) {
	listResp, err := sar.SearchResponse.ToProto()
	if err != nil {
		return nil, err
	}
	return &accountRpc.SearchAccountsResponse{SearchResponse: listResp}, nil
}

func SearchAccountResponseFromProto(in *accountRpc.SearchAccountsResponse) *SearchAccountsResponse {
	return &SearchAccountsResponse{SearchResponse: ListAccountsResponseFromProto(in.GetSearchResponse())}
}

type AssignAccountToRoleRequest struct {
	AssigneeAccountId string    `json:"assigneeAccountId,omitempty"`
	AssignedAccountId string    `json:"assignedAccountId,omitempty"`
	Role              UserRoles `json:"role,omitempty"`
}

func (aatr *AssignAccountToRoleRequest) ToProto() *accountRpc.AssignAccountToRoleRequest {
	role := aatr.Role.ToProto()
	return &accountRpc.AssignAccountToRoleRequest{
		AssigneeAccountId: aatr.AssigneeAccountId,
		AssignedAccountId: aatr.AssignedAccountId,
		Role:              role,
	}
}

type DisableAccountRequest struct {
	AccountId string `json:"accountId,omitempty"`
}

func (dar *DisableAccountRequest) ToProto() *accountRpc.DisableAccountRequest {
	return &accountRpc.DisableAccountRequest{AccountId: dar.AccountId}
}


