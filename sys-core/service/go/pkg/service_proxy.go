package pkg

import (
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
)

type SysCoreProxyService struct {
	SysCore *sysCoreService
}

func NewSysCoreProxyService(ds DbAdminService) *SysCoreProxyService {
	return &SysCoreProxyService{SysCore: newSysCoreService(ds)}
}

func (s *SysCoreProxyService) RegisterSvc(server *grpc.Server) {
	s.SysCore.registerSvc(server)
}

type SysCoreProxyServiceClient struct {
	*sysCoreClientProxy
}

func NewSysCoreProxyServiceClient(cc grpc.ClientConnInterface) *SysCoreProxyServiceClient {
	return &SysCoreProxyServiceClient{newSysCoreClientProxy(cc)}
}

type SysCoreProxyClient struct {
	SysCoreClient *sysCoreClient
}

func NewSysCoreProxyClient() *SysCoreProxyClient {
	return &SysCoreProxyClient{SysCoreClient: newSysCoreClient()}
}

func (s *SysCoreProxyClient) CobraCommand() *cobra.Command {
	return s.SysCoreClient.cobraCommand()
}
