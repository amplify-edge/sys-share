package pkg

import (
	"github.com/segmentio/encoding/json"

	sharedConfig "github.com/amplify-cms/sys-share/sys-core/service/config"

	accountRpc "github.com/amplify-cms/sys-share/sys-account/service/go/rpc/v2"
)

type Permission struct {
	Resource     string   `json:"resource"`
	ResourceKind string   `json:"resource_kind"`
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

type NewUserRoles struct {
	Role        Roles  `json:"role,omitempty"`
	ProjectID   string `json:"project_id,omitempty"`
	OrgID       string `json:"org_id,omitempty"`
	ProjectName string `json:"project_name,omitempty"`
}

func (nur *NewUserRoles) ToProto() *accountRpc.NewUserRoles {
	role := nur.Role.ToProto()
	return &accountRpc.NewUserRoles{
		Role:        role,
		ProjectId:   nur.ProjectID,
		OrgId:       nur.OrgID,
		ProjectName: nur.ProjectName,
	}
}

func NewUserRolesFromProto(in *accountRpc.NewUserRoles) *NewUserRoles {
	return &NewUserRoles{
		Role:        RolesFromProto(in.GetRole()),
		ProjectID:   in.GetProjectId(),
		OrgID:       in.GetOrgId(),
		ProjectName: in.GetProjectName(),
	}
}

type UserRoles struct {
	Role      Roles  `json:"role,omitempty"`
	ProjectID string `json:"project_id,omitempty"`
	OrgID     string `json:"org_id,omitempty"`
}

func (ur *UserRoles) ToProto() *accountRpc.UserRoles {
	role := ur.Role.ToProto()
	return &accountRpc.UserRoles{
		Role:      role,
		ProjectId: ur.ProjectID,
		OrgId:     ur.OrgID,
	}
}

func UserRolesFromProto(in *accountRpc.UserRoles) *UserRoles {
	return &UserRoles{
		Role:      RolesFromProto(in.GetRole()),
		ProjectID: in.GetProjectId(),
		OrgID:     in.GetOrgId(),
	}
}

type UserDefinedFields struct {
	Fields map[string]interface{} `json:"fields,omitempty"`
}

func UserDefinedFieldsFromProto(in *accountRpc.UserDefinedFields) (*UserDefinedFields, error) {
	fields := map[string]interface{}{}
	if in != nil && in.Fields != nil {
		if err := sharedConfig.UnmarshalJson(in.Fields, &fields); err != nil {
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
	Id               string       `json:"id,omitempty"`
	Email            string       `json:"email,omitempty"`
	Password         string       `json:"password,omitempty"`
	Role             []*UserRoles `json:"roles,omitempty"`
	CreatedAt        int64        `json:"created_at,omitempty"`
	UpdatedAt        int64        `json:"updated_at,omitempty"`
	LastLogin        int64        `json:"last_login,omitempty"`
	Disabled         bool         `json:"disabled,omitempty"`
	Verified         bool         `json:"verified,omitempty"`
	AvatarResourceId string       `json:"avatar_resource_id,omitempty"`
	Avatar           []byte       `json:"avatar,omitempty"`
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
	return &accountRpc.Account{
		Id:               acc.Id,
		Email:            acc.Email,
		Password:         acc.Password,
		Roles:            roles,
		CreatedAt:        unixToUtcTS(acc.CreatedAt),
		UpdatedAt:        unixToUtcTS(acc.UpdatedAt),
		LastLogin:        unixToUtcTS(acc.LastLogin),
		Disabled:         acc.Disabled,
		Verified:         acc.Verified,
		Avatar:           acc.Avatar,
		AvatarResourceId: acc.AvatarResourceId,
	}, nil
}

func AccountFromProto(in *accountRpc.Account) (*Account, error) {
	var roles []*UserRoles
	if in.Roles != nil && len(in.Roles) > 0 {
		for _, r := range in.Roles {
			role := UserRolesFromProto(r)
			roles = append(roles, role)
		}
	}
	return &Account{
		Id:               in.GetId(),
		Email:            in.GetEmail(),
		Password:         in.GetPassword(),
		Role:             roles,
		CreatedAt:        tsToUnixUTC(in.GetCreatedAt()),
		UpdatedAt:        tsToUnixUTC(in.GetUpdatedAt()),
		LastLogin:        tsToUnixUTC(in.GetLastLogin()),
		Disabled:         in.Disabled,
		Verified:         in.Verified,
		AvatarResourceId: in.GetAvatarResourceId(),
		Avatar:           in.GetAvatar(),
	}, nil
}

type AccountNewRequest struct {
	Email             string          `json:"email,omitempty"`
	Password          string          `json:"password,omitempty"`
	Roles             []*UserRoles    `json:"roles,omitempty"`
	AvatarFilepath    string          `json:"avatar_filepath,omitempty"`
	AvatarUploadBytes string          `json:"avatar_upload_bytes,omitempty"`
	NewUserRoles      []*NewUserRoles `json:"new_user_roles,omitempty"`
}

func (a *AccountNewRequest) ToProto() *accountRpc.AccountNewRequest {
	var roles []*accountRpc.UserRoles
	var newRoles []*accountRpc.NewUserRoles
	if a.Roles != nil && len(a.Roles) > 0 {
		for _, r := range a.Roles {
			role := r.ToProto()
			roles = append(roles, role)
		}
	}
	if a.NewUserRoles != nil && len(a.NewUserRoles) > 0 {
		for _, r := range a.NewUserRoles {
			role := r.ToProto()
			newRoles = append(newRoles, role)
		}
	}
	return &accountRpc.AccountNewRequest{
		Email:             a.Email,
		Password:          a.Password,
		Roles:             roles,
		AvatarFilepath:    a.AvatarFilepath,
		AvatarUploadBytes: a.AvatarUploadBytes,
		NewUserRoles:      newRoles,
	}
}

func AccountNewRequestFromProto(in *accountRpc.AccountNewRequest) *AccountNewRequest {
	var roles []*UserRoles
	if in.Roles != nil && len(in.Roles) > 0 {
		for _, r := range in.Roles {
			role := UserRolesFromProto(r)
			roles = append(roles, role)
		}
	}
	var newRoles []*NewUserRoles
	if in.NewUserRoles != nil && len(in.NewUserRoles) > 0 {
		for _, r := range in.NewUserRoles {
			role := NewUserRolesFromProto(r)
			newRoles = append(newRoles, role)
		}
	}
	return &AccountNewRequest{
		Email:             in.GetEmail(),
		Password:          in.GetPassword(),
		Roles:             roles,
		AvatarFilepath:    in.GetAvatarFilepath(),
		AvatarUploadBytes: in.GetAvatarUploadBytes(),
		NewUserRoles:      newRoles,
	}
}

type AccountUpdateRequest struct {
	Id                string `json:"id,omitempty"`
	Email             string `json:"email,omitempty"`
	Password          string `json:"password,omitempty"`
	Disabled          bool   `json:"disabled,omitempty"`
	Verified          bool   `json:"verified,omitempty"`
	AvatarFilepath    string `json:"avatar_filepath,omitempty"`
	AvatarUploadBytes []byte `json:"avatar_upload_bytes,omitempty"`
}

func (a *AccountUpdateRequest) ToProto() *accountRpc.AccountUpdateRequest {
	return &accountRpc.AccountUpdateRequest{
		Id:                a.Id,
		Email:             a.Email,
		Password:          a.Password,
		Disabled:          a.Disabled,
		Verified:          a.Verified,
		AvatarFilepath:    a.AvatarFilepath,
		AvatarUploadBytes: a.AvatarUploadBytes,
	}
}

func AccountUpdateRequestFromProto(in *accountRpc.AccountUpdateRequest) *AccountUpdateRequest {
	return &AccountUpdateRequest{
		Id:                in.GetId(),
		Email:             in.GetEmail(),
		Password:          in.GetPassword(),
		Disabled:          in.GetDisabled(),
		Verified:          in.GetVerified(),
		AvatarFilepath:    in.GetAvatarFilepath(),
		AvatarUploadBytes: in.GetAvatarUploadBytes(),
	}
}

type GetAccountRequest struct {
	Id string `json:"id,omitempty"`
}

func (gar *GetAccountRequest) ToProto() *accountRpc.GetAccountRequest {
	return &accountRpc.GetAccountRequest{Id: gar.Id}
}

type ListAccountsRequest struct {
	PerPageEntries int64                  `json:"per_page_entries,omitempty"`
	OrderBy        string                 `json:"order_by,omitempty"`
	CurrentPageId  string                 `json:"current_page_id,omitempty"`
	IsDescending   bool                   `json:"is_descending,omitempty"`
	Filters        map[string]interface{} `json:"filters,omitempty"`
	Matcher        string                 `json:"matcher,omitempty"`
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
		Matcher:        lar.Matcher,
	}, nil
}

func ListAccountsRequestFromProto(in *accountRpc.ListAccountsRequest) (*ListAccountsRequest, error) {
	pkgFilter := map[string]interface{}{}
	if in.Filters != nil {
		err := sharedConfig.UnmarshalJson(in.Filters, &pkgFilter)
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
		Matcher:        in.GetMatcher(),
	}, nil
}

type ListAccountsResponse struct {
	Accounts   []*Account `json:"accounts,omitempty"`
	NextPageId string     `json:"next_page_id,omitempty"`
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
	SearchParam *ListAccountsRequest   `json:"search_param,omitempty"`
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
	SearchResponse *ListAccountsResponse `json:"list_accounts_response,omitempty"`
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
	AssigneeAccountId string    `json:"assignee_account_id,omitempty"`
	AssignedAccountId string    `json:"assigned_account_id,omitempty"`
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
	AccountId string `json:"account_id,omitempty"`
}

func (dar *DisableAccountRequest) ToProto() *accountRpc.DisableAccountRequest {
	return &accountRpc.DisableAccountRequest{AccountId: dar.AccountId}
}
