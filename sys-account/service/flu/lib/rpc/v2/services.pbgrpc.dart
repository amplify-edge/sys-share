///
//  Generated code. Do not modify.
//  source: services.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'models.pb.dart' as $0;
export 'services.pb.dart';

class AccountServiceClient extends $grpc.Client {
  static final _$newAccount = $grpc.ClientMethod<$0.Account, $0.Account>(
      '/v2.services.AccountService/NewAccount',
      ($0.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$getAccount =
      $grpc.ClientMethod<$0.GetAccountRequest, $0.Account>(
          '/v2.services.AccountService/GetAccount',
          ($0.GetAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$listAccounts =
      $grpc.ClientMethod<$0.ListAccountsRequest, $0.ListAccountsResponse>(
          '/v2.services.AccountService/ListAccounts',
          ($0.ListAccountsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListAccountsResponse.fromBuffer(value));
  static final _$searchAccounts =
      $grpc.ClientMethod<$0.SearchAccountsRequest, $0.SearchAccountsResponse>(
          '/v2.services.AccountService/SearchAccounts',
          ($0.SearchAccountsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SearchAccountsResponse.fromBuffer(value));
  static final _$assignAccountToRole =
      $grpc.ClientMethod<$0.AssignAccountToRoleRequest, $0.Account>(
          '/v2.services.AccountService/AssignAccountToRole',
          ($0.AssignAccountToRoleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$updateAccount = $grpc.ClientMethod<$0.Account, $0.Account>(
      '/v2.services.AccountService/UpdateAccount',
      ($0.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$disableAccount =
      $grpc.ClientMethod<$0.DisableAccountRequest, $0.Account>(
          '/v2.services.AccountService/DisableAccount',
          ($0.DisableAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Account> newAccount($0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$newAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Account> getAccount($0.GetAccountRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ListAccountsResponse> listAccounts(
      $0.ListAccountsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listAccounts, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.SearchAccountsResponse> searchAccounts(
      $0.SearchAccountsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$searchAccounts, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Account> assignAccountToRole(
      $0.AssignAccountToRoleRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$assignAccountToRole, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Account> updateAccount($0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Account> disableAccount(
      $0.DisableAccountRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$disableAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AccountServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.services.AccountService';

  AccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Account, $0.Account>(
        'NewAccount',
        newAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAccountRequest, $0.Account>(
        'GetAccount',
        getAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAccountRequest.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListAccountsRequest, $0.ListAccountsResponse>(
            'ListAccounts',
            listAccounts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListAccountsRequest.fromBuffer(value),
            ($0.ListAccountsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchAccountsRequest,
            $0.SearchAccountsResponse>(
        'SearchAccounts',
        searchAccounts_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SearchAccountsRequest.fromBuffer(value),
        ($0.SearchAccountsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AssignAccountToRoleRequest, $0.Account>(
        'AssignAccountToRole',
        assignAccountToRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AssignAccountToRoleRequest.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Account, $0.Account>(
        'UpdateAccount',
        updateAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DisableAccountRequest, $0.Account>(
        'DisableAccount',
        disableAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DisableAccountRequest.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
  }

  $async.Future<$0.Account> newAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return newAccount(call, await request);
  }

  $async.Future<$0.Account> getAccount_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetAccountRequest> request) async {
    return getAccount(call, await request);
  }

  $async.Future<$0.ListAccountsResponse> listAccounts_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListAccountsRequest> request) async {
    return listAccounts(call, await request);
  }

  $async.Future<$0.SearchAccountsResponse> searchAccounts_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SearchAccountsRequest> request) async {
    return searchAccounts(call, await request);
  }

  $async.Future<$0.Account> assignAccountToRole_Pre($grpc.ServiceCall call,
      $async.Future<$0.AssignAccountToRoleRequest> request) async {
    return assignAccountToRole(call, await request);
  }

  $async.Future<$0.Account> updateAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return updateAccount(call, await request);
  }

  $async.Future<$0.Account> disableAccount_Pre($grpc.ServiceCall call,
      $async.Future<$0.DisableAccountRequest> request) async {
    return disableAccount(call, await request);
  }

  $async.Future<$0.Account> newAccount(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$0.Account> getAccount(
      $grpc.ServiceCall call, $0.GetAccountRequest request);
  $async.Future<$0.ListAccountsResponse> listAccounts(
      $grpc.ServiceCall call, $0.ListAccountsRequest request);
  $async.Future<$0.SearchAccountsResponse> searchAccounts(
      $grpc.ServiceCall call, $0.SearchAccountsRequest request);
  $async.Future<$0.Account> assignAccountToRole(
      $grpc.ServiceCall call, $0.AssignAccountToRoleRequest request);
  $async.Future<$0.Account> updateAccount(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$0.Account> disableAccount(
      $grpc.ServiceCall call, $0.DisableAccountRequest request);
}

class AuthServiceClient extends $grpc.Client {
  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
          '/v2.services.AuthService/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegisterResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/v2.services.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$forgotPassword =
      $grpc.ClientMethod<$0.ForgotPasswordRequest, $0.ForgotPasswordResponse>(
          '/v2.services.AuthService/ForgotPassword',
          ($0.ForgotPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ForgotPasswordResponse.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$0.ResetPasswordRequest, $0.ResetPasswordResponse>(
          '/v2.services.AuthService/ResetPassword',
          ($0.ResetPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResetPasswordResponse.fromBuffer(value));
  static final _$refreshAccessToken = $grpc.ClientMethod<
          $0.RefreshAccessTokenRequest, $0.RefreshAccessTokenResponse>(
      '/v2.services.AuthService/RefreshAccessToken',
      ($0.RefreshAccessTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RefreshAccessTokenResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.RegisterResponse> register($0.RegisterRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$register, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$login, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ForgotPasswordResponse> forgotPassword(
      $0.ForgotPasswordRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$forgotPassword, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ResetPasswordResponse> resetPassword(
      $0.ResetPasswordRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$resetPassword, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.RefreshAccessTokenResponse> refreshAccessToken(
      $0.RefreshAccessTokenRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$refreshAccessToken, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.services.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ForgotPasswordRequest,
            $0.ForgotPasswordResponse>(
        'ForgotPassword',
        forgotPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ForgotPasswordRequest.fromBuffer(value),
        ($0.ForgotPasswordResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ResetPasswordRequest, $0.ResetPasswordResponse>(
            'ResetPassword',
            resetPassword_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ResetPasswordRequest.fromBuffer(value),
            ($0.ResetPasswordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RefreshAccessTokenRequest,
            $0.RefreshAccessTokenResponse>(
        'RefreshAccessToken',
        refreshAccessToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RefreshAccessTokenRequest.fromBuffer(value),
        ($0.RefreshAccessTokenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterResponse> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.ForgotPasswordResponse> forgotPassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ForgotPasswordRequest> request) async {
    return forgotPassword(call, await request);
  }

  $async.Future<$0.ResetPasswordResponse> resetPassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ResetPasswordRequest> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$0.RefreshAccessTokenResponse> refreshAccessToken_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RefreshAccessTokenRequest> request) async {
    return refreshAccessToken(call, await request);
  }

  $async.Future<$0.RegisterResponse> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.ForgotPasswordResponse> forgotPassword(
      $grpc.ServiceCall call, $0.ForgotPasswordRequest request);
  $async.Future<$0.ResetPasswordResponse> resetPassword(
      $grpc.ServiceCall call, $0.ResetPasswordRequest request);
  $async.Future<$0.RefreshAccessTokenResponse> refreshAccessToken(
      $grpc.ServiceCall call, $0.RefreshAccessTokenRequest request);
}
