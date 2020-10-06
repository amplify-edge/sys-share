package pkg

import (
	"context"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/pflag"
	"golang.org/x/oauth2"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/oauth"
	"google.golang.org/grpc/reflection"

	cliClient "github.com/getcouragenow/protoc-gen-cobra/client"
	"github.com/getcouragenow/protoc-gen-cobra/naming"
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
	reflection.Register(server)
}

type SysShareProxyClient struct {
	SysAccountClient *sysAccountClient
}

func NewSysShareProxyClient() *SysShareProxyClient {
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
	return &SysShareProxyClient{
		SysAccountClient: sysAccountProxyClient,
	}
}

type sysShareProxyClientConfig struct {
	AccessKey string
}

var SysShareProxyClientConfig = &sysShareProxyClientConfig{}

// Easy access to create CLI
func (s *SysShareProxyClient) CobraCommand() *cobra.Command {

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
