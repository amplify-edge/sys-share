package pkg

import (
	"github.com/spf13/cobra"
	cliClient "go.amplifyedge.org/protoc-gen-cobra/client"
)

// CLI
type SysCoreProxyClient struct {
	SysCoreClient *sysCoreClient
}

func NewSysCoreProxyClient(options ...cliClient.Option) *SysCoreProxyClient {
	return &SysCoreProxyClient{SysCoreClient: newSysCoreClient(options...)}
}

func (s *SysCoreProxyClient) CobraCommand() *cobra.Command {
	return s.SysCoreClient.cobraCommand()
}

type SysBusProxyClient struct {
	SysBusClient *busClient
}

func NewSysBusProxyClient(options ...cliClient.Option) *SysBusProxyClient {
	return &SysBusProxyClient{SysBusClient: newBusClient(options...)}
}

func (sb *SysBusProxyClient) CobraCommand() *cobra.Command {
	return sb.SysBusClient.cobraCommand()
}

type SysMailProxyClient struct {
	SysMailProxyClient *mailClient
}

func NewSysMailProxyClient(options ...cliClient.Option) *SysMailProxyClient {
	return &SysMailProxyClient{
		SysMailProxyClient: newMailClient(options...),
	}
}

func (sm *SysMailProxyClient) CobraCommand() *cobra.Command {
	return sm.SysMailProxyClient.cobraCommand()
}
