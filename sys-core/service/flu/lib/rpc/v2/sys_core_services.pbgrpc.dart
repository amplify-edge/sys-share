///
//  Generated code. Do not modify.
//  source: sys_core_services.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'sys_core_models.pb.dart' as $1;
export 'sys_core_services.pb.dart';

class DbAdminServiceClient extends $grpc.Client {
  static final _$backup = $grpc.ClientMethod<$0.Empty, $1.BackupResult>(
      '/v2.sys_core.services.DbAdminService/Backup',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.BackupResult.fromBuffer(value));
  static final _$listBackup = $grpc.ClientMethod<$0.Empty, $1.ListBackupResult>(
      '/v2.sys_core.services.DbAdminService/ListBackup',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListBackupResult.fromBuffer(value));
  static final _$restore =
      $grpc.ClientMethod<$1.RestoreRequest, $1.RestoreResult>(
          '/v2.sys_core.services.DbAdminService/Restore',
          ($1.RestoreRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.RestoreResult.fromBuffer(value));

  DbAdminServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.BackupResult> backup($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$backup, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.ListBackupResult> listBackup($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listBackup, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.RestoreResult> restore($1.RestoreRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$restore, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class DbAdminServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.sys_core.services.DbAdminService';

  DbAdminServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.BackupResult>(
        'Backup',
        backup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.BackupResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ListBackupResult>(
        'ListBackup',
        listBackup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ListBackupResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RestoreRequest, $1.RestoreResult>(
        'Restore',
        restore_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RestoreRequest.fromBuffer(value),
        ($1.RestoreResult value) => value.writeToBuffer()));
  }

  $async.Future<$1.BackupResult> backup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return backup(call, await request);
  }

  $async.Future<$1.ListBackupResult> listBackup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listBackup(call, await request);
  }

  $async.Future<$1.RestoreResult> restore_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RestoreRequest> request) async {
    return restore(call, await request);
  }

  $async.Future<$1.BackupResult> backup(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.ListBackupResult> listBackup(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.RestoreResult> restore(
      $grpc.ServiceCall call, $1.RestoreRequest request);
}
