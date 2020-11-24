///
//  Generated code. Do not modify.
//  source: sys_account_services.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sys_account_models.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'sys_account_services.pb.dart';

class AccountServiceClient extends $grpc.Client {
  static final _$newAccount =
      $grpc.ClientMethod<$0.AccountNewRequest, $0.Account>(
          '/v2.sys_account.services.AccountService/NewAccount',
          ($0.AccountNewRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$getAccount = $grpc.ClientMethod<$0.IdRequest, $0.Account>(
      '/v2.sys_account.services.AccountService/GetAccount',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$listAccounts =
      $grpc.ClientMethod<$0.ListAccountsRequest, $0.ListAccountsResponse>(
          '/v2.sys_account.services.AccountService/ListAccounts',
          ($0.ListAccountsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListAccountsResponse.fromBuffer(value));
  static final _$searchAccounts =
      $grpc.ClientMethod<$0.SearchAccountsRequest, $0.SearchAccountsResponse>(
          '/v2.sys_account.services.AccountService/SearchAccounts',
          ($0.SearchAccountsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SearchAccountsResponse.fromBuffer(value));
  static final _$assignAccountToRole =
      $grpc.ClientMethod<$0.AssignAccountToRoleRequest, $0.Account>(
          '/v2.sys_account.services.AccountService/AssignAccountToRole',
          ($0.AssignAccountToRoleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$updateAccount =
      $grpc.ClientMethod<$0.AccountUpdateRequest, $0.Account>(
          '/v2.sys_account.services.AccountService/UpdateAccount',
          ($0.AccountUpdateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$disableAccount =
      $grpc.ClientMethod<$0.DisableAccountRequest, $0.Account>(
          '/v2.sys_account.services.AccountService/DisableAccount',
          ($0.DisableAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Account> newAccount($0.AccountNewRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$newAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Account> getAccount($0.IdRequest request,
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

  $grpc.ResponseFuture<$0.Account> updateAccount(
      $0.AccountUpdateRequest request,
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
  $core.String get $name => 'v2.sys_account.services.AccountService';

  AccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AccountNewRequest, $0.Account>(
        'NewAccount',
        newAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AccountNewRequest.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $0.Account>(
        'GetAccount',
        getAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
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
    $addMethod($grpc.ServiceMethod<$0.AccountUpdateRequest, $0.Account>(
        'UpdateAccount',
        updateAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AccountUpdateRequest.fromBuffer(value),
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

  $async.Future<$0.Account> newAccount_Pre($grpc.ServiceCall call,
      $async.Future<$0.AccountNewRequest> request) async {
    return newAccount(call, await request);
  }

  $async.Future<$0.Account> getAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
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

  $async.Future<$0.Account> updateAccount_Pre($grpc.ServiceCall call,
      $async.Future<$0.AccountUpdateRequest> request) async {
    return updateAccount(call, await request);
  }

  $async.Future<$0.Account> disableAccount_Pre($grpc.ServiceCall call,
      $async.Future<$0.DisableAccountRequest> request) async {
    return disableAccount(call, await request);
  }

  $async.Future<$0.Account> newAccount(
      $grpc.ServiceCall call, $0.AccountNewRequest request);
  $async.Future<$0.Account> getAccount(
      $grpc.ServiceCall call, $0.IdRequest request);
  $async.Future<$0.ListAccountsResponse> listAccounts(
      $grpc.ServiceCall call, $0.ListAccountsRequest request);
  $async.Future<$0.SearchAccountsResponse> searchAccounts(
      $grpc.ServiceCall call, $0.SearchAccountsRequest request);
  $async.Future<$0.Account> assignAccountToRole(
      $grpc.ServiceCall call, $0.AssignAccountToRoleRequest request);
  $async.Future<$0.Account> updateAccount(
      $grpc.ServiceCall call, $0.AccountUpdateRequest request);
  $async.Future<$0.Account> disableAccount(
      $grpc.ServiceCall call, $0.DisableAccountRequest request);
}

class OrgProjServiceClient extends $grpc.Client {
  static final _$newProject = $grpc.ClientMethod<$0.ProjectRequest, $0.Project>(
      '/v2.sys_account.services.OrgProjService/NewProject',
      ($0.ProjectRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Project.fromBuffer(value));
  static final _$getProject = $grpc.ClientMethod<$0.IdRequest, $0.Project>(
      '/v2.sys_account.services.OrgProjService/GetProject',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Project.fromBuffer(value));
  static final _$listProject =
      $grpc.ClientMethod<$0.ListRequest, $0.ListResponse>(
          '/v2.sys_account.services.OrgProjService/ListProject',
          ($0.ListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));
  static final _$updateProject =
      $grpc.ClientMethod<$0.ProjectUpdateRequest, $0.Project>(
          '/v2.sys_account.services.OrgProjService/UpdateProject',
          ($0.ProjectUpdateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Project.fromBuffer(value));
  static final _$deleteProject = $grpc.ClientMethod<$0.IdRequest, $1.Empty>(
      '/v2.sys_account.services.OrgProjService/DeleteProject',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$newOrg = $grpc.ClientMethod<$0.OrgRequest, $0.Org>(
      '/v2.sys_account.services.OrgProjService/NewOrg',
      ($0.OrgRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Org.fromBuffer(value));
  static final _$getOrg = $grpc.ClientMethod<$0.IdRequest, $0.Org>(
      '/v2.sys_account.services.OrgProjService/GetOrg',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Org.fromBuffer(value));
  static final _$listOrg = $grpc.ClientMethod<$0.ListRequest, $0.ListResponse>(
      '/v2.sys_account.services.OrgProjService/ListOrg',
      ($0.ListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));
  static final _$updateOrg = $grpc.ClientMethod<$0.OrgUpdateRequest, $0.Org>(
      '/v2.sys_account.services.OrgProjService/UpdateOrg',
      ($0.OrgUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Org.fromBuffer(value));
  static final _$deleteOrg = $grpc.ClientMethod<$0.IdRequest, $1.Empty>(
      '/v2.sys_account.services.OrgProjService/DeleteOrg',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  OrgProjServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Project> newProject($0.ProjectRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$newProject, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Project> getProject($0.IdRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getProject, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ListResponse> listProject($0.ListRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listProject, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Project> updateProject(
      $0.ProjectUpdateRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateProject, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> deleteProject($0.IdRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteProject, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Org> newOrg($0.OrgRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$newOrg, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Org> getOrg($0.IdRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getOrg, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ListResponse> listOrg($0.ListRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$listOrg, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Org> updateOrg($0.OrgUpdateRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$updateOrg, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> deleteOrg($0.IdRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$deleteOrg, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class OrgProjServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.sys_account.services.OrgProjService';

  OrgProjServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ProjectRequest, $0.Project>(
        'NewProject',
        newProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProjectRequest.fromBuffer(value),
        ($0.Project value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $0.Project>(
        'GetProject',
        getProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($0.Project value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListRequest, $0.ListResponse>(
        'ListProject',
        listProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListRequest.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProjectUpdateRequest, $0.Project>(
        'UpdateProject',
        updateProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ProjectUpdateRequest.fromBuffer(value),
        ($0.Project value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $1.Empty>(
        'DeleteProject',
        deleteProject_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OrgRequest, $0.Org>(
        'NewOrg',
        newOrg_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OrgRequest.fromBuffer(value),
        ($0.Org value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $0.Org>(
        'GetOrg',
        getOrg_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($0.Org value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListRequest, $0.ListResponse>(
        'ListOrg',
        listOrg_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListRequest.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OrgUpdateRequest, $0.Org>(
        'UpdateOrg',
        updateOrg_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OrgUpdateRequest.fromBuffer(value),
        ($0.Org value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $1.Empty>(
        'DeleteOrg',
        deleteOrg_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Project> newProject_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProjectRequest> request) async {
    return newProject(call, await request);
  }

  $async.Future<$0.Project> getProject_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return getProject(call, await request);
  }

  $async.Future<$0.ListResponse> listProject_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListRequest> request) async {
    return listProject(call, await request);
  }

  $async.Future<$0.Project> updateProject_Pre($grpc.ServiceCall call,
      $async.Future<$0.ProjectUpdateRequest> request) async {
    return updateProject(call, await request);
  }

  $async.Future<$1.Empty> deleteProject_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return deleteProject(call, await request);
  }

  $async.Future<$0.Org> newOrg_Pre(
      $grpc.ServiceCall call, $async.Future<$0.OrgRequest> request) async {
    return newOrg(call, await request);
  }

  $async.Future<$0.Org> getOrg_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return getOrg(call, await request);
  }

  $async.Future<$0.ListResponse> listOrg_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListRequest> request) async {
    return listOrg(call, await request);
  }

  $async.Future<$0.Org> updateOrg_Pre($grpc.ServiceCall call,
      $async.Future<$0.OrgUpdateRequest> request) async {
    return updateOrg(call, await request);
  }

  $async.Future<$1.Empty> deleteOrg_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return deleteOrg(call, await request);
  }

  $async.Future<$0.Project> newProject(
      $grpc.ServiceCall call, $0.ProjectRequest request);
  $async.Future<$0.Project> getProject(
      $grpc.ServiceCall call, $0.IdRequest request);
  $async.Future<$0.ListResponse> listProject(
      $grpc.ServiceCall call, $0.ListRequest request);
  $async.Future<$0.Project> updateProject(
      $grpc.ServiceCall call, $0.ProjectUpdateRequest request);
  $async.Future<$1.Empty> deleteProject(
      $grpc.ServiceCall call, $0.IdRequest request);
  $async.Future<$0.Org> newOrg($grpc.ServiceCall call, $0.OrgRequest request);
  $async.Future<$0.Org> getOrg($grpc.ServiceCall call, $0.IdRequest request);
  $async.Future<$0.ListResponse> listOrg(
      $grpc.ServiceCall call, $0.ListRequest request);
  $async.Future<$0.Org> updateOrg(
      $grpc.ServiceCall call, $0.OrgUpdateRequest request);
  $async.Future<$1.Empty> deleteOrg(
      $grpc.ServiceCall call, $0.IdRequest request);
}

class AuthServiceClient extends $grpc.Client {
  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
          '/v2.sys_account.services.AuthService/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegisterResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/v2.sys_account.services.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$forgotPassword =
      $grpc.ClientMethod<$0.ForgotPasswordRequest, $0.ForgotPasswordResponse>(
          '/v2.sys_account.services.AuthService/ForgotPassword',
          ($0.ForgotPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ForgotPasswordResponse.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$0.ResetPasswordRequest, $0.ResetPasswordResponse>(
          '/v2.sys_account.services.AuthService/ResetPassword',
          ($0.ResetPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResetPasswordResponse.fromBuffer(value));
  static final _$refreshAccessToken = $grpc.ClientMethod<
          $0.RefreshAccessTokenRequest, $0.RefreshAccessTokenResponse>(
      '/v2.sys_account.services.AuthService/RefreshAccessToken',
      ($0.RefreshAccessTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RefreshAccessTokenResponse.fromBuffer(value));
  static final _$verifyAccount =
      $grpc.ClientMethod<$0.VerifyAccountRequest, $1.Empty>(
          '/v2.sys_account.services.AuthService/VerifyAccount',
          ($0.VerifyAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

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

  $grpc.ResponseFuture<$1.Empty> verifyAccount($0.VerifyAccountRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$verifyAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.sys_account.services.AuthService';

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
    $addMethod($grpc.ServiceMethod<$0.VerifyAccountRequest, $1.Empty>(
        'VerifyAccount',
        verifyAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifyAccountRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
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

  $async.Future<$1.Empty> verifyAccount_Pre($grpc.ServiceCall call,
      $async.Future<$0.VerifyAccountRequest> request) async {
    return verifyAccount(call, await request);
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
  $async.Future<$1.Empty> verifyAccount(
      $grpc.ServiceCall call, $0.VerifyAccountRequest request);
}
