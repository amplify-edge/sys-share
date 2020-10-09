package main

import (
	rpc "github.com/getcouragenow/sys-share/sys-core/service/go/rpc/v2"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "auth",
	Short: "auth cli",
}

func main() {
	rootCmd.AddCommand(rpc.DbAdminServiceClientCommand())
	if err := rootCmd.Execute(); err != nil {
		log.Fatalf("command failed: %v", err)
	}

	// Extend it here for local thing.
	// TODO @gutterbacon: do this once Config is here.
}
