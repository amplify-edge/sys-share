package pkg

import (
	"context"

	"google.golang.org/grpc"
	empty "google.golang.org/protobuf/types/known/emptypb"

	accountRpc "github.com/getcouragenow/sys-share/sys-account/service/go/rpc/v2"
)

type OrgProjService interface {
	// Projects
	NewProject(context.Context, *Project) (*Project, error)
	GetProject(context.Context, *IdRequest) (*Project, error)
	ListProject(context.Context, *ListRequest) (*ListResponse, error)
	UpdateProject(context.Context, *Project) (*Project, error)
	DeleteProject(context.Context, *IdRequest) (*empty.Empty, error)
	// Orgs
	NewOrg(context.Context, *Org) (*Org, error)
	GetOrg(context.Context, *IdRequest) (*Org, error)
	ListOrg(context.Context, *ListRequest) (*ListResponse, error)
	UpdateOrg(context.Context, *Org) (*Org, error)
	DeleteOrg(context.Context, *IdRequest) (*empty.Empty, error)
}

func newProjectProxy(o OrgProjService) func(context.Context, *accountRpc.Project) (*accountRpc.Project, error) {
	return func(ctx context.Context, in *accountRpc.Project) (*accountRpc.Project, error) {
		resp, err := o.NewProject(ctx, ProjectFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func getProjectProxy(o OrgProjService) func(context.Context, *accountRpc.IdRequest) (*accountRpc.Project, error) {
	return func(ctx context.Context, in *accountRpc.IdRequest) (*accountRpc.Project, error) {
		resp, err := o.GetProject(ctx, IdRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func listProjectProxy(o OrgProjService) func(context.Context, *accountRpc.ListRequest) (*accountRpc.ListResponse, error) {
	return func(ctx context.Context, in *accountRpc.ListRequest) (*accountRpc.ListResponse, error) {
		resp, err := o.ListProject(ctx, ListRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func updateProjectProxy(o OrgProjService) func(context.Context, *accountRpc.Project) (*accountRpc.Project, error) {
	return func(ctx context.Context, in *accountRpc.Project) (*accountRpc.Project, error) {
		resp, err := o.UpdateProject(ctx, ProjectFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func deleteProjectProxy(o OrgProjService) func(context.Context, *accountRpc.IdRequest) (*empty.Empty, error) {
	return func(ctx context.Context, in *accountRpc.IdRequest) (*empty.Empty, error) {
		resp, err := o.DeleteProject(ctx, IdRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp, nil
	}
}

func newOrgProxy(o OrgProjService) func(context.Context, *accountRpc.Org) (*accountRpc.Org, error) {
	return func(ctx context.Context, in *accountRpc.Org) (*accountRpc.Org, error) {
		resp, err := o.NewOrg(ctx, OrgFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func getOrgProxy(o OrgProjService) func(context.Context, *accountRpc.IdRequest) (*accountRpc.Org, error) {
	return func(ctx context.Context, in *accountRpc.IdRequest) (*accountRpc.Org, error) {
		resp, err := o.GetOrg(ctx, IdRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func listOrgProxy(o OrgProjService) func(context.Context, *accountRpc.ListRequest) (*accountRpc.ListResponse, error) {
	return func(ctx context.Context, in *accountRpc.ListRequest) (*accountRpc.ListResponse, error) {
		resp, err := o.ListOrg(ctx, ListRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func updateOrgProxy(o OrgProjService) func(context.Context, *accountRpc.Org) (*accountRpc.Org, error) {
	return func(ctx context.Context, in *accountRpc.Org) (*accountRpc.Org, error) {
		resp, err := o.UpdateOrg(ctx, OrgFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func deleteOrgProxy(o OrgProjService) func(context.Context, *accountRpc.IdRequest) (*empty.Empty, error) {
	return func(ctx context.Context, in *accountRpc.IdRequest) (*empty.Empty, error) {
		resp, err := o.DeleteOrg(ctx, IdRequestFromProto(in))
		if err != nil {
			return nil, err
		}
		return resp, nil
	}
}

type orgProjectService struct {
	svc *accountRpc.OrgProjServiceService
}

func newOrgProjService(o OrgProjService) *orgProjectService {
	return &orgProjectService{svc: &accountRpc.OrgProjServiceService{
		NewProject:    newProjectProxy(o),
		GetProject:    getProjectProxy(o),
		ListProject:   listProjectProxy(o),
		UpdateProject: updateProjectProxy(o),
		DeleteProject: deleteProjectProxy(o),
		NewOrg:        newOrgProxy(o),
		GetOrg:        getOrgProxy(o),
		ListOrg:       listOrgProxy(o),
		UpdateOrg:     updateOrgProxy(o),
		DeleteOrg:     deleteOrgProxy(o),
	}}
}

func (o *orgProjectService) registerSvc(server *grpc.Server) {
	accountRpc.RegisterOrgProjServiceService(server, o.svc)
}

type OrgProjServiceClient interface {
	// Projects
	NewProject(ctx context.Context, in *Project, opts ...grpc.CallOption) (*Project, error)
	GetProject(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Project, error)
	ListProject(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error)
	UpdateProject(ctx context.Context, in *Project, opts ...grpc.CallOption) (*Project, error)
	DeleteProject(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*empty.Empty, error)
	// Orgs
	NewOrg(ctx context.Context, in *Org, opts ...grpc.CallOption) (*Org, error)
	GetOrg(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Org, error)
	ListOrg(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error)
	UpdateOrg(ctx context.Context, in *Org, opts ...grpc.CallOption) (*Org, error)
	DeleteOrg(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*empty.Empty, error)
}

type orgProjectSvcClientProxy struct {
	svcClient accountRpc.OrgProjServiceClient
}

func newOrgProjectSvcClientProxy(cc grpc.ClientConnInterface) *orgProjectSvcClientProxy {
	newClient := accountRpc.NewOrgProjServiceClient(cc)
	return &orgProjectSvcClientProxy{svcClient: newClient}
}

func (o *orgProjectSvcClientProxy) newProject(ctx context.Context, in *Project, opts ...grpc.CallOption) (*Project, error) {
	req := in.ToProto()
	resp, err := o.svcClient.NewProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ProjectFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) getProject(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Project, error) {
	req := in.ToProto()
	resp, err := o.svcClient.GetProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ProjectFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) listProject(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error) {
	req := in.ToProto()
	resp, err := o.svcClient.ListProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ListResponseFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) updateProject(ctx context.Context, in *Project, opts ...grpc.CallOption) (*Project, error) {
	req := in.ToProto()
	resp, err := o.svcClient.UpdateProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ProjectFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) deleteProject(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*empty.Empty, error) {
	req := in.ToProto()
	resp, err := o.svcClient.DeleteProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return resp, nil
}

// Orgs
func (o *orgProjectSvcClientProxy) newOrg(ctx context.Context, in *Org, opts ...grpc.CallOption) (*Org, error) {
	req := in.ToProto()
	resp, err := o.svcClient.NewOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return OrgFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) getOrg(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Org, error) {
	req := in.ToProto()
	resp, err := o.svcClient.GetOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return OrgFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) listOrg(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error) {
	req := in.ToProto()
	resp, err := o.svcClient.ListOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ListResponseFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) updateOrg(ctx context.Context, in *Org, opts ...grpc.CallOption) (*Org, error) {
	req := in.ToProto()
	resp, err := o.svcClient.NewOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return OrgFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) deleteOrg(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*empty.Empty, error) {
	req := in.ToProto()
	resp, err := o.svcClient.DeleteOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return resp, nil
}
