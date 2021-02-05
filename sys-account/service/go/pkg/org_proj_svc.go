package pkg

import (
	"context"

	"google.golang.org/grpc"
	empty "google.golang.org/protobuf/types/known/emptypb"

	accountRpc "go.amplifyedge.org/sys-share-v2/sys-account/service/go/rpc/v2"
)

type OrgProjService interface {
	// Projects
	NewProject(context.Context, *ProjectRequest) (*Project, error)
	GetProject(context.Context, *IdRequest) (*Project, error)
	ListProject(context.Context, *ListRequest) (*ListResponse, error)
	UpdateProject(context.Context, *ProjectUpdateRequest) (*Project, error)
	DeleteProject(context.Context, *IdRequest) (*empty.Empty, error)
	// Orgs
	NewOrg(context.Context, *OrgRequest) (*Org, error)
	GetOrg(context.Context, *IdRequest) (*Org, error)
	ListOrg(context.Context, *ListRequest) (*ListResponse, error)
	ListNonSubscribedOrgs(context.Context, *ListRequest) (*ListResponse, error)
	UpdateOrg(context.Context, *OrgUpdateRequest) (*Org, error)
	DeleteOrg(context.Context, *IdRequest) (*empty.Empty, error)
}

func newProjectProxy(o OrgProjService) func(context.Context, *accountRpc.ProjectRequest) (*accountRpc.Project, error) {
	return func(ctx context.Context, in *accountRpc.ProjectRequest) (*accountRpc.Project, error) {
		resp, err := o.NewProject(ctx, ProjectRequestFromProto(in))
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
		listReq, err := ListRequestFromProto(in)
		if err != nil {
			return nil, err
		}
		resp, err := o.ListProject(ctx, listReq)
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func updateProjectProxy(o OrgProjService) func(context.Context, *accountRpc.ProjectUpdateRequest) (*accountRpc.Project, error) {
	return func(ctx context.Context, in *accountRpc.ProjectUpdateRequest) (*accountRpc.Project, error) {
		resp, err := o.UpdateProject(ctx, ProjectUpdateRequestFromProto(in))
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

func newOrgProxy(o OrgProjService) func(context.Context, *accountRpc.OrgRequest) (*accountRpc.Org, error) {
	return func(ctx context.Context, in *accountRpc.OrgRequest) (*accountRpc.Org, error) {
		resp, err := o.NewOrg(ctx, OrgRequestFromProto(in))
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
		listReq, err := ListRequestFromProto(in)
		if err != nil {
			return nil, err
		}
		resp, err := o.ListOrg(ctx, listReq)
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func listNonSubscribedOrgProxy(o OrgProjService) func(context.Context, *accountRpc.ListRequest) (*accountRpc.ListResponse, error) {
	return func(ctx context.Context, in *accountRpc.ListRequest) (*accountRpc.ListResponse, error) {
		listReq, err := ListRequestFromProto(in)
		if err != nil {
			return nil, err
		}
		resp, err := o.ListNonSubscribedOrgs(ctx, listReq)
		if err != nil {
			return nil, err
		}
		return resp.ToProto(), nil
	}
}

func updateOrgProxy(o OrgProjService) func(context.Context, *accountRpc.OrgUpdateRequest) (*accountRpc.Org, error) {
	return func(ctx context.Context, in *accountRpc.OrgUpdateRequest) (*accountRpc.Org, error) {
		resp, err := o.UpdateOrg(ctx, OrgUpdateRequestFromProto(in))
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
		NewProject:            newProjectProxy(o),
		GetProject:            getProjectProxy(o),
		ListProject:           listProjectProxy(o),
		UpdateProject:         updateProjectProxy(o),
		DeleteProject:         deleteProjectProxy(o),
		NewOrg:                newOrgProxy(o),
		GetOrg:                getOrgProxy(o),
		ListOrg:               listOrgProxy(o),
		ListNonSubscribedOrgs: listNonSubscribedOrgProxy(o),
		UpdateOrg:             updateOrgProxy(o),
		DeleteOrg:             deleteOrgProxy(o),
	}}
}

func (o *orgProjectService) registerSvc(server *grpc.Server) {
	accountRpc.RegisterOrgProjServiceService(server, o.svc)
}

type OrgProjServiceClient interface {
	// Projects
	NewProject(ctx context.Context, in *ProjectRequest, opts ...grpc.CallOption) (*Project, error)
	GetProject(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Project, error)
	ListProject(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error)
	UpdateProject(ctx context.Context, in *ProjectUpdateRequest, opts ...grpc.CallOption) (*Project, error)
	DeleteProject(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*empty.Empty, error)
	// Orgs
	NewOrg(ctx context.Context, in *OrgRequest, opts ...grpc.CallOption) (*Org, error)
	GetOrg(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Org, error)
	ListOrg(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error)
	ListNonSubscribedOrgs(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error)
	UpdateOrg(ctx context.Context, in *OrgUpdateRequest, opts ...grpc.CallOption) (*Org, error)
	DeleteOrg(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*empty.Empty, error)
}

type orgProjectSvcClientProxy struct {
	svcClient accountRpc.OrgProjServiceClient
}

func newOrgProjectSvcClientProxy(cc grpc.ClientConnInterface) *orgProjectSvcClientProxy {
	newClient := accountRpc.NewOrgProjServiceClient(cc)
	return &orgProjectSvcClientProxy{svcClient: newClient}
}

func (o *orgProjectSvcClientProxy) NewProject(ctx context.Context, in *ProjectRequest, opts ...grpc.CallOption) (*Project, error) {
	req := in.ToProto()
	resp, err := o.svcClient.NewProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ProjectFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) GetProject(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Project, error) {
	req := in.ToProto()
	resp, err := o.svcClient.GetProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ProjectFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) ListProject(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error) {
	req, err := in.ToProto()
	if err != nil {
		return nil, err
	}
	resp, err := o.svcClient.ListProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ListResponseFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) UpdateProject(ctx context.Context, in *ProjectUpdateRequest, opts ...grpc.CallOption) (*Project, error) {
	req := in.ToProto()
	resp, err := o.svcClient.UpdateProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ProjectFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) DeleteProject(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*empty.Empty, error) {
	req := in.ToProto()
	resp, err := o.svcClient.DeleteProject(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return resp, nil
}

// Orgs
func (o *orgProjectSvcClientProxy) NewOrg(ctx context.Context, in *OrgRequest, opts ...grpc.CallOption) (*Org, error) {
	req := in.ToProto()
	resp, err := o.svcClient.NewOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return OrgFromProto(resp), nil
}

func (o *orgProjectSvcClientProxy) GetOrg(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*Org, error) {
	req := in.ToProto()
	resp, err := o.svcClient.GetOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return OrgFromProto(resp), nil
}

func (o *orgProjectSvcClientProxy) ListOrg(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error) {
	req, err := in.ToProto()
	if err != nil {
		return nil, err
	}
	resp, err := o.svcClient.ListOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ListResponseFromProto(resp), nil
}

func (o *orgProjectSvcClientProxy) ListNonSubscribedOrgs(ctx context.Context, in *ListRequest, opts ...grpc.CallOption) (*ListResponse, error) {
	req, err := in.ToProto()
	if err != nil {
		return nil, err
	}
	resp, err := o.svcClient.ListNonSubscribedOrgs(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return ListResponseFromProto(resp), nil
}

func (o *orgProjectSvcClientProxy) UpdateOrg(ctx context.Context, in *OrgUpdateRequest, opts ...grpc.CallOption) (*Org, error) {
	req := in.ToProto()
	resp, err := o.svcClient.UpdateOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return OrgFromProto(resp), nil
}
func (o *orgProjectSvcClientProxy) DeleteOrg(ctx context.Context, in *IdRequest, opts ...grpc.CallOption) (*empty.Empty, error) {
	req := in.ToProto()
	resp, err := o.svcClient.DeleteOrg(ctx, req, opts...)
	if err != nil {
		return nil, err
	}
	return resp, nil
}
