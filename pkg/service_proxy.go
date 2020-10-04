package pkg

import (
	"fmt"
	"google.golang.org/grpc"

	rpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
)

type SysShareProxyService struct {
	SysAccount *SysAccountService
}

type SysShareProxyClient struct {
	SysAccountClient *SysAccountClient
}

// SysAccountClient is just a stub
type SysAccountClient struct{}

type SysAccountService struct {
	account *accountService
	auth    *authService
}

// Thin wrapper around rpc defined services
type accountService struct {
	*rpc.AccountServiceService
}

func (a *accountService) RegisterSvc(server *grpc.Server) {
	rpc.RegisterAccountServiceService(server, &rpc.AccountServiceService{
		NewAccount:          a.NewAccount,
		GetAccount:          a.GetAccount,
		ListAccounts:        a.ListAccounts,
		SearchAccounts:      a.SearchAccounts,
		AssignAccountToRole: a.AssignAccountToRole,
		UpdateAccount:       a.UpdateAccount,
		DisableAccount:      a.DisableAccount,
	})
}

type authService struct {
	*rpc.AuthServiceService
}

func (au *authService) RegisterSvc(server *grpc.Server) {
	rpc.RegisterAuthServiceService(server, &rpc.AuthServiceService{
		Register:           au.Register,
		Login:              au.Login,
		ForgotPassword:     au.ForgotPassword,
		ResetPassword:      au.ResetPassword,
		RefreshAccessToken: au.RefreshAccessToken,
	})
}

// Invoke invokes client side GRPC calls to running server.
func Invoke() string {
	// TODO:load up the sub grpc Services proxy
	fmt.Println("In sys-share GRPC Services Proxy")
	return "hello from sys-share GRPC Services Proxy"
}
