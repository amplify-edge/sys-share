///
//  Generated code. Do not modify.
//  source: sys_core_models.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

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

