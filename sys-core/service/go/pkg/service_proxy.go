package pkg

import (
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
)

// Server side
type SysBusProxyService struct {
	SysBus *busProxyService
}

type SysCoreProxyService struct {
	SysCore *sysCoreService
}

func NewSysCoreProxyService(ds DbAdminService) *SysCoreProxyService {
	return &SysCoreProxyService{SysCore: newSysCoreService(ds)}
}

func (s *SysCoreProxyService) RegisterSvc(server *grpc.Server) {
	s.SysCore.registerSvc(server)
}

// Client side
type SysBusProxyServiceClient struct {
	*busClientProxy
}

func NewSysBusProxyServiceClient(cc grpc.ClientConnInterface) *SysBusProxyServiceClient {
	return &SysBusProxyServiceClient{newBusClientProxy(cc)}
}

type SysCoreProxyServiceClient struct {
	*sysCoreClientProxy
}

func NewSysCoreProxyServiceClient(cc grpc.ClientConnInterface) *SysCoreProxyServiceClient {
	return &SysCoreProxyServiceClient{newSysCoreClientProxy(cc)}
}

// CLI
type SysCoreProxyClient struct {
	SysCoreClient *sysCoreClient
}

func NewSysCoreProxyClient() *SysCoreProxyClient {
	return &SysCoreProxyClient{SysCoreClient: newSysCoreClient()}
}

func (s *SysCoreProxyClient) CobraCommand() *cobra.Command {
	return s.SysCoreClient.cobraCommand()
}

type SysBusProxyClient struct {
	SysBusClient *busClient
}

func NewSysBusProxyClient() *SysBusProxyClient {
	return &SysBusProxyClient{SysBusClient: newBusClient()}
}

func (sb *SysBusProxyClient) CobraCommand() *cobra.Command {
	return sb.SysBusClient.cobraCommand()
}
