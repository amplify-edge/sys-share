///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'users.pb.dart' as $1;
export 'users.pb.dart';

class AccountServiceClient extends $grpc.Client {
  static final _$newAccount = $grpc.ClientMethod<$1.Account, $1.Account>(
      '/getcouragenow.sys.v2.sys_account.AccountService/NewAccount',
      ($1.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Account.fromBuffer(value));
  static final _$getAccount =
      $grpc.ClientMethod<$1.GetAccountRequest, $1.Account>(
          '/getcouragenow.sys.v2.sys_account.AccountService/GetAccount',
          ($1.GetAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Account.fromBuffer(value));
  static final _$listAccounts =
      $grpc.ClientMethod<$1.ListAccountsRequest, $1.ListAccountsResponse>(
          '/getcouragenow.sys.v2.sys_account.AccountService/ListAccounts',
          ($1.ListAccountsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ListAccountsResponse.fromBuffer(value));
  static final _$searchAccounts =
      $grpc.ClientMethod<$1.SearchAccountsRequest, $1.SearchAccountsResponse>(
          '/getcouragenow.sys.v2.sys_account.AccountService/SearchAccounts',
          ($1.SearchAccountsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.SearchAccountsResponse.fromBuffer(value));
  static final _$assignAccountToRole = $grpc.ClientMethod<
          $1.AssignAccountToRoleRequest, $1.Account>(
      '/getcouragenow.sys.v2.sys_account.AccountService/AssignAccountToRole',
      ($1.AssignAccountToRoleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Account.fromBuffer(value));
  static final _$updateAccount = $grpc.ClientMethod<$1.Account, $1.Account>(
      '/getcouragenow.sys.v2.sys_account.AccountService/UpdateAccount',
      ($1.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Account.fromBuffer(value));
  static final _$disableAccount =
      $grpc.ClientMethod<$1.DisableAccountRequest, $1.Account>(
          '/getcouragenow.sys.v2.sys_account.AccountService/DisableAccount',
          ($1.DisableAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Account.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.Account> newAccount($1.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$newAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Account> getAccount($1.GetAccountRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.ListAccountsResponse> listAccounts(
      $1.ListAccountsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listAccounts, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.SearchAccountsResponse> searchAccounts(
      $1.SearchAccountsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$searchAccounts, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Account> assignAccountToRole(
      $1.AssignAccountToRoleRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$assignAccountToRole, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Account> updateAccount($1.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Account> disableAccount(
      $1.DisableAccountRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$disableAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AccountServiceBase extends $grpc.Service {
  $core.String get $name => 'getcouragenow.sys.v2.sys_account.AccountService';

  AccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Account, $1.Account>(
        'NewAccount',
        newAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Account.fromBuffer(value),
        ($1.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAccountRequest, $1.Account>(
        'GetAccount',
        getAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetAccountRequest.fromBuffer(value),
        ($1.Account value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.ListAccountsRequest, $1.ListAccountsResponse>(
            'ListAccounts',
            listAccounts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.ListAccountsRequest.fromBuffer(value),
            ($1.ListAccountsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SearchAccountsRequest,
            $1.SearchAccountsResponse>(
        'SearchAccounts',
        searchAccounts_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.SearchAccountsRequest.fromBuffer(value),
        ($1.SearchAccountsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AssignAccountToRoleRequest, $1.Account>(
        'AssignAccountToRole',
        assignAccountToRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.AssignAccountToRoleRequest.fromBuffer(value),
        ($1.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Account, $1.Account>(
        'UpdateAccount',
        updateAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Account.fromBuffer(value),
        ($1.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DisableAccountRequest, $1.Account>(
        'DisableAccount',
        disableAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.DisableAccountRequest.fromBuffer(value),
        ($1.Account value) => value.writeToBuffer()));
  }

  $async.Future<$1.Account> newAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Account> request) async {
    return newAccount(call, await request);
  }

  $async.Future<$1.Account> getAccount_Pre($grpc.ServiceCall call,
      $async.Future<$1.GetAccountRequest> request) async {
    return getAccount(call, await request);
  }

  $async.Future<$1.ListAccountsResponse> listAccounts_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ListAccountsRequest> request) async {
    return listAccounts(call, await request);
  }

  $async.Future<$1.SearchAccountsResponse> searchAccounts_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.SearchAccountsRequest> request) async {
    return searchAccounts(call, await request);
  }

  $async.Future<$1.Account> assignAccountToRole_Pre($grpc.ServiceCall call,
      $async.Future<$1.AssignAccountToRoleRequest> request) async {
    return assignAccountToRole(call, await request);
  }

  $async.Future<$1.Account> updateAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Account> request) async {
    return updateAccount(call, await request);
  }

  $async.Future<$1.Account> disableAccount_Pre($grpc.ServiceCall call,
      $async.Future<$1.DisableAccountRequest> request) async {
    return disableAccount(call, await request);
  }

  $async.Future<$1.Account> newAccount(
      $grpc.ServiceCall call, $1.Account request);
  $async.Future<$1.Account> getAccount(
      $grpc.ServiceCall call, $1.GetAccountRequest request);
  $async.Future<$1.ListAccountsResponse> listAccounts(
      $grpc.ServiceCall call, $1.ListAccountsRequest request);
  $async.Future<$1.SearchAccountsResponse> searchAccounts(
      $grpc.ServiceCall call, $1.SearchAccountsRequest request);
  $async.Future<$1.Account> assignAccountToRole(
      $grpc.ServiceCall call, $1.AssignAccountToRoleRequest request);
  $async.Future<$1.Account> updateAccount(
      $grpc.ServiceCall call, $1.Account request);
  $async.Future<$1.Account> disableAccount(
      $grpc.ServiceCall call, $1.DisableAccountRequest request);
}
