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
	// cliClient.RegisterFlagBinder(func(fs *pflag.FlagSet, namer naming.Namer) {
	// 	fs.StringVar(&SysShareProxyClientConfig.AccessKey, namer("JWT Access Token"), SysShareProxyClientConfig.AccessKey, "JWT Access Token")
	// })
	// cliClient.RegisterPreDialer(func(_ context.Context, opts *[]grpc.DialOption) error {
	// 	cfg := SysShareProxyClientConfig
	// 	if cfg.AccessKey != "" {
	// 		cred := oauth.NewOauthAccess(&oauth2.Token{
	// 			AccessToken: cfg.AccessKey,
	// 			TokenType:   "Bearer",
	// 		})
	// 		*opts = append(*opts, grpc.WithPerRPCCredentials(cred))
	// 	}
	// 	return nil
	// })
	sysAccountProxyClient := newSysAccountClient(options...)
	return &SysAccountProxyClient{
		SysAccountClient: sysAccountProxyClient,
	}
}

type sysAccountProxyClientConfig struct {
	AccessKey string
}

// var SysShareProxyClientConfig = &sysAccountProxyClientConfig{}
//
// // Easy access to create CLI
func (s *SysAccountProxyClient) CobraCommand() *cobra.Command {
	return s.SysAccountClient.cobraCommand()
}
