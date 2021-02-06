package clihelper

import (
	"context"
	cliClient "go.amplifyedge.org/protoc-gen-cobra/client"
	"go.amplifyedge.org/protoc-gen-cobra/iocodec"
	"go.amplifyedge.org/protoc-gen-cobra/naming"
	"github.com/joho/godotenv"
	"github.com/spf13/pflag"
	"golang.org/x/oauth2"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/oauth"
	"os"
)

const (
	DefaultAccessKeyEnv  = "GCN_ACCESS_KEY"
	DefaultRefreshKeyEnv = "GCN_REFRESH_KEY"
)

type CLIOptions struct {
	ServerAddress  cliClient.Option
	Output         cliClient.Option
	PrettyEncoder  cliClient.Option
	CAConfig       cliClient.Option
	PreDialer      cliClient.PreDialer
	AuthFlagBinder cliClient.FlagBinder
}

func CLIWrapper(rootCaPath, hostAddr, envPath string) *CLIOptions {
	var caCfg cliClient.Option
	srvCfg := cliClient.WithServerAddr(hostAddr)
	encoder := iocodec.JSONEncoderMaker(true)
	jsonCfg := cliClient.WithOutputEncoder("json", encoder)
	if rootCaPath != "" {
		caCfg = cliClient.WithTLSCACertFile(rootCaPath)
	}
	flagBinder := func(fs *pflag.FlagSet, namer naming.Namer) {
		fs.StringVarP(&MainProxyCLIConfig.AccessKey, namer("JWT Access Token"), "j", MainProxyCLIConfig.AccessKey, "JWT Access Token")
	}
	preDialer := func(_ context.Context, opts *[]grpc.DialOption) error {
		cfg := MainProxyCLIConfig
		tkn := &oauth2.Token{
			TokenType: "Bearer",
		}
		if cfg.AccessKey != "" {
			tkn.AccessToken = cfg.AccessKey
			cred := oauth.NewOauthAccess(tkn)
			*opts = append(*opts, grpc.WithPerRPCCredentials(cred))
		} else if cfg.AccessKey == "" {
			_ = godotenv.Load(envPath)
			if os.Getenv(DefaultAccessKeyEnv) != "" {
				tkn.AccessToken = os.Getenv(DefaultAccessKeyEnv)
				cred := oauth.NewOauthAccess(tkn)
				*opts = append(*opts, grpc.WithPerRPCCredentials(cred))
			}
		}
		return nil
	}
	return &CLIOptions{
		ServerAddress:  srvCfg,
		Output:         jsonCfg,
		CAConfig:       caCfg,
		PreDialer:      preDialer,
		AuthFlagBinder: flagBinder,
	}
}

func (c *CLIOptions) RegisterAuthDialer() {
	cliClient.RegisterFlagBinder(c.AuthFlagBinder)
	cliClient.RegisterPreDialer(c.PreDialer)
}

func (c *CLIOptions) GetAllOptions() []cliClient.Option {
	if c.CAConfig != nil {
		return []cliClient.Option{
			c.CAConfig, c.Output, c.ServerAddress,
		}
	}
	return []cliClient.Option{
		c.Output, c.ServerAddress,
	}
}

type mainProxyCliConfig struct {
	AccessKey string
}

var MainProxyCLIConfig = &mainProxyCliConfig{}
