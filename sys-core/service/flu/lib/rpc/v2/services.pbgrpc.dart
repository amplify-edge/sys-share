///
//  Generated code. Do not modify.
//  source: services.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'models.pb.dart' as $1;
export 'services.pb.dart';

class DbAdminServiceClient extends $grpc.Client {
  static final _$backup = $grpc.ClientMethod<$0.Empty, $1.BackupResult>(
      '/v2.services.DbAdminService/Backup',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.BackupResult.fromBuffer(value));
  static final _$backupList = $grpc.ClientMethod<$0.Empty, $1.BackupListResult>(
      '/v2.services.DbAdminService/BackupList',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.BackupListResult.fromBuffer(value));
  static final _$restore =
      $grpc.ClientMethod<$1.RestoreRequest, $1.RestoreResult>(
          '/v2.services.DbAdminService/Restore',
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

  $grpc.ResponseFuture<$1.BackupListResult> backupList($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$backupList, $async.Stream.fromIterable([request]),
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
  $core.String get $name => 'v2.services.DbAdminService';

  DbAdminServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.BackupResult>(
        'Backup',
        backup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.BackupResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.BackupListResult>(
        'BackupList',
        backupList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.BackupListResult value) => value.writeToBuffer()));
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

  $async.Future<$1.BackupListResult> backupList_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return backupList(call, await request);
  }

  $async.Future<$1.RestoreResult> restore_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RestoreRequest> request) async {
    return restore(call, await request);
  }

  $async.Future<$1.BackupResult> backup(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.BackupListResult> backupList(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.RestoreResult> restore(
      $grpc.ServiceCall call, $1.RestoreRequest request);
}
