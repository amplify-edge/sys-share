package main

import (
	log "github.com/getcouragenow/sys-share/sys-core/service/logging"
	"github.com/spf13/cobra"

	pkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
)

var rootCmd = &cobra.Command{
	Use:   "auth",
	Short: "auth cli",
}

func main() {
	rootCmd.AddCommand(pkg.NewSysShareProxyClient().CobraCommand())
	if err := rootCmd.Execute(); err != nil {
		log.Logger.Fatalf("command failed: %v", err.Error())
	}
}
