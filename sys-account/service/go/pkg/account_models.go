package pkg

import (
	accountRpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
	"github.com/segmentio/encoding/json"
	log "github.com/sirupsen/logrus"
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

const (
	INVALID    = Roles(accountRpc.Roles_INVALID)
	GUEST      = Roles(accountRpc.Roles_GUEST)
	USER       = Roles(accountRpc.Roles_USER)
	ADMIN      = Roles(accountRpc.Roles_ADMIN)      // can be Org or Project Admin
	SUPERADMIN = Roles(accountRpc.Roles_SUPERADMIN) // can do all
)

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
		Role:      role,
		ProjectId: ur.ProjectID,
		OrgId:     ur.OrgID,
		All:       ur.All,
	}
}

func UserRolesFromProto(in *accountRpc.UserRoles) *UserRoles {
	return &UserRoles{
		Role:      RolesFromProto(in.GetRole()),
		ProjectID: in.GetProjectId(),
		OrgID:     in.GetOrgId(),
		All:       in.GetAll(),
	}
}

type UserDefinedFields struct {
	Fields map[string]interface{} `json:"fields,omitempty"`
}

func UserDefinedFieldsFromProto(in *accountRpc.UserDefinedFields) (*UserDefinedFields, error) {
	fields := map[string]interface{}{}
	if in != nil && in.Fields != nil {
		if err := json.Unmarshal(in.Fields, &fields); err != nil {
			return nil, err
		}
	}
	return &UserDefinedFields{Fields: fields}, nil
}

func (udf *UserDefinedFields) ToProto() (*accountRpc.UserDefinedFields, error) {
	fields, err := json.Marshal(udf.Fields)
	if err != nil {
		return nil, err
	}
	return &accountRpc.UserDefinedFields{Fields: fields}, nil
}

type Account struct {
	Id        string             `json:"id,omitempty"`
	Email     string             `json:"email,omitempty"`
	Password  string             `json:"password,omitempty"`
	Role      []*UserRoles       `json:"roles,omitempty"`
	CreatedAt int64              `json:"created_at,omitempty"`
	UpdatedAt int64              `json:"updated_at,omitempty"`
	LastLogin int64              `json:"last_login,omitempty"`
	Disabled  bool               `json:"disabled,omitempty"`
	Fields    *UserDefinedFields `json:"fields,omitempty"`
	Survey    *UserDefinedFields `json:"survey,omitempty"`
	Verified  bool               `json:"verified,omitempty"`
}

func (acc *Account) GetId() string {
	return acc.Id
}

func (acc *Account) GetEmail() string {
	return acc.Email
}

func (acc *Account) GetRole() []*UserRoles {
	return acc.Role
}

func (acc *Account) ToProto() (*accountRpc.Account, error) {
	var roles []*accountRpc.UserRoles
	if len(acc.Role) > 0 {
		for _, r := range acc.Role {
			role := r.ToProto()
			roles = append(roles, role)
		}
	}
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
		Roles:     roles,
		CreatedAt: unixToUtcTS(acc.CreatedAt),
		UpdatedAt: unixToUtcTS(acc.UpdatedAt),
		LastLogin: unixToUtcTS(acc.LastLogin),
		Disabled:  acc.Disabled,
		Fields:    fields,
		Survey:    surveyFields,
		Verified:  acc.Verified,
	}, nil
}

func AccountFromProto(in *accountRpc.Account) (*Account, error) {
	var roles []*UserRoles
	log.Debugf("converting account from protobuf")
	if in.Roles !=  nil && len(in.Roles) > 0 {
		for _, r := range in.Roles {
			role := UserRolesFromProto(r)
			roles = append(roles, role)
		}
	}
	fields, err := UserDefinedFieldsFromProto(in.Fields)
	if err != nil {
		return nil, err
	}
	return &Account{
		Id:        in.GetId(),
		Email:     in.GetEmail(),
		Password:  in.GetPassword(),
		Role:      roles,
		CreatedAt: tsToUnixUTC(in.GetCreatedAt()),
		UpdatedAt: tsToUnixUTC(in.GetUpdatedAt()),
		LastLogin: tsToUnixUTC(in.GetLastLogin()),
		Disabled:  in.Disabled,
		Fields:    fields,
		Verified:  in.Verified,
	}, nil
}

type GetAccountRequest struct {
	Id string `json:"id,omitempty"`
}

func (gar *GetAccountRequest) ToProto() *accountRpc.GetAccountRequest {
	return &accountRpc.GetAccountRequest{Id: gar.Id}
}

type ListAccountsRequest struct {
	PerPageEntries int64                  `json:"perPageEntries,omitempty"`
	OrderBy        string                 `json:"orderBy,omitempty"`
	CurrentPageId  string                 `json:"currentPageId,omitempty"`
	IsDescending   bool                   `json:"isDescending,omitempty"`
	Filters        map[string]interface{} `json:"filters,omitempty"`
}

func (lar *ListAccountsRequest) ToProto() (*accountRpc.ListAccountsRequest, error) {
	var rpcFilter []byte
	var err error
	if lar.Filters != nil {
		rpcFilter, err = json.Marshal(&lar.Filters)
		if err != nil {
			return nil, err
		}
	}
	return &accountRpc.ListAccountsRequest{
		PerPageEntries: lar.PerPageEntries,
		OrderBy:        lar.OrderBy,
		CurrentPageId:  lar.CurrentPageId,
		IsDescending:   lar.IsDescending,
		Filters:        rpcFilter,
	}, nil
}

func ListAccountsRequestFromProto(in *accountRpc.ListAccountsRequest) (*ListAccountsRequest, error) {
	pkgFilter := map[string]interface{}{}
	if in.Filters != nil {
		err := json.Unmarshal(in.Filters, &pkgFilter)
		if err != nil {
			return nil, err
		}
	}
	return &ListAccountsRequest{
		PerPageEntries: in.GetPerPageEntries(),
		OrderBy:        in.GetOrderBy(),
		CurrentPageId:  in.GetCurrentPageId(),
		IsDescending:   in.GetIsDescending(),
		Filters:        pkgFilter,
	}, nil
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

func ListAccountsResponseFromProto(resp *accountRpc.ListAccountsResponse) (*ListAccountsResponse, error) {
	var accs []*Account
	for _, acc := range resp.Accounts {
		account, err := AccountFromProto(acc)
		if err != nil {
			return nil, err
		}
		accs = append(accs, account)
	}
	return &ListAccountsResponse{
		Accounts:   accs,
		NextPageId: resp.GetNextPageId(),
	}, nil
}

type SearchAccountsRequest struct {
	Query       map[string]interface{} `json:"query,omitempty"`
	SearchParam *ListAccountsRequest   `json:"searchParam,omitempty"`
}

func (sar *SearchAccountsRequest) ToProto() (*accountRpc.SearchAccountsRequest, error) {
	var err error
	searchParam, err := sar.SearchParam.ToProto()
	if err != nil {
		return nil, err
	}
	queryFields, err := json.Marshal(&sar.Query)
	if err != nil {
		return nil, err
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

func SearchAccountResponseFromProto(in *accountRpc.SearchAccountsResponse) (*SearchAccountsResponse, error) {
	larp, err := ListAccountsResponseFromProto(in.GetSearchResponse())
	if err != nil {
		return nil, err
	}
	return &SearchAccountsResponse{SearchResponse: larp}, nil
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
