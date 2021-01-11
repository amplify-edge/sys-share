package pkg

import (
	dbrpc "github.com/getcouragenow/sys-share/sys-core/service/go/rpc/v2"
)

type SingleBackupResult struct {
	BackupFile string `json:"backup_file"`
}

func (br *SingleBackupResult) ToProto() *dbrpc.SingleBackupResult {
	return &dbrpc.SingleBackupResult{BackupFile: br.BackupFile}
}

func SingleBackupResultFromProto(in *dbrpc.SingleBackupResult) *SingleBackupResult {
	return &SingleBackupResult{BackupFile: in.BackupFile}
}

type BackupAllResult struct {
	Version     string                `json:"version"`
	BackupFiles []*SingleBackupResult `json:"backup_files"`
}

func (bar *BackupAllResult) ToProto() *dbrpc.BackupAllResult {
	var rpcBackupFiles []*dbrpc.SingleBackupResult
	for _, bf := range bar.BackupFiles {
		rpcBackupFiles = append(rpcBackupFiles, bf.ToProto())
	}
	return &dbrpc.BackupAllResult{
		Version:     bar.Version,
		BackupFiles: rpcBackupFiles,
	}
}

func BackupAllResultFromProto(in *dbrpc.BackupAllResult) *BackupAllResult {
	var backupFiles []*SingleBackupResult
	for _, bf := range in.BackupFiles {
		backupFiles = append(backupFiles, SingleBackupResultFromProto(bf))
	}
	return &BackupAllResult{
		Version:     in.GetVersion(),
		BackupFiles: backupFiles,
	}
}

type ListBackupResult struct {
	BackupVersions []*BackupAllResult `json:"backup_versions"`
}

func (l *ListBackupResult) ToProto() *dbrpc.ListBackupResult {
	var bfiles []*dbrpc.BackupAllResult
	for _, f := range l.BackupVersions {
		bfiles = append(bfiles, f.ToProto())
	}
	return &dbrpc.ListBackupResult{BackupVersions: bfiles}
}

func ListBackupFromProto(in *dbrpc.ListBackupResult) *ListBackupResult {
	var bfiles []*BackupAllResult
	for _, f := range in.GetBackupVersions() {
		bfiles = append(bfiles, BackupAllResultFromProto(f))
	}
	return &ListBackupResult{BackupVersions: bfiles}
}

type ListBackupRequest struct {
	BackupVersion string `json:"backup_version"`
}

func (l *ListBackupRequest) ToProto() *dbrpc.ListBackupRequest {
	return &dbrpc.ListBackupRequest{
		BackupVersion: l.BackupVersion,
	}
}

func ListBackupRequestFromProto(in *dbrpc.ListBackupRequest) *ListBackupRequest {
	return &ListBackupRequest{BackupVersion: in.BackupVersion}
}

type SingleRestoreRequest struct {
	BackupFile string `json:"backup_file"`
}

func (r *SingleRestoreRequest) ToProto() *dbrpc.SingleRestoreRequest {
	return &dbrpc.SingleRestoreRequest{BackupFile: r.BackupFile}
}

func SingleRestoreRequestFromProto(in *dbrpc.SingleRestoreRequest) *SingleRestoreRequest {
	return &SingleRestoreRequest{BackupFile: in.BackupFile}
}

type SingleRestoreResult struct {
	Result string `json:"result"`
}

func (rr *SingleRestoreResult) ToProto() *dbrpc.SingleRestoreResult {
	return &dbrpc.SingleRestoreResult{Result: rr.Result}
}

func SingleRestoreResultFromProto(drr *dbrpc.SingleRestoreResult) *SingleRestoreResult {
	return &SingleRestoreResult{Result: drr.Result}
}

type RestoreAllRequest struct {
	RestoreVersion string   `json:"restore_version"`
	BackupFiles    map[string]string `json:"backup_files"`
}

func (r *RestoreAllRequest) ToProto() *dbrpc.RestoreAllRequest {
	return &dbrpc.RestoreAllRequest{RestoreVersion: r.RestoreVersion, BackupFiles: r.BackupFiles}
}

func RestoreAllRequestFromProto(in *dbrpc.RestoreAllRequest) *RestoreAllRequest {
	return &RestoreAllRequest{RestoreVersion: in.GetRestoreVersion(), BackupFiles: in.GetBackupFiles()}
}

type RestoreAllResult struct {
	RestoreResults []*SingleRestoreResult `json:"restore_results"`
}

func (r *RestoreAllResult) ToProto() *dbrpc.RestoreAllResult {
	var singleResultSlice []*dbrpc.SingleRestoreResult
	for _, sar := range r.RestoreResults {
		singleResultSlice = append(singleResultSlice, sar.ToProto())
	}
	return &dbrpc.RestoreAllResult{RestoreResults: singleResultSlice}
}

func RestoreAllResultFromProto(in *dbrpc.RestoreAllResult) *RestoreAllResult {
	var singleResultSlice []*SingleRestoreResult
	for _, sar := range in.GetRestoreResults() {
		singleResultSlice = append(singleResultSlice, SingleRestoreResultFromProto(sar))
	}
	return &RestoreAllResult{RestoreResults: singleResultSlice}
}

type EventRequest struct {
	EventName   string `json:"event_name,omitempty"`
	Initiator   string `json:"initiator,omitempty"`
	UserId      string `json:"user_id,omitempty"`
	JsonPayload []byte `json:"json_payload,omitempty"`
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
	Sender      string            `json:"sender,omitempty"`
	SenderName  string            `json:"sender_name,omitempty"`
	Subject     string            `json:"subject,omitempty"`
	Recipients  map[string]string `json:"recipients,omitempty"`
	Content     []byte            `json:"content,omitempty"`
	Cc          []string          `json:"cc,omitempty"`
	Bcc         []string          `json:"bcc,omitempty"`
	Attachments [][]byte          `json:"attachments,omitempty"`
}

func (e *EmailRequest) ToProto() *dbrpc.EmailRequest {
	return &dbrpc.EmailRequest{
		Sender:      e.Sender,
		SenderName:  e.SenderName,
		Subject:     e.Subject,
		Recipients:  e.Recipients,
		Content:     e.Content,
		Cc:          e.Cc,
		Bcc:         e.Bcc,
		Attachments: e.Attachments,
	}
}

func EmailRequestFromProto(in *dbrpc.EmailRequest) *EmailRequest {
	return &EmailRequest{
		Sender:      in.Sender,
		SenderName:  in.GetSenderName(),
		Subject:     in.GetSubject(),
		Recipients:  in.GetRecipients(),
		Content:     in.GetContent(),
		Cc:          in.GetCc(),
		Bcc:         in.GetBcc(),
		Attachments: in.GetAttachments(),
	}
}

type EmailResponse struct {
	Success        bool   `json:"success,omitempty"`
	ErrMessage     string `json:"err_message,omitempty"`
	SuccessMessage string `json:"success_message,omitempty"`
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

type FileInfo struct {
	MimeType   string `json:"mime_type,omitempty"`
	IsDir      bool   `json:"is_dir,omitempty"`
	ResourceId string `json:"resource_id,omitempty"`
}

func (f *FileInfo) ToProto() *dbrpc.FileInfo {
	return &dbrpc.FileInfo{
		MimeType:   f.MimeType,
		IsDir:      f.IsDir,
		ResourceId: f.ResourceId,
	}
}

func FileInfoFromProto(in *dbrpc.FileInfo) *FileInfo {
	return &FileInfo{
		MimeType:   in.GetMimeType(),
		IsDir:      in.GetIsDir(),
		ResourceId: in.GetResourceId(),
	}
}

type FileUploadRequest struct {
	FileInfo FileInfo `json:"file_info,omitempty"`
	Chunk    []byte   `json:"chunk"`
}

func (f *FileUploadRequest) ToProto() *dbrpc.FileUploadRequest {
	return &dbrpc.FileUploadRequest{
		FileInfo: f.FileInfo.ToProto(),
		Chunk:    f.Chunk,
	}
}

func FileUploadRequestFromProto(in *dbrpc.FileUploadRequest) *FileUploadRequest {
	return &FileUploadRequest{
		FileInfo: *FileInfoFromProto(in.FileInfo),
		Chunk:    in.GetChunk(),
	}
}

type FileUploadResponse struct {
	Success  bool   `json:"success,omitempty"`
	Id       string `json:"id,omitempty"`
	ErrorMsg string `json:"error_msg,omitempty"`
}

func (f *FileUploadResponse) ToProto() *dbrpc.FileUploadResponse {
	return &dbrpc.FileUploadResponse{
		Success:  f.Success,
		Id:       f.Id,
		ErrorMsg: f.ErrorMsg,
	}
}

func FileUploadResponseFromProto(in *dbrpc.FileUploadResponse) *FileUploadResponse {
	return &FileUploadResponse{
		Success:  in.Success,
		Id:       in.GetId(),
		ErrorMsg: in.GetErrorMsg(),
	}
}

type FileDownloadRequest struct {
	Id string `json:"id"`
}

func (f *FileDownloadRequest) ToProto() *dbrpc.FileDownloadRequest {
	return &dbrpc.FileDownloadRequest{Id: f.Id}
}

func FileDownloadRequestFromProto(in *dbrpc.FileDownloadRequest) *FileDownloadRequest {
	return &FileDownloadRequest{Id: in.GetId()}
}

type FileDownloadResponse struct {
	Chunk    []byte `json:"chunk,omitempty"`
	Success  bool   `json:"success,omitempty"`
	ErrorMsg string `json:"errorMsg,omitempty"`
}

func (f *FileDownloadResponse) ToProto() *dbrpc.FileDownloadResponse {
	return &dbrpc.FileDownloadResponse{
		Chunk:    f.Chunk,
		Success:  f.Success,
		ErrorMsg: f.ErrorMsg,
	}
}
