package main

import (
	corepkg "github.com/getcouragenow/sys-share/sys-core/service/go/pkg"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "core",
	Short: "core cli",
}

func main() {
	dbadm := corepkg.NewSysBusProxyClient()
	mailcli := corepkg.NewSysMailProxyClient()
	rootCmd.AddCommand(dbadm.CobraCommand(), mailcli.CobraCommand())
	if err := rootCmd.Execute(); err != nil {
		log.Fatalf("command failed: %v", err)
	}

	// Extend it here for local thing.
	// TODO @gutterbacon: do this once Config is here.
}
