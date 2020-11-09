///
//  Generated code. Do not modify.
//  source: sys_core_models.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RestoreResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RestoreResult', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, 'result')
    ..hasRequiredFields = false
  ;

  RestoreResult._() : super();
  factory RestoreResult() => create();
  factory RestoreResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoreResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RestoreResult clone() => RestoreResult()..mergeFromMessage(this);
  RestoreResult copyWith(void Function(RestoreResult) updates) => super.copyWith((message) => updates(message as RestoreResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RestoreResult create() => RestoreResult._();
  RestoreResult createEmptyInstance() => create();
  static $pb.PbList<RestoreResult> createRepeated() => $pb.PbList<RestoreResult>();
  @$core.pragma('dart2js:noInline')
  static RestoreResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoreResult>(create);
  static RestoreResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

class BackupResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BackupResult', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, 'backupFile', protoName: 'backupFile')
    ..hasRequiredFields = false
  ;

  BackupResult._() : super();
  factory BackupResult() => create();
  factory BackupResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BackupResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BackupResult clone() => BackupResult()..mergeFromMessage(this);
  BackupResult copyWith(void Function(BackupResult) updates) => super.copyWith((message) => updates(message as BackupResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BackupResult create() => BackupResult._();
  BackupResult createEmptyInstance() => create();
  static $pb.PbList<BackupResult> createRepeated() => $pb.PbList<BackupResult>();
  @$core.pragma('dart2js:noInline')
  static BackupResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BackupResult>(create);
  static BackupResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backupFile => $_getSZ(0);
  @$pb.TagNumber(1)
  set backupFile($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBackupFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackupFile() => clearField(1);
}

class ListBackupResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListBackupResult', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..pc<BackupResult>(1, 'backupFiles', $pb.PbFieldType.PM, protoName: 'backupFiles', subBuilder: BackupResult.create)
    ..hasRequiredFields = false
  ;

  ListBackupResult._() : super();
  factory ListBackupResult() => create();
  factory ListBackupResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBackupResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListBackupResult clone() => ListBackupResult()..mergeFromMessage(this);
  ListBackupResult copyWith(void Function(ListBackupResult) updates) => super.copyWith((message) => updates(message as ListBackupResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBackupResult create() => ListBackupResult._();
  ListBackupResult createEmptyInstance() => create();
  static $pb.PbList<ListBackupResult> createRepeated() => $pb.PbList<ListBackupResult>();
  @$core.pragma('dart2js:noInline')
  static ListBackupResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBackupResult>(create);
  static ListBackupResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BackupResult> get backupFiles => $_getList(0);
}

class RestoreRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RestoreRequest', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, 'backupFile', protoName: 'backupFile')
    ..hasRequiredFields = false
  ;

  RestoreRequest._() : super();
  factory RestoreRequest() => create();
  factory RestoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RestoreRequest clone() => RestoreRequest()..mergeFromMessage(this);
  RestoreRequest copyWith(void Function(RestoreRequest) updates) => super.copyWith((message) => updates(message as RestoreRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RestoreRequest create() => RestoreRequest._();
  RestoreRequest createEmptyInstance() => create();
  static $pb.PbList<RestoreRequest> createRepeated() => $pb.PbList<RestoreRequest>();
  @$core.pragma('dart2js:noInline')
  static RestoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoreRequest>(create);
  static RestoreRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backupFile => $_getSZ(0);
  @$pb.TagNumber(1)
  set backupFile($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBackupFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackupFile() => clearField(1);
}

class EventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EventRequest', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, 'eventName', protoName: 'eventName')
    ..aOS(2, 'initiator')
    ..aOS(3, 'userId', protoName: 'userId')
    ..a<$core.List<$core.int>>(4, 'jsonPayload', $pb.PbFieldType.OY, protoName: 'jsonPayload')
    ..hasRequiredFields = false
  ;

  EventRequest._() : super();
  factory EventRequest() => create();
  factory EventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EventRequest clone() => EventRequest()..mergeFromMessage(this);
  EventRequest copyWith(void Function(EventRequest) updates) => super.copyWith((message) => updates(message as EventRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventRequest create() => EventRequest._();
  EventRequest createEmptyInstance() => create();
  static $pb.PbList<EventRequest> createRepeated() => $pb.PbList<EventRequest>();
  @$core.pragma('dart2js:noInline')
  static EventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventRequest>(create);
  static EventRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventName => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventName() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get initiator => $_getSZ(1);
  @$pb.TagNumber(2)
  set initiator($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInitiator() => $_has(1);
  @$pb.TagNumber(2)
  void clearInitiator() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get jsonPayload => $_getN(3);
  @$pb.TagNumber(4)
  set jsonPayload($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasJsonPayload() => $_has(3);
  @$pb.TagNumber(4)
  void clearJsonPayload() => clearField(4);
}

class EventResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EventResponse', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'reply', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  EventResponse._() : super();
  factory EventResponse() => create();
  factory EventResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EventResponse clone() => EventResponse()..mergeFromMessage(this);
  EventResponse copyWith(void Function(EventResponse) updates) => super.copyWith((message) => updates(message as EventResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventResponse create() => EventResponse._();
  EventResponse createEmptyInstance() => create();
  static $pb.PbList<EventResponse> createRepeated() => $pb.PbList<EventResponse>();
  @$core.pragma('dart2js:noInline')
  static EventResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventResponse>(create);
  static EventResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get reply => $_getN(0);
  @$pb.TagNumber(1)
  set reply($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReply() => $_has(0);
  @$pb.TagNumber(1)
  void clearReply() => clearField(1);
}

class EmailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EmailRequest', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, 'sender')
    ..aOS(2, 'subject')
    ..m<$core.String, $core.String>(3, 'recipients', entryClassName: 'EmailRequest.RecipientsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('v2.sys_core.services'))
    ..a<$core.List<$core.int>>(4, 'content', $pb.PbFieldType.OY)
    ..pPS(5, 'cc')
    ..pPS(6, 'bcc')
    ..p<$core.List<$core.int>>(7, 'attachments', $pb.PbFieldType.PY)
    ..aOS(8, 'senderName')
    ..hasRequiredFields = false
  ;

  EmailRequest._() : super();
  factory EmailRequest() => create();
  factory EmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EmailRequest clone() => EmailRequest()..mergeFromMessage(this);
  EmailRequest copyWith(void Function(EmailRequest) updates) => super.copyWith((message) => updates(message as EmailRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailRequest create() => EmailRequest._();
  EmailRequest createEmptyInstance() => create();
  static $pb.PbList<EmailRequest> createRepeated() => $pb.PbList<EmailRequest>();
  @$core.pragma('dart2js:noInline')
  static EmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailRequest>(create);
  static EmailRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subject => $_getSZ(1);
  @$pb.TagNumber(2)
  set subject($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubject() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubject() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get recipients => $_getMap(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get content => $_getN(3);
  @$pb.TagNumber(4)
  set content($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get cc => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get bcc => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.List<$core.int>> get attachments => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get senderName => $_getSZ(7);
  @$pb.TagNumber(8)
  set senderName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSenderName() => $_has(7);
  @$pb.TagNumber(8)
  void clearSenderName() => clearField(8);
}

class EmailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EmailResponse', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..aOS(2, 'errMessage')
    ..aOS(3, 'successMessage')
    ..hasRequiredFields = false
  ;

  EmailResponse._() : super();
  factory EmailResponse() => create();
  factory EmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EmailResponse clone() => EmailResponse()..mergeFromMessage(this);
  EmailResponse copyWith(void Function(EmailResponse) updates) => super.copyWith((message) => updates(message as EmailResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailResponse create() => EmailResponse._();
  EmailResponse createEmptyInstance() => create();
  static $pb.PbList<EmailResponse> createRepeated() => $pb.PbList<EmailResponse>();
  @$core.pragma('dart2js:noInline')
  static EmailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailResponse>(create);
  static EmailResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get successMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set successMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccessMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccessMessage() => clearField(3);
}

class FileUploadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FileUploadRequest', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOM<FileInfo>(1, 'fileInfo', subBuilder: FileInfo.create)
    ..a<$core.List<$core.int>>(2, 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  FileUploadRequest._() : super();
  factory FileUploadRequest() => create();
  factory FileUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FileUploadRequest clone() => FileUploadRequest()..mergeFromMessage(this);
  FileUploadRequest copyWith(void Function(FileUploadRequest) updates) => super.copyWith((message) => updates(message as FileUploadRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileUploadRequest create() => FileUploadRequest._();
  FileUploadRequest createEmptyInstance() => create();
  static $pb.PbList<FileUploadRequest> createRepeated() => $pb.PbList<FileUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static FileUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadRequest>(create);
  static FileUploadRequest _defaultInstance;

  @$pb.TagNumber(1)
  FileInfo get fileInfo => $_getN(0);
  @$pb.TagNumber(1)
  set fileInfo(FileInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileInfo() => clearField(1);
  @$pb.TagNumber(1)
  FileInfo ensureFileInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get chunk => $_getN(1);
  @$pb.TagNumber(2)
  set chunk($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunk() => clearField(2);
}

class FileInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FileInfo', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, 'mimeType')
    ..aOB(2, 'isDir')
    ..aOS(3, 'resourceId')
    ..hasRequiredFields = false
  ;

  FileInfo._() : super();
  factory FileInfo() => create();
  factory FileInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FileInfo clone() => FileInfo()..mergeFromMessage(this);
  FileInfo copyWith(void Function(FileInfo) updates) => super.copyWith((message) => updates(message as FileInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileInfo create() => FileInfo._();
  FileInfo createEmptyInstance() => create();
  static $pb.PbList<FileInfo> createRepeated() => $pb.PbList<FileInfo>();
  @$core.pragma('dart2js:noInline')
  static FileInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileInfo>(create);
  static FileInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mimeType => $_getSZ(0);
  @$pb.TagNumber(1)
  set mimeType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMimeType() => $_has(0);
  @$pb.TagNumber(1)
  void clearMimeType() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isDir => $_getBF(1);
  @$pb.TagNumber(2)
  set isDir($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsDir() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsDir() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get resourceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceId() => clearField(3);
}

class FileUploadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FileUploadResponse', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..aOS(2, 'id')
    ..aOS(3, 'errorMsg')
    ..aOS(4, 'resourceId')
    ..hasRequiredFields = false
  ;

  FileUploadResponse._() : super();
  factory FileUploadResponse() => create();
  factory FileUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FileUploadResponse clone() => FileUploadResponse()..mergeFromMessage(this);
  FileUploadResponse copyWith(void Function(FileUploadResponse) updates) => super.copyWith((message) => updates(message as FileUploadResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileUploadResponse create() => FileUploadResponse._();
  FileUploadResponse createEmptyInstance() => create();
  static $pb.PbList<FileUploadResponse> createRepeated() => $pb.PbList<FileUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static FileUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadResponse>(create);
  static FileUploadResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMsg => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMsg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMsg() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get resourceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set resourceId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasResourceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearResourceId() => clearField(4);
}

class FileDownloadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FileDownloadRequest', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  FileDownloadRequest._() : super();
  factory FileDownloadRequest() => create();
  factory FileDownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FileDownloadRequest clone() => FileDownloadRequest()..mergeFromMessage(this);
  FileDownloadRequest copyWith(void Function(FileDownloadRequest) updates) => super.copyWith((message) => updates(message as FileDownloadRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileDownloadRequest create() => FileDownloadRequest._();
  FileDownloadRequest createEmptyInstance() => create();
  static $pb.PbList<FileDownloadRequest> createRepeated() => $pb.PbList<FileDownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static FileDownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileDownloadRequest>(create);
  static FileDownloadRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class FileDownloadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FileDownloadResponse', package: const $pb.PackageName('v2.sys_core.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'chunk', $pb.PbFieldType.OY)
    ..aOB(2, 'success')
    ..aOS(3, 'errorMsg')
    ..aInt64(4, 'totalSize')
    ..aOB(5, 'isCompressed')
    ..hasRequiredFields = false
  ;

  FileDownloadResponse._() : super();
  factory FileDownloadResponse() => create();
  factory FileDownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FileDownloadResponse clone() => FileDownloadResponse()..mergeFromMessage(this);
  FileDownloadResponse copyWith(void Function(FileDownloadResponse) updates) => super.copyWith((message) => updates(message as FileDownloadResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileDownloadResponse create() => FileDownloadResponse._();
  FileDownloadResponse createEmptyInstance() => create();
  static $pb.PbList<FileDownloadResponse> createRepeated() => $pb.PbList<FileDownloadResponse>();
  @$core.pragma('dart2js:noInline')
  static FileDownloadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileDownloadResponse>(create);
  static FileDownloadResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMsg => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMsg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMsg() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalSize => $_getI64(3);
  @$pb.TagNumber(4)
  set totalSize($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isCompressed => $_getBF(4);
  @$pb.TagNumber(5)
  set isCompressed($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsCompressed() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsCompressed() => clearField(5);
}

