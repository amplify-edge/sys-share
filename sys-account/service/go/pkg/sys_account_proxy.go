package pkg

import (
	"context"
	cliClient "go.amplifyedge.org/protoc-gen-cobra/client"
	"github.com/golang/protobuf/ptypes/empty"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/emptypb"

	rpc "go.amplifyedge.org/sys-share-v2/sys-account/service/go/rpc/v2"
	sharedConfig "go.amplifyedge.org/sys-share-v2/sys-core/service/config"
)

// SysAccountClient is just a stub
type sysAccountClient struct {
	auth       *cobra.Command
	account    *cobra.Command
	orgProject *cobra.Command
	extra      *cobra.Command
}

func newSysAccountClient(options ...cliClient.Option) *sysAccountClient {
	return &sysAccountClient{
		auth:       rpc.AuthServiceClientCommand(options...),
		account:    rpc.AccountServiceClientCommand(options...),
		orgProject: rpc.OrgProjServiceClientCommand(options...),
		extra:      AuthServiceSigninCommand(options...),
	}
}

func (sac *sysAccountClient) cobraCommand() *cobra.Command {
	rootCmd := &cobra.Command{
		Use:   "sys-account client",
		Short: "sys-account client cli",
	}
	sac.auth.AddCommand(sac.extra)
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
	NewAccount(context.Context, *AccountNewRequest) (*Account, error)
	GetAccount(context.Context, *IdRequest) (*Account, error)
	ListAccounts(context.Context, *ListAccountsRequest) (*ListAccountsResponse, error)
	SearchAccounts(context.Context, *SearchAccountsRequest) (*SearchAccountsResponse, error)
	AssignAccountToRole(context.Context, *AssignAccountToRoleRequest) (*Account, error)
	UpdateAccount(context.Context, *AccountUpdateRequest) (*Account, error)
	DisableAccount(context.Context, *DisableAccountRequest) (*Account, error)
	DeleteAccount(context.Context, *DisableAccountRequest) (*emptypb.Empty, error)
}

func newAccountProxy(as AccountService) func(context.Context, *rpc.AccountNewRequest) (*rpc.Account, error) {
	return func(ctx context.Context, acc *rpc.AccountNewRequest) (*rpc.Account, error) {
		pkgAccount := AccountNewRequestFromProto(acc)
		account, err := as.NewAccount(ctx, pkgAccount)
		if err != nil {
			return nil, err
		}
		return account.ToProto()
	}
}

func getAccountProxy(as AccountService) func(context.Context, *rpc.IdRequest) (*rpc.Account, error) {
	return func(ctx context.Context, acc *rpc.IdRequest) (*rpc.Account, error) {
		account, err := as.GetAccount(ctx, &IdRequest{Id: acc.GetId(), Name: acc.GetName()})
		if err != nil {
			return nil, err
		}
		return account.ToProto()
	}
}

func listAccountsProxy(as AccountService) func(context.Context, *rpc.ListAccountsRequest) (*rpc.ListAccountsResponse, error) {
	return func(ctx context.Context, lar *rpc.ListAccountsRequest) (*rpc.ListAccountsResponse, error) {
		listAccounts, err := ListAccountsRequestFromProto(lar)
		if err != nil {
			return nil, err
		}
		accounts, err := as.ListAccounts(ctx, listAccounts)
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
		queryFields := map[string]interface{}{}
		if sar.Query != nil {
			if err := sharedConfig.UnmarshalJson(sar.Query, &queryFields); err != nil {
				return nil, err
			}
		}
		listAccountRequest, err := ListAccountsRequestFromProto(sar.GetSearchParams())
		if err != nil {
			return nil, err
		}
		accounts, err := as.SearchAccounts(ctx, &SearchAccountsRequest{
			Query:       queryFields,
			SearchParam: listAccountRequest,
		})
		if err != nil {
			return nil, err
		}
		return accounts.ToProto()
	}
}

func updateAccountProxy(as AccountService) func(context.Context, *rpc.AccountUpdateRequest) (*rpc.Account, error) {
	return func(ctx context.Context, in *rpc.AccountUpdateRequest) (*rpc.Account, error) {
		req := AccountUpdateRequestFromProto(in)
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

func deleteAccountProxy(as AccountService) func(context.Context, *rpc.DisableAccountRequest) (*emptypb.Empty, error) {
	return func(ctx context.Context, in *rpc.DisableAccountRequest) (*emptypb.Empty, error) {
		acc, err := as.DeleteAccount(ctx, &DisableAccountRequest{AccountId: in.GetAccountId()})
		if err != nil {
			return nil, err
		}
		return acc, nil
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
			VerifyToken:     in.GetVerifyToken(),
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
			DeleteAccount:       deleteAccountProxy(acc),
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
			VerifyAccount:      authVerifyAccountProxy(au),
		},
	}
}

func (au *authService) registerSvc(server *grpc.Server) {
	rpc.RegisterAuthServiceService(server, au.svc)
}

type AccountServiceClient interface {
	NewAccount(ctx context.Context, in *AccountNewRequest, opts ...grpc.CallOption) (*Account, error)
	GetAccount(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Account, error)
	ListAccounts(ctx context.Context, in *ListAccountsRequest, opts ...grpc.CallOption) (*ListAccountsResponse, error)
	SearchAccounts(ctx context.Context, in *SearchAccountsRequest, opts ...grpc.CallOption) (*SearchAccountsResponse, error)
	AssignAccountToRole(ctx context.Context, in *AssignAccountToRoleRequest, opts ...grpc.CallOption) (*Account, error)
	UpdateAccount(ctx context.Context, in *AccountUpdateRequest, opts ...grpc.CallOption) (*Account, error)
	DisableAccount(ctx context.Context, in *DisableAccountRequest, opts ...grpc.CallOption) (*Account, error)
	DeleteAccount(ctx context.Context, in *DisableAccountRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
}

type accountSvcClientProxy struct {
	svcClient rpc.AccountServiceClient
}

func newAccountSvcClientProxy(cc grpc.ClientConnInterface) *accountSvcClientProxy {
	newClient := rpc.NewAccountServiceClient(cc)
	return &accountSvcClientProxy{svcClient: newClient}
}

func (as *accountSvcClientProxy) NewAccount(ctx context.Context, in *AccountNewRequest, opts ...grpc.CallOption) (*Account, error) {
	acc := in.ToProto()
	resp, err := as.svcClient.NewAccount(ctx, acc, opts...)
	if err != nil {
		return nil, err
	}
	account, err := AccountFromProto(resp)
	if err != nil {
		return nil, err
	}
	return account, nil
}

func (as *accountSvcClientProxy) GetAccount(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Account, error) {
	req := in.ToProto()
	resp, err := as.svcClient.GetAccount(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	account, err := AccountFromProto(resp)
	if err != nil {
		return nil, err
	}
	return account, nil
}

func (as *accountSvcClientProxy) ListAccounts(ctx context.Context, in *ListAccountsRequest, opts ...grpc.CallOption) (*ListAccountsResponse, error) {
	req, err := in.ToProto()
	if err != nil {
		return nil, err
	}
	resp, err := as.svcClient.ListAccounts(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	listAccounts, err := ListAccountsResponseFromProto(resp)
	if err != nil {
		return nil, err
	}
	return listAccounts, nil
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
	searchAccounts, err := SearchAccountResponseFromProto(resp)
	if err != nil {
		return nil, err
	}
	return searchAccounts, nil
}

func (as *accountSvcClientProxy) AssignAccountToRole(ctx context.Context, in *AssignAccountToRoleRequest, opts ...grpc.CallOption) (*Account, error) {
	req := in.ToProto()
	resp, err := as.svcClient.AssignAccountToRole(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	account, err := AccountFromProto(resp)
	if err != nil {
		return nil, err
	}
	return account, nil
}

func (as *accountSvcClientProxy) UpdateAccount(ctx context.Context, in *AccountUpdateRequest, opts ...grpc.CallOption) (*Account, error) {
	req := in.ToProto()
	resp, err := as.svcClient.UpdateAccount(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	account, err := AccountFromProto(resp)
	if err != nil {
		return nil, err
	}
	return account, nil
}

func (as *accountSvcClientProxy) DisableAccount(ctx context.Context, in *DisableAccountRequest, opts ...grpc.CallOption) (*Account, error) {
	req := in.ToProto()
	resp, err := as.svcClient.DisableAccount(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	account, err := AccountFromProto(resp)
	if err != nil {
		return nil, err
	}
	return account, nil
}

func (as *accountSvcClientProxy) DeleteAccount(ctx context.Context, in *DisableAccountRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	req := in.ToProto()
	resp, err := as.svcClient.DeleteAccount(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return resp, nil
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

func (as *authSvcClientProxy) VerifyAccount(ctx context.Context, in *VerifyAccountRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	req := in.ToProto()
	resp, err := as.svcClient.VerifyAccount(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return resp, nil
}
