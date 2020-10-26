package pkg

import (
	dbrpc "github.com/getcouragenow/sys-share/sys-core/service/go/rpc/v2"
)

type RestoreResult struct {
	Result string `json:"result"`
}

func (rr *RestoreResult) ToProto() *dbrpc.RestoreResult {
	return &dbrpc.RestoreResult{Result: rr.Result}
}

func RestoreResultFromProto(drr *dbrpc.RestoreResult) *RestoreResult {
	return &RestoreResult{Result: drr.Result}
}

type BackupResult struct {
	BackupFile string `json:"backupFile"`
}

func (br *BackupResult) ToProto() *dbrpc.BackupResult {
	return &dbrpc.BackupResult{BackupFile: br.BackupFile}
}

func BackupResultFromProto(in *dbrpc.BackupResult) *BackupResult {
	return &BackupResult{BackupFile: in.BackupFile}
}

type ListBackupResult struct {
	BackupFiles []*BackupResult `json:"backupFiles"`
}

func (l *ListBackupResult) ToProto() *dbrpc.ListBackupResult {
	var bfiles []*dbrpc.BackupResult
	for _, f := range l.BackupFiles {
		bfiles = append(bfiles, f.ToProto())
	}
	return &dbrpc.ListBackupResult{BackupFiles: bfiles}
}

func ListBackupFromProto(in *dbrpc.ListBackupResult) *ListBackupResult {
	var bfiles []*BackupResult
	for _, f := range in.BackupFiles {
		bfiles = append(bfiles, BackupResultFromProto(f))
	}
	return &ListBackupResult{BackupFiles: bfiles}
}

type RestoreRequest struct {
	BackupFile string `json:"backupFile"`
}

func (r *RestoreRequest) ToProto() *dbrpc.RestoreRequest {
	return &dbrpc.RestoreRequest{BackupFile: r.BackupFile}
}

func RestoreRequestFromProto(in *dbrpc.RestoreRequest) *RestoreRequest {
	return &RestoreRequest{BackupFile: in.BackupFile}
}

type EventRequest struct {
	EventName   string `json:"eventName,omitempty"`
	Initiator   string `json:"initiator,omitempty"`
	UserId      string `json:"userId,omitempty"`
	JsonPayload []byte `json:"jsonPayload,omitempty"`
}

func (e *EventRequest) ToProto() *dbrpc.EventRequest {
	return &dbrpc.EventRequest{
		EventName:   e.EventName,
		Initiator:   e.Initiator,
		UserId:      e.UserId,
		JsonPayload: e.JsonPayload,
	}
}

func EventRequestFromProto(in *dbrpc.EventRequest) *EventRequest {
	return &EventRequest{
		EventName:   in.EventName,
		Initiator:   in.Initiator,
		UserId:      in.GetUserId(),
		JsonPayload: in.GetJsonPayload(),
	}
}

type EventResponse struct {
	Reply []byte `json:"reply"`
}

func (e *EventResponse) ToProto() *dbrpc.EventResponse {
	return &dbrpc.EventResponse{
		Reply: e.Reply,
	}
}

func EventResponseFromProto(in *dbrpc.EventResponse) *EventResponse {
	return &EventResponse{
		Reply: in.GetReply(),
	}
}
