package pkg

import (
	"bytes"
	"go.amplifyedge.org/protoc-gen-cobra/client"
	"go.amplifyedge.org/protoc-gen-cobra/flag"
	"go.amplifyedge.org/protoc-gen-cobra/iocodec"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/proto"
	"io/ioutil"
	"text/template"

	accountRpc "go.amplifyedge.org/sys-share-v2/sys-account/service/go/rpc/v2"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/clihelper"
)

func AuthServiceSigninCommand(options ...client.Option) *cobra.Command {
	cfg := client.NewConfig(options...)
	cmd := authServiceSigninCommand(cfg)
	return cmd
}

func authServiceSigninCommand(cfg *client.Config) *cobra.Command {
	req := &accountRpc.LoginRequest{}
	cmd := &cobra.Command{
		Use:   cfg.CommandNamer("Signin"),
		Short: "Signin RPC client",
		Long:  "",
		RunE: func(cmd *cobra.Command, args []string) error {
			if cfg.UseEnvVars {
				if err := flag.SetFlagsFromEnv(cmd.Parent().PersistentFlags(), true, cfg.EnvVarNamer, cfg.EnvVarPrefix, "AuthService"); err != nil {
					return err
				}
				if err := flag.SetFlagsFromEnv(cmd.PersistentFlags(), false, cfg.EnvVarNamer, cfg.EnvVarPrefix, "AuthService", "Login"); err != nil {
					return err
				}
			}
			return client.RoundTrip(cmd.Context(), cfg, func(cc grpc.ClientConnInterface, in iocodec.Decoder, out iocodec.Encoder) error {
				cli := accountRpc.NewAuthServiceClient(cc)
				v := &accountRpc.LoginRequest{}

				if err := in(v); err != nil {
					return err
				}
				proto.Merge(v, req)

				res, err := cli.Login(cmd.Context(), v)
				if err != nil {
					return err
				}
				type AuthCred struct {
					AccessKey  string
					RefreshKey string
					Access     string
					Refresh    string
				}
				authCred := AuthCred{
					AccessKey:  clihelper.DefaultAccessKeyEnv,
					RefreshKey: clihelper.DefaultRefreshKeyEnv,
					Access:     res.AccessToken,
					Refresh:    res.RefreshToken,
				}
				envTpl := `{{ .AccessKey }} = {{ .Access }}
{{ .RefreshKey }} = {{ .Refresh }}`
				t, err := template.New("env").Parse(envTpl)
				if err != nil {
					return err
				}
				b := bytes.Buffer{}
				if err = t.Execute(&b, authCred); err != nil {
					return err
				}
				if err = ioutil.WriteFile(".env", b.Bytes(), 0644); err != nil {
					return err
				}

				return out(res)
			})
		},
	}

	cmd.PersistentFlags().StringVar(&req.Email, cfg.FlagNamer("Email"), "", "@inject_tag: fake:\"{mailseq:ops,false,none,false}\" yaml:\"email\"")
	cmd.PersistentFlags().StringVar(&req.Password, cfg.FlagNamer("Password"), "", "@inject_tag: fake:\"{password:true,true,true,false,false,16}\" yaml:\"password\"")

	return cmd
}
