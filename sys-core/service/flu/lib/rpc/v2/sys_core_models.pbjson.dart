///
//  Generated code. Do not modify.
//  source: sys_core_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const RestoreResult$json = const {
  '1': 'RestoreResult',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
  ],
};

const BackupResult$json = const {
  '1': 'BackupResult',
  '2': const [
    const {'1': 'backupFile', '3': 1, '4': 1, '5': 9, '10': 'backupFile'},
  ],
};

const ListBackupResult$json = const {
  '1': 'ListBackupResult',
  '2': const [
    const {'1': 'backupFiles', '3': 1, '4': 3, '5': 11, '6': '.v2.sys_core.services.BackupResult', '10': 'backupFiles'},
  ],
};

const RestoreRequest$json = const {
  '1': 'RestoreRequest',
  '2': const [
    const {'1': 'backupFile', '3': 1, '4': 1, '5': 9, '10': 'backupFile'},
  ],
};

const EventRequest$json = const {
  '1': 'EventRequest',
  '2': const [
    const {'1': 'eventName', '3': 1, '4': 1, '5': 9, '10': 'eventName'},
    const {'1': 'initiator', '3': 2, '4': 1, '5': 9, '10': 'initiator'},
    const {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'jsonPayload', '3': 4, '4': 1, '5': 12, '10': 'jsonPayload'},
  ],
};

const EventResponse$json = const {
  '1': 'EventResponse',
  '2': const [
    const {'1': 'reply', '3': 1, '4': 1, '5': 12, '10': 'reply'},
  ],
};

const EmailRequest$json = const {
  '1': 'EmailRequest',
  '2': const [
    const {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'subject', '3': 2, '4': 1, '5': 9, '10': 'subject'},
    const {'1': 'recipients', '3': 3, '4': 3, '5': 11, '6': '.v2.sys_core.services.EmailRequest.RecipientsEntry', '10': 'recipients'},
    const {'1': 'content', '3': 4, '4': 1, '5': 12, '10': 'content'},
    const {'1': 'cc', '3': 5, '4': 3, '5': 9, '10': 'cc'},
    const {'1': 'bcc', '3': 6, '4': 3, '5': 9, '10': 'bcc'},
    const {'1': 'attachments', '3': 7, '4': 3, '5': 12, '10': 'attachments'},
    const {'1': 'sender_name', '3': 8, '4': 1, '5': 9, '10': 'senderName'},
  ],
  '3': const [EmailRequest_RecipientsEntry$json],
};

const EmailRequest_RecipientsEntry$json = const {
  '1': 'RecipientsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

const EmailResponse$json = const {
  '1': 'EmailResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'err_message', '3': 2, '4': 1, '5': 9, '10': 'errMessage'},
    const {'1': 'success_message', '3': 3, '4': 1, '5': 9, '10': 'successMessage'},
  ],
};

const FileUploadRequest$json = const {
  '1': 'FileUploadRequest',
  '2': const [
    const {'1': 'file_info', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_core.services.FileInfo', '10': 'fileInfo'},
    const {'1': 'chunk', '3': 2, '4': 1, '5': 12, '10': 'chunk'},
  ],
};

const FileInfo$json = const {
  '1': 'FileInfo',
  '2': const [
    const {'1': 'mime_type', '3': 1, '4': 1, '5': 9, '10': 'mimeType'},
    const {'1': 'is_dir', '3': 2, '4': 1, '5': 8, '10': 'isDir'},
    const {'1': 'resource_id', '3': 3, '4': 1, '5': 9, '10': 'resourceId'},
  ],
};

const FileUploadResponse$json = const {
  '1': 'FileUploadResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'error_msg', '3': 3, '4': 1, '5': 9, '10': 'errorMsg'},
    const {'1': 'resource_id', '3': 4, '4': 1, '5': 9, '10': 'resourceId'},
  ],
};

const FileDownloadRequest$json = const {
  '1': 'FileDownloadRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const FileDownloadResponse$json = const {
  '1': 'FileDownloadResponse',
  '2': const [
    const {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    const {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'error_msg', '3': 3, '4': 1, '5': 9, '10': 'errorMsg'},
    const {'1': 'total_size', '3': 4, '4': 1, '5': 3, '10': 'totalSize'},
    const {'1': 'is_compressed', '3': 5, '4': 1, '5': 8, '10': 'isCompressed'},
  ],
};

