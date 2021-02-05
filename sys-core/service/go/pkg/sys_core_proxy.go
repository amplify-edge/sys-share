package pkg

import (
	"context"
	cliClient "github.com/amplify-cms/protoc-gen-cobra/client"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/emptypb"

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

type sysCoreService struct {
	svc *dbrpc.DbAdminServiceService
}

func newSysCoreService(d DbAdminService) *sysCoreService {
	return &sysCoreService{
		svc: &dbrpc.DbAdminServiceService{
			Backup:     backupProxy(d),
			ListBackup: listBackupProxy(d),
			Restore:    restoreProxy(d),
		},
	}
}

func (s *sysCoreService) registerSvc(server *grpc.Server) {
	dbrpc.RegisterDbAdminServiceService(server, s.svc)
}

// SERVICES
type EmailService interface {
	SendMail(context.Context, *EmailRequest) (*EmailResponse, error)
}

func sendMailProxy(e EmailService) func(context.Context, *dbrpc.EmailRequest) (*dbrpc.EmailResponse, error) {
	return func(ctx context.Context, in *dbrpc.EmailRequest) (*dbrpc.EmailResponse, error) {
		res, err := e.SendMail(ctx, EmailRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return res.ToProto(), nil
	}
}

type mailProxyService struct {
	svc *dbrpc.EmailServiceService
}

func newMailProxyService(e EmailService) *mailProxyService {
	return &mailProxyService{svc: &dbrpc.EmailServiceService{
		SendMail: sendMailProxy(e),
	}}
}

func (e *mailProxyService) registerSvc(srv *grpc.Server) {
	dbrpc.RegisterEmailServiceService(srv, e.svc)
}

type DbAdminService interface {
	Backup(context.Context, *emptypb.Empty) (*BackupAllResult, error)
	ListBackup(context.Context, *ListBackupRequest) (*ListBackupResult, error)
	Restore(context.Context, *RestoreAllRequest) (*RestoreAllResult, error)
}

func backupProxy(d DbAdminService) func(context.Context, *emptypb.Empty) (*dbrpc.BackupAllResult, error) {
	return func(ctx context.Context, emp *emptypb.Empty) (*dbrpc.BackupAllResult, error) {
		res, err := d.Backup(ctx, emp)
		if err != nil {
			return nil, err
		}
		return res.ToProto(), nil
	}
}

func listBackupProxy(d DbAdminService) func(context.Context, *dbrpc.ListBackupRequest) (*dbrpc.ListBackupResult, error) {
	return func(ctx context.Context, in *dbrpc.ListBackupRequest) (*dbrpc.ListBackupResult, error) {
		res, err := d.ListBackup(ctx, ListBackupRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return res.ToProto(), nil
	}
}

func restoreProxy(d DbAdminService) func(context.Context, *dbrpc.RestoreAllRequest) (*dbrpc.RestoreAllResult, error) {
	return func(ctx context.Context, in *dbrpc.RestoreAllRequest) (*dbrpc.RestoreAllResult, error) {
		res, err := d.Restore(ctx, RestoreAllRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return res.ToProto(), nil
	}
}

type BusService interface {
	Broadcast(context.Context, *EventRequest) (*EventResponse, error)
}

type busProxyService struct {
	svc *dbrpc.BusServiceService
}

func newBusServiceProxy(b BusService) *busProxyService {
	return &busProxyService{svc: &dbrpc.BusServiceService{
		Broadcast: broadcastProxy(b),
	}}
}

func (b *busProxyService) registerSvc(srv *grpc.Server) {
	dbrpc.RegisterBusServiceService(srv, b.svc)
}

func broadcastProxy(b BusService) func(context.Context, *dbrpc.EventRequest) (*dbrpc.EventResponse, error) {
	return func(ctx context.Context, in *dbrpc.EventRequest) (*dbrpc.EventResponse, error) {
		res, err := b.Broadcast(ctx, EventRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return res.ToProto(), nil
	}
}

// CLIENT SIDE (LIBRARY)
type EmailServiceClient interface {
	SendMail(ctx context.Context, in *EmailRequest, opts ...grpc.CallOption) (*EmailResponse, error)
}

type emailClientProxy struct {
	client dbrpc.EmailServiceClient
}

func newEmailClientProxy(cc grpc.ClientConnInterface) *emailClientProxy {
	return &emailClientProxy{client: dbrpc.NewEmailServiceClient(cc)}
}

func (e *emailClientProxy) SendMail(ctx context.Context, in *EmailRequest, opts ...grpc.CallOption) (*EmailResponse, error) {
	resp, err := e.client.SendMail(ctx, in.ToProto(), opts...)
	if err != nil {
		return nil, err
	}
	return EmailResponseFromProto(resp), nil
}

type BusServiceClient interface {
	Broadcast(ctx context.Context, in *EventRequest, opts ...grpc.CallOption) (*EventResponse, error)
}

type busClientProxy struct {
	client dbrpc.BusServiceClient
}

func newBusClientProxy(cc grpc.ClientConnInterface) *busClientProxy {
	return &busClientProxy{client: dbrpc.NewBusServiceClient(cc)}
}

func (b *busClientProxy) Broadcast(ctx context.Context, in *EventRequest, opts ...grpc.CallOption) (*EventResponse, error) {
	resp, err := b.client.Broadcast(ctx, in.ToProto(), opts...)
	if err != nil {
		return nil, err
	}
	return EventResponseFromProto(resp), nil
}

type DbAdminServiceClient interface {
	Backup(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*BackupAllResult, error)
	ListBackup(ctx context.Context, in *dbrpc.ListBackupRequest, opts ...grpc.CallOption) (*ListBackupResult, error)
	Restore(ctx context.Context, in *RestoreAllRequest, opts ...grpc.CallOption) (*RestoreAllResult, error)
}

type sysCoreClientProxy struct {
	svcClient dbrpc.DbAdminServiceClient
}

func newSysCoreClientProxy(cc grpc.ClientConnInterface) *sysCoreClientProxy {
	newClient := dbrpc.NewDbAdminServiceClient(cc)
	return &sysCoreClientProxy{svcClient: newClient}
}

func (s *sysCoreClientProxy) Backup(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*BackupAllResult, error) {
	resp, err := s.svcClient.Backup(ctx, in, opts...)
	if err != nil {
		return nil, err
	}
	return BackupAllResultFromProto(resp), nil
}

func (s *sysCoreClientProxy) ListBackup(ctx context.Context, in *ListBackupRequest, opts ...grpc.CallOption) (*ListBackupResult, error) {
	resp, err := s.svcClient.ListBackup(ctx, in.ToProto(), opts...)
	if err != nil {
		return nil, err
	}
	return ListBackupFromProto(resp), nil
}

func (s *sysCoreClientProxy) Restore(ctx context.Context, in *RestoreAllRequest, opts ...grpc.CallOption) (*RestoreAllResult, error) {
	resp, err := s.svcClient.Restore(ctx, in.ToProto(), opts...)
	if err != nil {
		return nil, err
	}
	return RestoreAllResultFromProto(resp), nil
}
