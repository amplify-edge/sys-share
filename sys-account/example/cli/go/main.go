package main

import (
	log "github.com/sirupsen/logrus"
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
		log.Fatalf("command failed: %v", err)
	}
}
