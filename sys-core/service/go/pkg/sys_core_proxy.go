package pkg

import (
	"context"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/emptypb"

	dbrpc "github.com/getcouragenow/sys-share/sys-core/service/go/rpc/v2"
)

// CLI
type busClient struct {
	bus *cobra.Command
}

func newBusClient() *busClient {
	return &busClient{bus: dbrpc.BusServiceClientCommand()}
}

func (b *busClient) cobraCommand() *cobra.Command {
	return b.bus
}

type sysCoreClient struct {
	dbadmin *cobra.Command
}

func newSysCoreClient() *sysCoreClient {
	return &sysCoreClient{dbadmin: dbrpc.DbAdminServiceClientCommand()}
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
type DbAdminService interface {
	Backup(context.Context, *emptypb.Empty) (*BackupResult, error)
	ListBackup(context.Context, *emptypb.Empty) (*ListBackupResult, error)
	Restore(context.Context, *RestoreRequest) (*RestoreResult, error)
}

func backupProxy(d DbAdminService) func(context.Context, *emptypb.Empty) (*dbrpc.BackupResult, error) {
	return func(ctx context.Context, emp *emptypb.Empty) (*dbrpc.BackupResult, error) {
		res, err := d.Backup(ctx, emp)
		if err != nil {
			return nil, err
		}
		return res.ToProto(), nil
	}
}

func listBackupProxy(d DbAdminService) func(context.Context, *emptypb.Empty) (*dbrpc.ListBackupResult, error) {
	return func(ctx context.Context, emp *emptypb.Empty) (*dbrpc.ListBackupResult, error) {
		res, err := d.ListBackup(ctx, emp)
		if err != nil {
			return nil, err
		}
		return res.ToProto(), nil
	}
}

func restoreProxy(d DbAdminService) func(context.Context, *dbrpc.RestoreRequest) (*dbrpc.RestoreResult, error) {
	return func(ctx context.Context, in *dbrpc.RestoreRequest) (*dbrpc.RestoreResult, error) {
		res, err := d.Restore(ctx, RestoreRequestFromProto(in))
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
	Backup(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*BackupResult, error)
	ListBackup(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*ListBackupResult, error)
	Restore(ctx context.Context, in *RestoreRequest, opts ...grpc.CallOption) (*RestoreResult, error)
}

type sysCoreClientProxy struct {
	svcClient dbrpc.DbAdminServiceClient
}

func newSysCoreClientProxy(cc grpc.ClientConnInterface) *sysCoreClientProxy {
	newClient := dbrpc.NewDbAdminServiceClient(cc)
	return &sysCoreClientProxy{svcClient: newClient}
}

func (s *sysCoreClientProxy) Backup(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*BackupResult, error) {
	resp, err := s.svcClient.Backup(ctx, in, opts...)
	if err != nil {
		return nil, err
	}
	return BackupResultFromProto(resp), nil
}

func (s *sysCoreClientProxy) ListBackup(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*ListBackupResult, error) {
	resp, err := s.svcClient.ListBackup(ctx, in, opts...)
	if err != nil {
		return nil, err
	}
	return ListBackupFromProto(resp), nil
}

func (s *sysCoreClientProxy) Restore(ctx context.Context, in *RestoreRequest, opts ...grpc.CallOption) (*RestoreResult, error) {
	resp, err := s.svcClient.Restore(ctx, in.ToProto(), opts...)
	if err != nil {
		return nil, err
	}
	return RestoreResultFromProto(resp), nil
}
