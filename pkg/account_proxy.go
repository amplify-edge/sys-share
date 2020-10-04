package pkg

import (
	"context"
	"google.golang.org/grpc"

	rpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
)

// SysAccountClient is just a stub
type SysAccountClient struct{}

// SysAccountService contains the account and auth service as defined by
// the protobuf in the sys-share/sys-account/proto/v2
type SysAccountService struct {
	account *accountService
	auth    *authService
}

// NewSysAccountService creates new SysAccountService object
// it contains account and auth service as defined by the protobuf service definition
func NewSysAccountService(au AuthService, acc AccountService) *SysAccountService {
	authSvc := newAuthService(au)
	accountSvc := newAccountService(acc)
	return &SysAccountService{
		account: accountSvc,
		auth:    authSvc,
	}
}

// RegisterSvc will register all the services contained within SysAccountService
func (sas *SysAccountService) RegisterSvc(server *grpc.Server) {
	sas.auth.registerSvc(server)
	sas.account.registerSvc(server)
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
}

// Thin wrapper around rpc defined services
type accountService struct {
	svc *rpc.AccountServiceService
}

func newAccountService(acc AccountService) *accountService {
	return &accountService{
		svc: &rpc.AccountServiceService{
			NewAccount:          acc.NewAccount,
			GetAccount:          acc.GetAccount,
			ListAccounts:        acc.ListAccounts,
			SearchAccounts:      acc.SearchAccounts,
			AssignAccountToRole: acc.AssignAccountToRole,
			UpdateAccount:       acc.UpdateAccount,
			DisableAccount:      acc.DisableAccount,
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
			Register:           au.Register,
			Login:              au.Login,
			ForgotPassword:     au.ForgotPassword,
			ResetPassword:      au.ResetPassword,
			RefreshAccessToken: au.RefreshAccessToken,
		},
	}
}

func (au *authService) registerSvc(server *grpc.Server) {
	rpc.RegisterAuthServiceService(server, au.svc)
}
