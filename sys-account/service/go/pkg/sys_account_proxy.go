package pkg

import (
	"github.com/spf13/cobra"
	cliClient "go.amplifyedge.org/protoc-gen-cobra/client"
	rpc "go.amplifyedge.org/sys-share-v2/sys-account/service/go/rpc/v2"
)

// SysAccountClient is just a stub
type sysAccountClient struct {
	auth       *cobra.Command
	account    *cobra.Command
	orgProject *cobra.Command
	extra      *cobra.Command
}

func newSysAccountClient(options ...cliClient.Option) *sysAccountClient {
	return &sysAccountClient{
		auth:       rpc.AuthServiceClientCommand(options...),
		account:    rpc.AccountServiceClientCommand(options...),
		orgProject: rpc.OrgProjServiceClientCommand(options...),
		extra:      AuthServiceSigninCommand(options...),
	}
}

func (sac *sysAccountClient) cobraCommand() *cobra.Command {
	rootCmd := &cobra.Command{
		Use:   "sys-account client",
		Short: "sys-account client cli",
	}
	sac.auth.AddCommand(sac.extra)
	rootCmd.AddCommand(sac.auth, sac.account, sac.orgProject)
	return rootCmd
}