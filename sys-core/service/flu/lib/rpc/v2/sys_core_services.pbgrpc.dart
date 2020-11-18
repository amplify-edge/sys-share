///
//  Generated code. Do not modify.
//  source: sys_core_services.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

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

class BusServiceClient extends $grpc.Client {
  static final _$broadcast =
      $grpc.ClientMethod<$1.EventRequest, $1.EventResponse>(
          '/v2.sys_core.services.BusService/Broadcast',
          ($1.EventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.EventResponse.fromBuffer(value));

  BusServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.EventResponse> broadcast($1.EventRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$broadcast, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class BusServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.sys_core.services.BusService';

  BusServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.EventRequest, $1.EventResponse>(
        'Broadcast',
        broadcast_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EventRequest.fromBuffer(value),
        ($1.EventResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.EventResponse> broadcast_Pre(
      $grpc.ServiceCall call, $async.Future<$1.EventRequest> request) async {
    return broadcast(call, await request);
  }

  $async.Future<$1.EventResponse> broadcast(
      $grpc.ServiceCall call, $1.EventRequest request);
}

class EmailServiceClient extends $grpc.Client {
  static final _$sendMail =
      $grpc.ClientMethod<$1.EmailRequest, $1.EmailResponse>(
          '/v2.sys_core.services.EmailService/SendMail',
          ($1.EmailRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.EmailResponse.fromBuffer(value));

  EmailServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.EmailResponse> sendMail($1.EmailRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$sendMail, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class EmailServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.sys_core.services.EmailService';

  EmailServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.EmailRequest, $1.EmailResponse>(
        'SendMail',
        sendMail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EmailRequest.fromBuffer(value),
        ($1.EmailResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.EmailResponse> sendMail_Pre(
      $grpc.ServiceCall call, $async.Future<$1.EmailRequest> request) async {
    return sendMail(call, await request);
  }

  $async.Future<$1.EmailResponse> sendMail(
      $grpc.ServiceCall call, $1.EmailRequest request);
}
