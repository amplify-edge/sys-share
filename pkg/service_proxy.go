package pkg

import (
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
)

type SysShareProxyService struct {
	SysAccount *sysAccountService
}

// Constructor for SysShareProxyService
func NewSysShareProxyService(accountService AccountService, authService AuthService) *SysShareProxyService {
	sysAccountProxy := newSysAccountService(authService, accountService)
	return &SysShareProxyService{SysAccount: sysAccountProxy}
}

// SysShareProxyService Register services to GRPC
func (s *SysShareProxyService) RegisterSvc(server *grpc.Server) {
	s.SysAccount.registerSvc(server)
}

type SysShareProxyClient struct {
	SysAccountClient *sysAccountClient
}

func NewSysShareProxyClient() *SysShareProxyClient {
	sysAccountProxyClient := newSysAccountClient()
	return &SysShareProxyClient{
		SysAccountClient: sysAccountProxyClient,
	}
}

// Easy access to create CLI
func (s *SysShareProxyClient) cobraCommand() *cobra.Command {
	rootCmd := &cobra.Command{
		Use:   "sys-share proxy client",
		Short: "sys-share proxy client cli",
	}
	rootCmd.AddCommand(s.SysAccountClient.cobraCommand())
	return rootCmd
}


// Invoke invokes client side GRPC calls to running server.
func Invoke() string {
	// TODO:load up the sub grpc Services proxy
	log.Println("In sys-share GRPC Services Proxy")
	return "hello from sys-share GRPC Services Proxy"
}
