package pkg

import (
	"github.com/spf13/cobra"
	cliClient "go.amplifyedge.org/protoc-gen-cobra/client"
)

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
