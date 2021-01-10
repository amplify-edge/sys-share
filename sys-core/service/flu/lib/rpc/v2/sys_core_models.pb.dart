///
//  Generated code. Do not modify.
//  source: sys_core_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

import 'sys_core_models.pbenum.dart';

export 'sys_core_models.pbenum.dart';

class SingleRestoreResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SingleRestoreResult', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  SingleRestoreResult._() : super();
  factory SingleRestoreResult() => create();
  factory SingleRestoreResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleRestoreResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleRestoreResult clone() => SingleRestoreResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleRestoreResult copyWith(void Function(SingleRestoreResult) updates) => super.copyWith((message) => updates(message as SingleRestoreResult)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SingleRestoreResult create() => SingleRestoreResult._();
  SingleRestoreResult createEmptyInstance() => create();
  static $pb.PbList<SingleRestoreResult> createRepeated() => $pb.PbList<SingleRestoreResult>();
  @$core.pragma('dart2js:noInline')
  static SingleRestoreResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleRestoreResult>(create);
  static SingleRestoreResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

class SingleRestoreRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SingleRestoreRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backupFile', protoName: 'backupFile')
    ..hasRequiredFields = false
  ;

  SingleRestoreRequest._() : super();
  factory SingleRestoreRequest() => create();
  factory SingleRestoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleRestoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleRestoreRequest clone() => SingleRestoreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleRestoreRequest copyWith(void Function(SingleRestoreRequest) updates) => super.copyWith((message) => updates(message as SingleRestoreRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SingleRestoreRequest create() => SingleRestoreRequest._();
  SingleRestoreRequest createEmptyInstance() => create();
  static $pb.PbList<SingleRestoreRequest> createRepeated() => $pb.PbList<SingleRestoreRequest>();
  @$core.pragma('dart2js:noInline')
  static SingleRestoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleRestoreRequest>(create);
  static SingleRestoreRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backupFile => $_getSZ(0);
  @$pb.TagNumber(1)
  set backupFile($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBackupFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackupFile() => clearField(1);
}

class SingleBackupResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SingleBackupResult', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backupFile', protoName: 'backupFile')
    ..hasRequiredFields = false
  ;

  SingleBackupResult._() : super();
  factory SingleBackupResult() => create();
  factory SingleBackupResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleBackupResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleBackupResult clone() => SingleBackupResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleBackupResult copyWith(void Function(SingleBackupResult) updates) => super.copyWith((message) => updates(message as SingleBackupResult)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SingleBackupResult create() => SingleBackupResult._();
  SingleBackupResult createEmptyInstance() => create();
  static $pb.PbList<SingleBackupResult> createRepeated() => $pb.PbList<SingleBackupResult>();
  @$core.pragma('dart2js:noInline')
  static SingleBackupResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleBackupResult>(create);
  static SingleBackupResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backupFile => $_getSZ(0);
  @$pb.TagNumber(1)
  set backupFile($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBackupFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackupFile() => clearField(1);
}

class RestoreAllRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RestoreAllRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'restoreVersion')
    ..hasRequiredFields = false
  ;

  RestoreAllRequest._() : super();
  factory RestoreAllRequest() => create();
  factory RestoreAllRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoreAllRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestoreAllRequest clone() => RestoreAllRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestoreAllRequest copyWith(void Function(RestoreAllRequest) updates) => super.copyWith((message) => updates(message as RestoreAllRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RestoreAllRequest create() => RestoreAllRequest._();
  RestoreAllRequest createEmptyInstance() => create();
  static $pb.PbList<RestoreAllRequest> createRepeated() => $pb.PbList<RestoreAllRequest>();
  @$core.pragma('dart2js:noInline')
  static RestoreAllRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoreAllRequest>(create);
  static RestoreAllRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get restoreVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set restoreVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRestoreVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearRestoreVersion() => clearField(1);
}

class RestoreAllResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RestoreAllResult', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..pc<SingleRestoreResult>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'restoreResults', $pb.PbFieldType.PM, subBuilder: SingleRestoreResult.create)
    ..hasRequiredFields = false
  ;

  RestoreAllResult._() : super();
  factory RestoreAllResult() => create();
  factory RestoreAllResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoreAllResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestoreAllResult clone() => RestoreAllResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestoreAllResult copyWith(void Function(RestoreAllResult) updates) => super.copyWith((message) => updates(message as RestoreAllResult)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RestoreAllResult create() => RestoreAllResult._();
  RestoreAllResult createEmptyInstance() => create();
  static $pb.PbList<RestoreAllResult> createRepeated() => $pb.PbList<RestoreAllResult>();
  @$core.pragma('dart2js:noInline')
  static RestoreAllResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoreAllResult>(create);
  static RestoreAllResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SingleRestoreResult> get restoreResults => $_getList(0);
}

class BackupAllResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BackupAllResult', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..pc<SingleBackupResult>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backupFiles', $pb.PbFieldType.PM, subBuilder: SingleBackupResult.create)
    ..hasRequiredFields = false
  ;

  BackupAllResult._() : super();
  factory BackupAllResult() => create();
  factory BackupAllResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BackupAllResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BackupAllResult clone() => BackupAllResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BackupAllResult copyWith(void Function(BackupAllResult) updates) => super.copyWith((message) => updates(message as BackupAllResult)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BackupAllResult create() => BackupAllResult._();
  BackupAllResult createEmptyInstance() => create();
  static $pb.PbList<BackupAllResult> createRepeated() => $pb.PbList<BackupAllResult>();
  @$core.pragma('dart2js:noInline')
  static BackupAllResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BackupAllResult>(create);
  static BackupAllResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SingleBackupResult> get backupFiles => $_getList(1);
}

class ListBackupRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBackupRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backupVersion')
    ..hasRequiredFields = false
  ;

  ListBackupRequest._() : super();
  factory ListBackupRequest() => create();
  factory ListBackupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBackupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBackupRequest clone() => ListBackupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBackupRequest copyWith(void Function(ListBackupRequest) updates) => super.copyWith((message) => updates(message as ListBackupRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBackupRequest create() => ListBackupRequest._();
  ListBackupRequest createEmptyInstance() => create();
  static $pb.PbList<ListBackupRequest> createRepeated() => $pb.PbList<ListBackupRequest>();
  @$core.pragma('dart2js:noInline')
  static ListBackupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBackupRequest>(create);
  static ListBackupRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backupVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set backupVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBackupVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackupVersion() => clearField(1);
}

class ListBackupResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBackupResult', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..pc<BackupAllResult>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backupVersions', $pb.PbFieldType.PM, subBuilder: BackupAllResult.create)
    ..hasRequiredFields = false
  ;

  ListBackupResult._() : super();
  factory ListBackupResult() => create();
  factory ListBackupResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBackupResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBackupResult clone() => ListBackupResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBackupResult copyWith(void Function(ListBackupResult) updates) => super.copyWith((message) => updates(message as ListBackupResult)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBackupResult create() => ListBackupResult._();
  ListBackupResult createEmptyInstance() => create();
  static $pb.PbList<ListBackupResult> createRepeated() => $pb.PbList<ListBackupResult>();
  @$core.pragma('dart2js:noInline')
  static ListBackupResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBackupResult>(create);
  static ListBackupResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BackupAllResult> get backupVersions => $_getList(0);
}

class EventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventName', protoName: 'eventName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initiator')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jsonPayload', $pb.PbFieldType.OY, protoName: 'jsonPayload')
    ..hasRequiredFields = false
  ;

  EventRequest._() : super();
  factory EventRequest() => create();
  factory EventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventRequest clone() => EventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventRequest copyWith(void Function(EventRequest) updates) => super.copyWith((message) => updates(message as EventRequest)); // ignore: deprecated_member_use
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reply', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  EventResponse._() : super();
  factory EventResponse() => create();
  factory EventResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventResponse clone() => EventResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventResponse copyWith(void Function(EventResponse) updates) => super.copyWith((message) => updates(message as EventResponse)); // ignore: deprecated_member_use
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subject')
    ..m<$core.String, $core.String>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recipients', entryClassName: 'EmailRequest.RecipientsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('v2.sys_core.services'))
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', $pb.PbFieldType.OY)
    ..pPS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cc')
    ..pPS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bcc')
    ..p<$core.List<$core.int>>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attachments', $pb.PbFieldType.PY)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderName')
    ..hasRequiredFields = false
  ;

  EmailRequest._() : super();
  factory EmailRequest() => create();
  factory EmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailRequest clone() => EmailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailRequest copyWith(void Function(EmailRequest) updates) => super.copyWith((message) => updates(message as EmailRequest)); // ignore: deprecated_member_use
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errMessage')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'successMessage')
    ..hasRequiredFields = false
  ;

  EmailResponse._() : super();
  factory EmailResponse() => create();
  factory EmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailResponse clone() => EmailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailResponse copyWith(void Function(EmailResponse) updates) => super.copyWith((message) => updates(message as EmailResponse)); // ignore: deprecated_member_use
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileUploadRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOM<FileInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileInfo', subBuilder: FileInfo.create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  FileUploadRequest._() : super();
  factory FileUploadRequest() => create();
  factory FileUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadRequest clone() => FileUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadRequest copyWith(void Function(FileUploadRequest) updates) => super.copyWith((message) => updates(message as FileUploadRequest)); // ignore: deprecated_member_use
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mimeType')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDir')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resourceId')
    ..hasRequiredFields = false
  ;

  FileInfo._() : super();
  factory FileInfo() => create();
  factory FileInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileInfo clone() => FileInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileInfo copyWith(void Function(FileInfo) updates) => super.copyWith((message) => updates(message as FileInfo)); // ignore: deprecated_member_use
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileUploadResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMsg')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resourceId')
    ..hasRequiredFields = false
  ;

  FileUploadResponse._() : super();
  factory FileUploadResponse() => create();
  factory FileUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadResponse clone() => FileUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadResponse copyWith(void Function(FileUploadResponse) updates) => super.copyWith((message) => updates(message as FileUploadResponse)); // ignore: deprecated_member_use
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileDownloadRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  FileDownloadRequest._() : super();
  factory FileDownloadRequest() => create();
  factory FileDownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileDownloadRequest clone() => FileDownloadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileDownloadRequest copyWith(void Function(FileDownloadRequest) updates) => super.copyWith((message) => updates(message as FileDownloadRequest)); // ignore: deprecated_member_use
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileDownloadResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMsg')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalSize')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isCompressed')
    ..hasRequiredFields = false
  ;

  FileDownloadResponse._() : super();
  factory FileDownloadResponse() => create();
  factory FileDownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileDownloadResponse clone() => FileDownloadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileDownloadResponse copyWith(void Function(FileDownloadResponse) updates) => super.copyWith((message) => updates(message as FileDownloadResponse)); // ignore: deprecated_member_use
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

class GeoLoc extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GeoLoc', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OF)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  GeoLoc._() : super();
  factory GeoLoc() => create();
  factory GeoLoc.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeoLoc.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GeoLoc clone() => GeoLoc()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GeoLoc copyWith(void Function(GeoLoc) updates) => super.copyWith((message) => updates(message as GeoLoc)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeoLoc create() => GeoLoc._();
  GeoLoc createEmptyInstance() => create();
  static $pb.PbList<GeoLoc> createRepeated() => $pb.PbList<GeoLoc>();
  @$core.pragma('dart2js:noInline')
  static GeoLoc getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeoLoc>(create);
  static GeoLoc _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get longitude => $_getN(0);
  @$pb.TagNumber(1)
  set longitude($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLongitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLongitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get latitude => $_getN(1);
  @$pb.TagNumber(2)
  set latitude($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => clearField(2);
}

class Meta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Meta', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actor')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userName')
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datetime', subBuilder: $2.Timestamp.create)
    ..aOM<GeoLoc>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geo', subBuilder: GeoLoc.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgId')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgName')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectId')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectName')
    ..hasRequiredFields = false
  ;

  Meta._() : super();
  factory Meta() => create();
  factory Meta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Meta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Meta clone() => Meta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Meta copyWith(void Function(Meta) updates) => super.copyWith((message) => updates(message as Meta)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Meta create() => Meta._();
  Meta createEmptyInstance() => create();
  static $pb.PbList<Meta> createRepeated() => $pb.PbList<Meta>();
  @$core.pragma('dart2js:noInline')
  static Meta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Meta>(create);
  static Meta _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get actor => $_getSZ(0);
  @$pb.TagNumber(1)
  set actor($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActor() => $_has(0);
  @$pb.TagNumber(1)
  void clearActor() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get datetime => $_getN(3);
  @$pb.TagNumber(4)
  set datetime($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDatetime() => $_has(3);
  @$pb.TagNumber(4)
  void clearDatetime() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureDatetime() => $_ensure(3);

  @$pb.TagNumber(5)
  GeoLoc get geo => $_getN(4);
  @$pb.TagNumber(5)
  set geo(GeoLoc v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGeo() => $_has(4);
  @$pb.TagNumber(5)
  void clearGeo() => clearField(5);
  @$pb.TagNumber(5)
  GeoLoc ensureGeo() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get orgId => $_getSZ(5);
  @$pb.TagNumber(6)
  set orgId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrgId() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrgId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get orgName => $_getSZ(6);
  @$pb.TagNumber(7)
  set orgName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrgName() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrgName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get projectId => $_getSZ(7);
  @$pb.TagNumber(8)
  set projectId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasProjectId() => $_has(7);
  @$pb.TagNumber(8)
  void clearProjectId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get projectName => $_getSZ(8);
  @$pb.TagNumber(9)
  set projectName($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasProjectName() => $_has(8);
  @$pb.TagNumber(9)
  void clearProjectName() => clearField(9);
}

class ModEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ModEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<Meta>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meta', subBuilder: Meta.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventType')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload', $pb.PbFieldType.OY)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payloadEncoding')
    ..hasRequiredFields = false
  ;

  ModEvent._() : super();
  factory ModEvent() => create();
  factory ModEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModEvent clone() => ModEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModEvent copyWith(void Function(ModEvent) updates) => super.copyWith((message) => updates(message as ModEvent)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ModEvent create() => ModEvent._();
  ModEvent createEmptyInstance() => create();
  static $pb.PbList<ModEvent> createRepeated() => $pb.PbList<ModEvent>();
  @$core.pragma('dart2js:noInline')
  static ModEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModEvent>(create);
  static ModEvent _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Meta get meta => $_getN(1);
  @$pb.TagNumber(2)
  set meta(Meta v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMeta() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeta() => clearField(2);
  @$pb.TagNumber(2)
  Meta ensureMeta() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get eventType => $_getSZ(2);
  @$pb.TagNumber(3)
  set eventType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEventType() => $_has(2);
  @$pb.TagNumber(3)
  void clearEventType() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get payload => $_getN(3);
  @$pb.TagNumber(4)
  set payload($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPayload() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayload() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get payloadEncoding => $_getSZ(4);
  @$pb.TagNumber(5)
  set payloadEncoding($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPayloadEncoding() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayloadEncoding() => clearField(5);
}

class AggMeta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AggMeta', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..e<TimeSegment>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeSegment', $pb.PbFieldType.OE, defaultOrMaker: TimeSegment.INVALID, valueOf: TimeSegment.valueOf, enumValues: TimeSegment.values)
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datetimeStart', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datetimeEnd', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  AggMeta._() : super();
  factory AggMeta() => create();
  factory AggMeta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AggMeta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AggMeta clone() => AggMeta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AggMeta copyWith(void Function(AggMeta) updates) => super.copyWith((message) => updates(message as AggMeta)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AggMeta create() => AggMeta._();
  AggMeta createEmptyInstance() => create();
  static $pb.PbList<AggMeta> createRepeated() => $pb.PbList<AggMeta>();
  @$core.pragma('dart2js:noInline')
  static AggMeta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AggMeta>(create);
  static AggMeta _defaultInstance;

  @$pb.TagNumber(1)
  TimeSegment get timeSegment => $_getN(0);
  @$pb.TagNumber(1)
  set timeSegment(TimeSegment v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimeSegment() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeSegment() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get datetimeStart => $_getN(1);
  @$pb.TagNumber(2)
  set datetimeStart($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDatetimeStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearDatetimeStart() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureDatetimeStart() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Timestamp get datetimeEnd => $_getN(2);
  @$pb.TagNumber(3)
  set datetimeEnd($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDatetimeEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearDatetimeEnd() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureDatetimeEnd() => $_ensure(2);
}

class AggModEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AggModEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<AggMeta>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'aggMeta', subBuilder: AggMeta.create)
    ..pc<Meta>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventMetas', $pb.PbFieldType.PM, subBuilder: Meta.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventType')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload', $pb.PbFieldType.OY)
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count')
    ..hasRequiredFields = false
  ;

  AggModEvent._() : super();
  factory AggModEvent() => create();
  factory AggModEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AggModEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AggModEvent clone() => AggModEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AggModEvent copyWith(void Function(AggModEvent) updates) => super.copyWith((message) => updates(message as AggModEvent)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AggModEvent create() => AggModEvent._();
  AggModEvent createEmptyInstance() => create();
  static $pb.PbList<AggModEvent> createRepeated() => $pb.PbList<AggModEvent>();
  @$core.pragma('dart2js:noInline')
  static AggModEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AggModEvent>(create);
  static AggModEvent _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  AggMeta get aggMeta => $_getN(1);
  @$pb.TagNumber(2)
  set aggMeta(AggMeta v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAggMeta() => $_has(1);
  @$pb.TagNumber(2)
  void clearAggMeta() => clearField(2);
  @$pb.TagNumber(2)
  AggMeta ensureAggMeta() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<Meta> get eventMetas => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get eventType => $_getSZ(3);
  @$pb.TagNumber(4)
  set eventType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventType() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get payload => $_getN(4);
  @$pb.TagNumber(5)
  set payload($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPayload() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayload() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get count => $_getI64(5);
  @$pb.TagNumber(6)
  set count($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => clearField(6);
}

class DownloadAnalyticsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DownloadAnalyticsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filter', $pb.PbFieldType.OY)
    ..aOM<$2.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datetimeStart', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datetimeEnd', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  DownloadAnalyticsRequest._() : super();
  factory DownloadAnalyticsRequest() => create();
  factory DownloadAnalyticsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadAnalyticsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadAnalyticsRequest clone() => DownloadAnalyticsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadAnalyticsRequest copyWith(void Function(DownloadAnalyticsRequest) updates) => super.copyWith((message) => updates(message as DownloadAnalyticsRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadAnalyticsRequest create() => DownloadAnalyticsRequest._();
  DownloadAnalyticsRequest createEmptyInstance() => create();
  static $pb.PbList<DownloadAnalyticsRequest> createRepeated() => $pb.PbList<DownloadAnalyticsRequest>();
  @$core.pragma('dart2js:noInline')
  static DownloadAnalyticsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadAnalyticsRequest>(create);
  static DownloadAnalyticsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get filter => $_getN(1);
  @$pb.TagNumber(2)
  set filter($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilter() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get datetimeStart => $_getN(2);
  @$pb.TagNumber(3)
  set datetimeStart($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDatetimeStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearDatetimeStart() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureDatetimeStart() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get datetimeEnd => $_getN(3);
  @$pb.TagNumber(4)
  set datetimeEnd($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDatetimeEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearDatetimeEnd() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureDatetimeEnd() => $_ensure(3);
}

class DownloadAnalyticsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DownloadAnalyticsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_core.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'analyticsBytes', $pb.PbFieldType.OY)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'analyticsUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'analyticsFile')
    ..hasRequiredFields = false
  ;

  DownloadAnalyticsResponse._() : super();
  factory DownloadAnalyticsResponse() => create();
  factory DownloadAnalyticsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadAnalyticsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadAnalyticsResponse clone() => DownloadAnalyticsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadAnalyticsResponse copyWith(void Function(DownloadAnalyticsResponse) updates) => super.copyWith((message) => updates(message as DownloadAnalyticsResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadAnalyticsResponse create() => DownloadAnalyticsResponse._();
  DownloadAnalyticsResponse createEmptyInstance() => create();
  static $pb.PbList<DownloadAnalyticsResponse> createRepeated() => $pb.PbList<DownloadAnalyticsResponse>();
  @$core.pragma('dart2js:noInline')
  static DownloadAnalyticsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadAnalyticsResponse>(create);
  static DownloadAnalyticsResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get analyticsBytes => $_getN(0);
  @$pb.TagNumber(1)
  set analyticsBytes($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAnalyticsBytes() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnalyticsBytes() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get analyticsUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set analyticsUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAnalyticsUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnalyticsUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get analyticsFile => $_getSZ(2);
  @$pb.TagNumber(3)
  set analyticsFile($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAnalyticsFile() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnalyticsFile() => clearField(3);
}

