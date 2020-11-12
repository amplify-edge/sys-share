package pkg

import (
	cliClient "github.com/getcouragenow/protoc-gen-cobra/client"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

type SysAccountProxyService struct {
	SysAccount *sysAccountService
}

// Constructor for SysAccountProxyService
func NewSysAccountProxyService(accountService AccountService, authService AuthService, orgProjectSvc OrgProjService) *SysAccountProxyService {
	sysAccountProxy := newSysAccountService(authService, accountService, orgProjectSvc)
	return &SysAccountProxyService{SysAccount: sysAccountProxy}
}

// SysAccountProxyService Register services to GRPC
func (s *SysAccountProxyService) RegisterSvc(server *grpc.Server) {
	s.SysAccount.registerSvc(server)
	reflection.Register(server)
}

// this one for Client (non CLI)
type SysAccountProxyServiceClient struct {
	*accountSvcClientProxy
	*authSvcClientProxy
	*orgProjectSvcClientProxy
}

func NewSysAccountProxyServiceClient(cc grpc.ClientConnInterface) *SysAccountProxyServiceClient {
	return &SysAccountProxyServiceClient{
		newAccountSvcClientProxy(cc),
		newAuthSvcClientProxy(cc),
		newOrgProjectSvcClientProxy(cc),
	}
}

// this one for CLI
type SysAccountProxyClient struct {
	SysAccountClient *sysAccountClient
}

func NewSysShareProxyClient(options ...cliClient.Option) *SysAccountProxyClient {
	sysAccountProxyClient := newSysAccountClient(options...)
	return &SysAccountProxyClient{
		SysAccountClient: sysAccountProxyClient,
	}
}

// // Easy access to create CLI
func (s *SysAccountProxyClient) CobraCommand() *cobra.Command {
	return s.SysAccountClient.cobraCommand()
}
