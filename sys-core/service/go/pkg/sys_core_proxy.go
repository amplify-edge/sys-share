package pkg

import (
	"github.com/spf13/cobra"
	cliClient "go.amplifyedge.org/protoc-gen-cobra/client"
	dbrpc "go.amplifyedge.org/sys-share-v2/sys-core/service/go/rpc/v2"
)

// CLI
type mailClient struct {
	mailer *cobra.Command
}

func newMailClient(options ...cliClient.Option) *mailClient {
	return &mailClient{mailer: dbrpc.EmailServiceClientCommand(options...)}
}

func (m *mailClient) cobraCommand() *cobra.Command {
	return m.mailer
}

type busClient struct {
	bus *cobra.Command
}

func newBusClient(options ...cliClient.Option) *busClient {
	return &busClient{bus: dbrpc.BusServiceClientCommand(options...)}
}

func (b *busClient) cobraCommand() *cobra.Command {
	return b.bus
}

type sysCoreClient struct {
	dbadmin *cobra.Command
}

func newSysCoreClient(options ...cliClient.Option) *sysCoreClient {
	return &sysCoreClient{dbadmin: dbrpc.DbAdminServiceClientCommand(options...)}
}

func (s *sysCoreClient) cobraCommand() *cobra.Command {
	return s.dbadmin
}

