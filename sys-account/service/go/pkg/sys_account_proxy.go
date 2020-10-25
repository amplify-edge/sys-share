package pkg

import (
	"context"
	"github.com/golang/protobuf/ptypes/empty"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/emptypb"

	rpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
)

// SysAccountClient is just a stub
type sysAccountClient struct {
	auth       *cobra.Command
	account    *cobra.Command
	orgProject *cobra.Command
}

func newSysAccountClient() *sysAccountClient {

	return &sysAccountClient{
		auth:       rpc.AuthServiceClientCommand(),
		account:    rpc.AccountServiceClientCommand(),
		orgProject: rpc.OrgProjServiceClientCommand(),
	}
}

func (sac *sysAccountClient) cobraCommand() *cobra.Command {
	rootCmd := &cobra.Command{
		Use:   "sys-account client",
		Short: "sys-account client cli",
	}
	rootCmd.AddCommand(sac.auth, sac.account, sac.orgProject)
	return rootCmd
}

// SysAccountService contains the account and auth service as defined by
// the protobuf in the sys-share/sys-account/proto/v2
type sysAccountService struct {
	account *accountService
	auth    *authService
	orgProj *orgProjectService
}

// NewSysAccountService creates new SysAccountService object
// it contains account and auth service as defined by the protobuf service definition
func newSysAccountService(au AuthService, acc AccountService, o OrgProjService) *sysAccountService {
	authSvc := newAuthService(au)
	accountSvc := newAccountService(acc)
	orgProjectSvc := newOrgProjService(o)
	return &sysAccountService{
		account: accountSvc,
		auth:    authSvc,
		orgProj: orgProjectSvc,
	}
}

// RegisterSvc will register all the services contained within SysAccountService
func (sas *sysAccountService) registerSvc(server *grpc.Server) {
	sas.auth.registerSvc(server)
	sas.account.registerSvc(server)
	sas.orgProj.registerSvc(server)
}

// AccountService is the abstract contract needed to satisfy the
// AccountServiceService defined in the protobuf v2.
type AccountService interface {
	NewAccount(context.Context, *Account) (*Account, error)
	GetAccount(context.Context, *GetAccountRequest) (*Account, error)
	ListAccounts(context.Context, *ListAccountsRequest) (*ListAccountsResponse, error)
	SearchAccounts(context.Context, *SearchAccountsRequest) (*SearchAccountsResponse, error)
	AssignAccountToRole(context.Context, *AssignAccountToRoleRequest) (*Account, error)
	UpdateAccount(context.Context, *Account) (*Account, error)
	DisableAccount(context.Context, *DisableAccountRequest) (*Account, error)
}

func newAccountProxy(as AccountService) func(context.Context, *rpc.Account) (*rpc.Account, error) {
	return func(ctx context.Context, acc *rpc.Account) (*rpc.Account, error) {
		account, err := as.NewAccount(ctx, AccountFromProto(acc))
		if err != nil {
			return nil, err
		}
		return account.ToProto()
	}
}

func getAccountProxy(as AccountService) func(context.Context, *rpc.GetAccountRequest) (*rpc.Account, error) {
	return func(ctx context.Context, acc *rpc.GetAccountRequest) (*rpc.Account, error) {
		account, err := as.GetAccount(ctx, &GetAccountRequest{Id: acc.GetId()})
		if err != nil {
			return nil, err
		}
		return account.ToProto()
	}
}

func listAccountsProxy(as AccountService) func(context.Context, *rpc.ListAccountsRequest) (*rpc.ListAccountsResponse, error) {
	return func(ctx context.Context, lar *rpc.ListAccountsRequest) (*rpc.ListAccountsResponse, error) {
		accounts, err := as.ListAccounts(ctx, ListAccountsRequestFromProto(lar))
		if err != nil {
			return nil, err
		}
		return accounts.ToProto()
	}
}

func assignToRoleProxy(as AccountService) func(context.Context, *rpc.AssignAccountToRoleRequest) (*rpc.Account, error) {
	return func(ctx context.Context, in *rpc.AssignAccountToRoleRequest) (*rpc.Account, error) {
		account, err := as.AssignAccountToRole(ctx, &AssignAccountToRoleRequest{
			AssigneeAccountId: in.GetAssigneeAccountId(),
			AssignedAccountId: in.GetAssignedAccountId(),
			Role:              *UserRolesFromProto(in.GetRole()),
		})
		if err != nil {
			return nil, err
		}
		return account.ToProto()
	}
}

func searchAccountsProxy(as AccountService) func(context.Context, *rpc.SearchAccountsRequest) (*rpc.SearchAccountsResponse, error) {
	return func(ctx context.Context, sar *rpc.SearchAccountsRequest) (*rpc.SearchAccountsResponse, error) {
		queryFields := map[string]string{}
		for k, v := range sar.GetQuery() {
			queryFields[k] = v.String()
		}
		accounts, err := as.SearchAccounts(ctx, &SearchAccountsRequest{
			Query:       queryFields,
			SearchParam: ListAccountsRequestFromProto(sar.GetSearchParams()),
		})
		if err != nil {
			return nil, err
		}
		return accounts.ToProto()
	}
}

func updateAccountProxy(as AccountService) func(context.Context, *rpc.Account) (*rpc.Account, error) {
	return func(ctx context.Context, in *rpc.Account) (*rpc.Account, error) {
		req := AccountFromProto(in)
		acc, err := as.UpdateAccount(ctx, req)
		if err != nil {
			return nil, err
		}
		return acc.ToProto()
	}
}

func disableAccountProxy(as AccountService) func(context.Context, *rpc.DisableAccountRequest) (*rpc.Account, error) {
	return func(ctx context.Context, in *rpc.DisableAccountRequest) (*rpc.Account, error) {
		acc, err := as.DisableAccount(ctx, &DisableAccountRequest{AccountId: in.GetAccountId()})
		if err != nil {
			return nil, err
		}
		return acc.ToProto()
	}
}

// AuthService is the abstract contract needed to satisfy the
// AuthServiceService defined in the protobuf v2.
type AuthService interface {
	Register(context.Context, *RegisterRequest) (*RegisterResponse, error)
	Login(context.Context, *LoginRequest) (*LoginResponse, error)
	// ForgotPassword, then ResetPassword if succeed
	ForgotPassword(context.Context, *ForgotPasswordRequest) (*ForgotPasswordResponse, error)
	ResetPassword(context.Context, *ResetPasswordRequest) (*ResetPasswordResponse, error)
	// Refresh Access Token endpoint
	RefreshAccessToken(context.Context, *RefreshAccessTokenRequest) (*RefreshAccessTokenResponse, error)
	VerifyAccount(context.Context, *VerifyAccountRequest) (*empty.Empty, error)
}

func authRegisterProxy(as AuthService) func(context.Context, *rpc.RegisterRequest) (*rpc.RegisterResponse, error) {
	return func(ctx context.Context, in *rpc.RegisterRequest) (*rpc.RegisterResponse, error) {
		resp, err := as.Register(ctx, RegisterRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func authLoginProxy(as AuthService) func(context.Context, *rpc.LoginRequest) (*rpc.LoginResponse, error) {
	return func(ctx context.Context, in *rpc.LoginRequest) (*rpc.LoginResponse, error) {
		resp, err := as.Login(ctx, LoginRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func authForgotPasswordProxy(as AuthService) func(context.Context, *rpc.ForgotPasswordRequest) (*rpc.ForgotPasswordResponse, error) {
	return func(ctx context.Context, in *rpc.ForgotPasswordRequest) (*rpc.ForgotPasswordResponse, error) {
		resp, err := as.ForgotPassword(ctx, &ForgotPasswordRequest{Email: in.GetEmail()})
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func authResetPasswordProxy(as AuthService) func(context.Context, *rpc.ResetPasswordRequest) (*rpc.ResetPasswordResponse, error) {
	return func(ctx context.Context, in *rpc.ResetPasswordRequest) (*rpc.ResetPasswordResponse, error) {
		resp, err := as.ResetPassword(ctx, &ResetPasswordRequest{
			Email:           in.GetEmail(),
			Password:        in.GetPassword(),
			PasswordConfirm: in.GetPasswordConfirm(),
		})
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func authRefreshAccessTokenProxy(as AuthService) func(context.Context, *rpc.RefreshAccessTokenRequest) (*rpc.RefreshAccessTokenResponse, error) {
	return func(ctx context.Context, in *rpc.RefreshAccessTokenRequest) (*rpc.RefreshAccessTokenResponse, error) {
		resp, err := as.RefreshAccessToken(ctx, &RefreshAccessTokenRequest{RefreshToken: in.GetRefreshToken()})
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func authVerifyAccountProxy(as AuthService) func(context.Context, *rpc.VerifyAccountRequest) (*emptypb.Empty, error) {
	return func(ctx context.Context, request *rpc.VerifyAccountRequest) (*emptypb.Empty, error) {
		resp, err := as.VerifyAccount(ctx, VerifyAccountRequestFromProto(request))
		if err != nil {
			return nil, err
		}
		return resp, nil
	}
}

// Thin wrapper around rpc defined services
type accountService struct {
	svc *rpc.AccountServiceService
}

func newAccountService(acc AccountService) *accountService {
	return &accountService{
		svc: &rpc.AccountServiceService{
			NewAccount:          newAccountProxy(acc),
			GetAccount:          getAccountProxy(acc),
			ListAccounts:        listAccountsProxy(acc),
			SearchAccounts:      searchAccountsProxy(acc),
			AssignAccountToRole: assignToRoleProxy(acc),
			UpdateAccount:       updateAccountProxy(acc),
			DisableAccount:      disableAccountProxy(acc),
		},
	}
}

func (a *accountService) registerSvc(server *grpc.Server) {
	rpc.RegisterAccountServiceService(server, a.svc)
}

type authService struct {
	svc *rpc.AuthServiceService
}

func newAuthService(au AuthService) *authService {
	return &authService{
		svc: &rpc.AuthServiceService{
			Register:           authRegisterProxy(au),
			Login:              authLoginProxy(au),
			ForgotPassword:     authForgotPasswordProxy(au),
			ResetPassword:      authResetPasswordProxy(au),
			RefreshAccessToken: authRefreshAccessTokenProxy(au),
		},
	}
}

func (au *authService) registerSvc(server *grpc.Server) {
	rpc.RegisterAuthServiceService(server, au.svc)
}

type AccountServiceClient interface {
	NewAccount(ctx context.Context, in *Account, opts ...grpc.CallOption) (*Account, error)
	GetAccount(ctx context.Context, in *GetAccountRequest, opts ...grpc.CallOption) (*Account, error)
	ListAccounts(ctx context.Context, in *ListAccountsRequest, opts ...grpc.CallOption) (*ListAccountsResponse, error)
	SearchAccounts(ctx context.Context, in *SearchAccountsRequest, opts ...grpc.CallOption) (*SearchAccountsResponse, error)
	AssignAccountToRole(ctx context.Context, in *AssignAccountToRoleRequest, opts ...grpc.CallOption) (*Account, error)
	UpdateAccount(ctx context.Context, in *Account, opts ...grpc.CallOption) (*Account, error)
	DisableAccount(ctx context.Context, in *DisableAccountRequest, opts ...grpc.CallOption) (*Account, error)
}

type accountSvcClientProxy struct {
	svcClient rpc.AccountServiceClient
}

func newAccountSvcClientProxy(cc grpc.ClientConnInterface) *accountSvcClientProxy {
	newClient := rpc.NewAccountServiceClient(cc)
	return &accountSvcClientProxy{svcClient: newClient}
}

func (as *accountSvcClientProxy) NewAccount(ctx context.Context, in *Account, opts ...grpc.CallOption) (*Account, error) {
	acc, err := in.ToProto()
	if err != nil {
		return nil, err
	}
	resp, err := as.svcClient.NewAccount(ctx, acc, opts...)
	if err != nil {
		return nil, err
	}
	return AccountFromProto(resp), nil
}

func (as *accountSvcClientProxy) GetAccount(ctx context.Context, in *GetAccountRequest, opts ...grpc.CallOption) (*Account, error) {
	req := in.ToProto()
	resp, err := as.svcClient.GetAccount(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return AccountFromProto(resp), nil
}

func (as *accountSvcClientProxy) ListAccounts(ctx context.Context, in *ListAccountsRequest, opts ...grpc.CallOption) (*ListAccountsResponse, error) {
	req := in.ToProto()
	resp, err := as.svcClient.ListAccounts(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ListAccountsResponseFromProto(resp), nil
}

func (as *accountSvcClientProxy) SearchAccounts(ctx context.Context, in *SearchAccountsRequest, opts ...grpc.CallOption) (*SearchAccountsResponse, error) {
	req, err := in.ToProto()
	if err != nil {
		return nil, err
	}
	resp, err := as.svcClient.SearchAccounts(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return SearchAccountResponseFromProto(resp), nil
}

func (as *accountSvcClientProxy) AssignAccountToRole(ctx context.Context, in *AssignAccountToRoleRequest, opts ...grpc.CallOption) (*Account, error) {
	req := in.ToProto()
	resp, err := as.svcClient.AssignAccountToRole(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return AccountFromProto(resp), nil
}

func (as *accountSvcClientProxy) UpdateAccount(ctx context.Context, in *Account, opts ...grpc.CallOption) (*Account, error) {
	req, err := in.ToProto()
	if err != nil {
		return nil, err
	}
	resp, err := as.svcClient.UpdateAccount(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return AccountFromProto(resp), nil
}

func (as *accountSvcClientProxy) DisableAccount(ctx context.Context, in *DisableAccountRequest, opts ...grpc.CallOption) (*Account, error) {
	req := in.ToProto()
	resp, err := as.svcClient.DisableAccount(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return AccountFromProto(resp), nil
}

type AuthServiceClient interface {
	Register(ctx context.Context, in *RegisterRequest, opts ...grpc.CallOption) (*RegisterResponse, error)
	Login(ctx context.Context, in *LoginRequest, opts ...grpc.CallOption) (*LoginResponse, error)
	ForgotPassword(ctx context.Context, in *ForgotPasswordRequest, opts ...grpc.CallOption) (*ForgotPasswordResponse, error)
	ResetPassword(ctx context.Context, in *ResetPasswordRequest, opts ...grpc.CallOption) (*ResetPasswordResponse, error)
	RefreshAccessToken(ctx context.Context, in *RefreshAccessTokenRequest, opts ...grpc.CallOption) (*RefreshAccessTokenResponse, error)
	VerifyAccount(ctx context.Context, in *VerifyAccountRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
}

type authSvcClientProxy struct {
	svcClient rpc.AuthServiceClient
}

func newAuthSvcClientProxy(cc grpc.ClientConnInterface) *authSvcClientProxy {
	newClient := rpc.NewAuthServiceClient(cc)
	return &authSvcClientProxy{svcClient: newClient}
}

func (as *authSvcClientProxy) Register(ctx context.Context, in *RegisterRequest, opts ...grpc.CallOption) (*RegisterResponse, error) {
	req := in.ToProto()
	resp, err := as.svcClient.Register(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return RegisterResponseFromProto(resp), nil
}

func (as *authSvcClientProxy) Login(ctx context.Context, in *LoginRequest, opts ...grpc.CallOption) (*LoginResponse, error) {
	req := in.ToProto()
	resp, err := as.svcClient.Login(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return LoginResponseFromProto(resp), nil
}

func (as *authSvcClientProxy) ForgotPassword(ctx context.Context, in *ForgotPasswordRequest, opts ...grpc.CallOption) (*ForgotPasswordResponse, error) {
	req := in.ToProto()
	resp, err := as.svcClient.ForgotPassword(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ForgotPasswordResponseFromProto(resp), nil
}

func (as *authSvcClientProxy) ResetPassword(ctx context.Context, in *ResetPasswordRequest, opts ...grpc.CallOption) (*ResetPasswordResponse, error) {
	req := in.ToProto()
	resp, err := as.svcClient.ResetPassword(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ResetPasswordResponseFromProto(resp), nil
}

func (as *authSvcClientProxy) RefreshAccessToken(ctx context.Context, in *RefreshAccessTokenRequest, opts ...grpc.CallOption) (*RefreshAccessTokenResponse, error) {
	req := in.ToProto()
	resp, err := as.svcClient.RefreshAccessToken(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return RefreshAccessTokenFromProto(resp), nil
}
