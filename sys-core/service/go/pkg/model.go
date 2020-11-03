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

type EmailRequest struct {
	Sender      string   `json:"sender,omitempty"`
	Subject     string   `json:"subject,omitempty"`
	Recipients  []string `json:"recipients,omitempty"`
	Template    []byte   `json:"template,omitempty"`
	Content     []byte   `json:"content,omitempty"`
	Cc          []string `json:"cc,omitempty"`
	Bcc         []string `json:"bcc,omitempty"`
	Attachments [][]byte `json:"attachments,omitempty"`
}

func (e *EmailRequest) ToProto() *dbrpc.EmailRequest {
	return &dbrpc.EmailRequest{
		Sender:      e.Sender,
		Subject:     e.Subject,
		Recipients:  e.Recipients,
		Template:    e.Template,
		Content:     e.Content,
		Cc:          e.Cc,
		Bcc:         e.Bcc,
		Attachments: e.Attachments,
	}
}

func EmailRequestFromProto(in *dbrpc.EmailRequest) *EmailRequest {
	return &EmailRequest{
		Sender:      in.Sender,
		Subject:     in.GetSubject(),
		Recipients:  in.GetRecipients(),
		Template:    in.GetTemplate(),
		Content:     in.GetContent(),
		Cc:          in.GetCc(),
		Bcc:         in.GetBcc(),
		Attachments: in.GetAttachments(),
	}
}

type EmailResponse struct {
	Success        bool   `json:"success,omitempty"`
	ErrMessage     string `json:"errMessage,omitempty"`
	SuccessMessage string `json:"successMessage,omitempty"`
}

func (e *EmailResponse) ToProto() *dbrpc.EmailResponse {
	return &dbrpc.EmailResponse{
		Success:        e.Success,
		ErrMessage:     e.ErrMessage,
		SuccessMessage: e.SuccessMessage,
	}
}

func EmailResponseFromProto(e *dbrpc.EmailResponse) *EmailResponse {
	return &EmailResponse{
		Success:        e.Success,
		ErrMessage:     e.ErrMessage,
		SuccessMessage: e.SuccessMessage,
	}
}
