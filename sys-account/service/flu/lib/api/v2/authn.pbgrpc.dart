///
//  Generated code. Do not modify.
//  source: authn.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'authn.pb.dart' as $0;
export 'authn.pb.dart';

class AuthServiceClient extends $grpc.Client {
  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
          '/getcouragenow.sys.v2.sys_account.AuthService/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegisterResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/getcouragenow.sys.v2.sys_account.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$forgotPassword =
      $grpc.ClientMethod<$0.ForgotPasswordRequest, $0.ForgotPasswordResponse>(
          '/getcouragenow.sys.v2.sys_account.AuthService/ForgotPassword',
          ($0.ForgotPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ForgotPasswordResponse.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$0.ResetPasswordRequest, $0.ResetPasswordResponse>(
          '/getcouragenow.sys.v2.sys_account.AuthService/ResetPassword',
          ($0.ResetPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResetPasswordResponse.fromBuffer(value));
  static final _$refreshAccessToken = $grpc.ClientMethod<
          $0.RefreshAccessTokenRequest, $0.RefreshAccessTokenResponse>(
      '/getcouragenow.sys.v2.sys_account.AuthService/RefreshAccessToken',
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
  $core.String get $name => 'getcouragenow.sys.v2.sys_account.AuthService';

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
