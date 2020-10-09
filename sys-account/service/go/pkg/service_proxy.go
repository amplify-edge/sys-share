package pkg

import (
	"context"
	"github.com/spf13/cobra"
	"github.com/spf13/pflag"
	"golang.org/x/oauth2"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/oauth"
	"google.golang.org/grpc/reflection"

	cliClient "github.com/getcouragenow/protoc-gen-cobra/client"
	"github.com/getcouragenow/protoc-gen-cobra/naming"
)

type SysAccountProxyService struct {
	SysAccount *sysAccountService
}

// Constructor for SysAccountProxyService
func NewSysAccountProxyService(accountService AccountService, authService AuthService) *SysAccountProxyService {
	sysAccountProxy := newSysAccountService(authService, accountService)
	return &SysAccountProxyService{SysAccount: sysAccountProxy}
}

// SysAccountProxyService Register services to GRPC
func (s *SysAccountProxyService) RegisterSvc(server *grpc.Server) {
	s.SysAccount.registerSvc(server)
	reflection.Register(server)
}

type SysAccountProxyClient struct {
	SysAccountClient *sysAccountClient
}

func NewSysShareProxyClient() *SysAccountProxyClient {
	cliClient.RegisterFlagBinder(func(fs *pflag.FlagSet, namer naming.Namer) {
		fs.StringVar(&SysShareProxyClientConfig.AccessKey, namer("JWT Access Token"), SysShareProxyClientConfig.AccessKey, "JWT Access Token")
	})
	cliClient.RegisterPreDialer(func(_ context.Context, opts *[]grpc.DialOption) error {
		cfg := SysShareProxyClientConfig
		if cfg.AccessKey != "" {
			cred := oauth.NewOauthAccess(&oauth2.Token{
				AccessToken: cfg.AccessKey,
				TokenType:   "Bearer",
			})
			*opts = append(*opts, grpc.WithPerRPCCredentials(cred))
		}
		return nil
	})
	sysAccountProxyClient := newSysAccountClient()
	return &SysAccountProxyClient{
		SysAccountClient: sysAccountProxyClient,
	}
}

type sysAccountProxyClientConfig struct {
	AccessKey string
}

var SysShareProxyClientConfig = &sysAccountProxyClientConfig{}

// Easy access to create CLI
func (s *SysAccountProxyClient) CobraCommand() *cobra.Command {

	rootCmd := &cobra.Command{
		Use:   "sys-share proxy client",
		Short: "sys-share proxy client cli",
	}
	rootCmd.AddCommand(s.SysAccountClient.cobraCommand())
	return rootCmd
}
