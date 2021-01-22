package main

import (
	corepkg "github.com/getcouragenow/sys-share/sys-core/service/go/pkg"
	log "github.com/getcouragenow/sys-share/sys-core/service/logging"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "core",
	Short: "core cli",
}

func main() {
	dbadm := corepkg.NewSysBusProxyClient()
	mailcli := corepkg.NewSysMailProxyClient()
	fileCli := corepkg.NewFileServiceClientCommand()
	rootCmd.AddCommand(dbadm.CobraCommand(), mailcli.CobraCommand(), fileCli)
	if err := rootCmd.Execute(); err != nil {
		log.Logger.Fatalf("command failed: %v", err.Error())
	}

	// Extend it here for local thing.
	// TODO @gutterbacon: do this once Config is here.
}
