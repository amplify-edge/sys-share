///
//  Generated code. Do not modify.
//  source: sys_account_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

import 'sys_account_models.pbenum.dart';

export 'sys_account_models.pbenum.dart';

class ErrorReason extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ErrorReason', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  ErrorReason._() : super();
  factory ErrorReason() => create();
  factory ErrorReason.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ErrorReason.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ErrorReason clone() => ErrorReason()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ErrorReason copyWith(void Function(ErrorReason) updates) => super.copyWith((message) => updates(message as ErrorReason)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ErrorReason create() => ErrorReason._();
  ErrorReason createEmptyInstance() => create();
  static $pb.PbList<ErrorReason> createRepeated() => $pb.PbList<ErrorReason>();
  @$core.pragma('dart2js:noInline')
  static ErrorReason getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ErrorReason>(create);
  static ErrorReason _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reason => $_getSZ(0);
  @$pb.TagNumber(1)
  set reason($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => clearField(1);
}

class RegisterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passwordConfirm')
    ..aOM<UserRoles>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userRole', subBuilder: UserRoles.create)
    ..hasRequiredFields = false
  ;

  RegisterRequest._() : super();
  factory RegisterRequest() => create();
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequest>(create);
  static RegisterRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get passwordConfirm => $_getSZ(2);
  @$pb.TagNumber(3)
  set passwordConfirm($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPasswordConfirm() => $_has(2);
  @$pb.TagNumber(3)
  void clearPasswordConfirm() => clearField(3);

  @$pb.TagNumber(4)
  UserRoles get userRole => $_getN(3);
  @$pb.TagNumber(4)
  set userRole(UserRoles v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserRole() => clearField(4);
  @$pb.TagNumber(4)
  UserRoles ensureUserRole() => $_ensure(3);
}

class LoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginRequest._() : super();
  factory LoginRequest() => create();
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken')
    ..aOM<ErrorReason>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorReason', subBuilder: ErrorReason.create)
    ..aOM<$2.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastLogin', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  LoginResponse._() : super();
  factory LoginResponse() => create();
  factory LoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginResponse clone() => LoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginResponse copyWith(void Function(LoginResponse) updates) => super.copyWith((message) => updates(message as LoginResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  LoginResponse createEmptyInstance() => create();
  static $pb.PbList<LoginResponse> createRepeated() => $pb.PbList<LoginResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accessToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set accessToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccessToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get refreshToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set refreshToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefreshToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefreshToken() => clearField(3);

  @$pb.TagNumber(4)
  ErrorReason get errorReason => $_getN(3);
  @$pb.TagNumber(4)
  set errorReason(ErrorReason v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasErrorReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorReason() => clearField(4);
  @$pb.TagNumber(4)
  ErrorReason ensureErrorReason() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.Timestamp get lastLogin => $_getN(4);
  @$pb.TagNumber(5)
  set lastLogin($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastLogin() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastLogin() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureLastLogin() => $_ensure(4);
}

class RegisterResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'successMsg')
    ..aOM<ErrorReason>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorReason', subBuilder: ErrorReason.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifyToken')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tempUserId')
    ..hasRequiredFields = false
  ;

  RegisterResponse._() : super();
  factory RegisterResponse() => create();
  factory RegisterResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterResponse clone() => RegisterResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterResponse copyWith(void Function(RegisterResponse) updates) => super.copyWith((message) => updates(message as RegisterResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterResponse create() => RegisterResponse._();
  RegisterResponse createEmptyInstance() => create();
  static $pb.PbList<RegisterResponse> createRepeated() => $pb.PbList<RegisterResponse>();
  @$core.pragma('dart2js:noInline')
  static RegisterResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterResponse>(create);
  static RegisterResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get successMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set successMsg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessMsg() => clearField(2);

  @$pb.TagNumber(3)
  ErrorReason get errorReason => $_getN(2);
  @$pb.TagNumber(3)
  set errorReason(ErrorReason v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorReason() => clearField(3);
  @$pb.TagNumber(3)
  ErrorReason ensureErrorReason() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get verifyToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set verifyToken($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVerifyToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerifyToken() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tempUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set tempUserId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTempUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTempUserId() => clearField(5);
}

class ForgotPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForgotPasswordRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  ForgotPasswordRequest._() : super();
  factory ForgotPasswordRequest() => create();
  factory ForgotPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForgotPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForgotPasswordRequest clone() => ForgotPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForgotPasswordRequest copyWith(void Function(ForgotPasswordRequest) updates) => super.copyWith((message) => updates(message as ForgotPasswordRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordRequest create() => ForgotPasswordRequest._();
  ForgotPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ForgotPasswordRequest> createRepeated() => $pb.PbList<ForgotPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForgotPasswordRequest>(create);
  static ForgotPasswordRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class ForgotPasswordResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForgotPasswordResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'successMsg')
    ..aOM<ErrorReason>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorReason', subBuilder: ErrorReason.create)
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forgotPasswordRequestedAt', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  ForgotPasswordResponse._() : super();
  factory ForgotPasswordResponse() => create();
  factory ForgotPasswordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForgotPasswordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForgotPasswordResponse clone() => ForgotPasswordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForgotPasswordResponse copyWith(void Function(ForgotPasswordResponse) updates) => super.copyWith((message) => updates(message as ForgotPasswordResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordResponse create() => ForgotPasswordResponse._();
  ForgotPasswordResponse createEmptyInstance() => create();
  static $pb.PbList<ForgotPasswordResponse> createRepeated() => $pb.PbList<ForgotPasswordResponse>();
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForgotPasswordResponse>(create);
  static ForgotPasswordResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get successMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set successMsg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessMsg() => clearField(2);

  @$pb.TagNumber(3)
  ErrorReason get errorReason => $_getN(2);
  @$pb.TagNumber(3)
  set errorReason(ErrorReason v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorReason() => clearField(3);
  @$pb.TagNumber(3)
  ErrorReason ensureErrorReason() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get forgotPasswordRequestedAt => $_getN(3);
  @$pb.TagNumber(4)
  set forgotPasswordRequestedAt($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasForgotPasswordRequestedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearForgotPasswordRequestedAt() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureForgotPasswordRequestedAt() => $_ensure(3);
}

class ResetPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResetPasswordRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passwordConfirm')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifyToken')
    ..hasRequiredFields = false
  ;

  ResetPasswordRequest._() : super();
  factory ResetPasswordRequest() => create();
  factory ResetPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest clone() => ResetPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest copyWith(void Function(ResetPasswordRequest) updates) => super.copyWith((message) => updates(message as ResetPasswordRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest create() => ResetPasswordRequest._();
  ResetPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordRequest> createRepeated() => $pb.PbList<ResetPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordRequest>(create);
  static ResetPasswordRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get passwordConfirm => $_getSZ(2);
  @$pb.TagNumber(3)
  set passwordConfirm($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPasswordConfirm() => $_has(2);
  @$pb.TagNumber(3)
  void clearPasswordConfirm() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get verifyToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set verifyToken($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVerifyToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerifyToken() => clearField(4);
}

class ResetPasswordResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResetPasswordResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'successMsg')
    ..aOM<ErrorReason>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorReason', subBuilder: ErrorReason.create)
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resetPasswordRequestedAt', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  ResetPasswordResponse._() : super();
  factory ResetPasswordResponse() => create();
  factory ResetPasswordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordResponse clone() => ResetPasswordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordResponse copyWith(void Function(ResetPasswordResponse) updates) => super.copyWith((message) => updates(message as ResetPasswordResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordResponse create() => ResetPasswordResponse._();
  ResetPasswordResponse createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordResponse> createRepeated() => $pb.PbList<ResetPasswordResponse>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordResponse>(create);
  static ResetPasswordResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get successMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set successMsg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessMsg() => clearField(2);

  @$pb.TagNumber(3)
  ErrorReason get errorReason => $_getN(2);
  @$pb.TagNumber(3)
  set errorReason(ErrorReason v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorReason() => clearField(3);
  @$pb.TagNumber(3)
  ErrorReason ensureErrorReason() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get resetPasswordRequestedAt => $_getN(3);
  @$pb.TagNumber(4)
  set resetPasswordRequestedAt($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasResetPasswordRequestedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearResetPasswordRequestedAt() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureResetPasswordRequestedAt() => $_ensure(3);
}

class RefreshAccessTokenRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshAccessTokenRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken')
    ..hasRequiredFields = false
  ;

  RefreshAccessTokenRequest._() : super();
  factory RefreshAccessTokenRequest() => create();
  factory RefreshAccessTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshAccessTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshAccessTokenRequest clone() => RefreshAccessTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshAccessTokenRequest copyWith(void Function(RefreshAccessTokenRequest) updates) => super.copyWith((message) => updates(message as RefreshAccessTokenRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshAccessTokenRequest create() => RefreshAccessTokenRequest._();
  RefreshAccessTokenRequest createEmptyInstance() => create();
  static $pb.PbList<RefreshAccessTokenRequest> createRepeated() => $pb.PbList<RefreshAccessTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static RefreshAccessTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshAccessTokenRequest>(create);
  static RefreshAccessTokenRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);
}

class RefreshAccessTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshAccessTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken')
    ..aOM<ErrorReason>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorReason', subBuilder: ErrorReason.create)
    ..hasRequiredFields = false
  ;

  RefreshAccessTokenResponse._() : super();
  factory RefreshAccessTokenResponse() => create();
  factory RefreshAccessTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshAccessTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshAccessTokenResponse clone() => RefreshAccessTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshAccessTokenResponse copyWith(void Function(RefreshAccessTokenResponse) updates) => super.copyWith((message) => updates(message as RefreshAccessTokenResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshAccessTokenResponse create() => RefreshAccessTokenResponse._();
  RefreshAccessTokenResponse createEmptyInstance() => create();
  static $pb.PbList<RefreshAccessTokenResponse> createRepeated() => $pb.PbList<RefreshAccessTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static RefreshAccessTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshAccessTokenResponse>(create);
  static RefreshAccessTokenResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  ErrorReason get errorReason => $_getN(1);
  @$pb.TagNumber(2)
  set errorReason(ErrorReason v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorReason() => clearField(2);
  @$pb.TagNumber(2)
  ErrorReason ensureErrorReason() => $_ensure(1);
}

class UserDefinedFields extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserDefinedFields', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fields', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  UserDefinedFields._() : super();
  factory UserDefinedFields() => create();
  factory UserDefinedFields.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserDefinedFields.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserDefinedFields clone() => UserDefinedFields()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserDefinedFields copyWith(void Function(UserDefinedFields) updates) => super.copyWith((message) => updates(message as UserDefinedFields)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserDefinedFields create() => UserDefinedFields._();
  UserDefinedFields createEmptyInstance() => create();
  static $pb.PbList<UserDefinedFields> createRepeated() => $pb.PbList<UserDefinedFields>();
  @$core.pragma('dart2js:noInline')
  static UserDefinedFields getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserDefinedFields>(create);
  static UserDefinedFields _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get fields => $_getN(0);
  @$pb.TagNumber(1)
  set fields($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFields() => $_has(0);
  @$pb.TagNumber(1)
  void clearFields() => clearField(1);
}

class VerifyAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyAccountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifyToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..hasRequiredFields = false
  ;

  VerifyAccountRequest._() : super();
  factory VerifyAccountRequest() => create();
  factory VerifyAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyAccountRequest clone() => VerifyAccountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyAccountRequest copyWith(void Function(VerifyAccountRequest) updates) => super.copyWith((message) => updates(message as VerifyAccountRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyAccountRequest create() => VerifyAccountRequest._();
  VerifyAccountRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyAccountRequest> createRepeated() => $pb.PbList<VerifyAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyAccountRequest>(create);
  static VerifyAccountRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get verifyToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set verifyToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerifyToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerifyToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountId => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountId() => clearField(2);
}

class Project extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Project', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoResourceId')
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creatorId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgId')
    ..aOM<Org>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'org', subBuilder: Org.create)
    ..a<$core.List<$core.int>>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logo', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Project._() : super();
  factory Project() => create();
  factory Project.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Project.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Project clone() => Project()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Project copyWith(void Function(Project) updates) => super.copyWith((message) => updates(message as Project)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Project create() => Project._();
  Project createEmptyInstance() => create();
  static $pb.PbList<Project> createRepeated() => $pb.PbList<Project>();
  @$core.pragma('dart2js:noInline')
  static Project getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Project>(create);
  static Project _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get logoResourceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set logoResourceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogoResourceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogoResourceId() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get creatorId => $_getSZ(4);
  @$pb.TagNumber(5)
  set creatorId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatorId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatorId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get orgId => $_getSZ(5);
  @$pb.TagNumber(6)
  set orgId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrgId() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrgId() => clearField(6);

  @$pb.TagNumber(7)
  Org get org => $_getN(6);
  @$pb.TagNumber(7)
  set org(Org v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrg() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrg() => clearField(7);
  @$pb.TagNumber(7)
  Org ensureOrg() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get logo => $_getN(7);
  @$pb.TagNumber(8)
  set logo($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLogo() => $_has(7);
  @$pb.TagNumber(8)
  void clearLogo() => clearField(8);
}

class ProjectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProjectRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoFilepath')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creatorId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgName')
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoUploadBytes', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ProjectRequest._() : super();
  factory ProjectRequest() => create();
  factory ProjectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectRequest clone() => ProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectRequest copyWith(void Function(ProjectRequest) updates) => super.copyWith((message) => updates(message as ProjectRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProjectRequest create() => ProjectRequest._();
  ProjectRequest createEmptyInstance() => create();
  static $pb.PbList<ProjectRequest> createRepeated() => $pb.PbList<ProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static ProjectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectRequest>(create);
  static ProjectRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get logoFilepath => $_getSZ(1);
  @$pb.TagNumber(2)
  set logoFilepath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoFilepath() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoFilepath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get creatorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set creatorId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatorId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get orgId => $_getSZ(3);
  @$pb.TagNumber(4)
  set orgId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrgId() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrgId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get orgName => $_getSZ(4);
  @$pb.TagNumber(5)
  set orgName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrgName() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrgName() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get logoUploadBytes => $_getN(5);
  @$pb.TagNumber(6)
  set logoUploadBytes($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLogoUploadBytes() => $_has(5);
  @$pb.TagNumber(6)
  void clearLogoUploadBytes() => clearField(6);
}

class ProjectUpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProjectUpdateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoFilepath')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoUploadBytes', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ProjectUpdateRequest._() : super();
  factory ProjectUpdateRequest() => create();
  factory ProjectUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectUpdateRequest clone() => ProjectUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectUpdateRequest copyWith(void Function(ProjectUpdateRequest) updates) => super.copyWith((message) => updates(message as ProjectUpdateRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProjectUpdateRequest create() => ProjectUpdateRequest._();
  ProjectUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<ProjectUpdateRequest> createRepeated() => $pb.PbList<ProjectUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static ProjectUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectUpdateRequest>(create);
  static ProjectUpdateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get logoFilepath => $_getSZ(2);
  @$pb.TagNumber(3)
  set logoFilepath($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogoFilepath() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogoFilepath() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get logoUploadBytes => $_getN(3);
  @$pb.TagNumber(4)
  set logoUploadBytes($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLogoUploadBytes() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogoUploadBytes() => clearField(4);
}

class Org extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Org', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoResourceId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact')
    ..aOM<$2.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creatorId')
    ..pc<Project>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projects', $pb.PbFieldType.PM, subBuilder: Project.create)
    ..a<$core.List<$core.int>>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logo', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Org._() : super();
  factory Org() => create();
  factory Org.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Org.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Org clone() => Org()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Org copyWith(void Function(Org) updates) => super.copyWith((message) => updates(message as Org)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Org create() => Org._();
  Org createEmptyInstance() => create();
  static $pb.PbList<Org> createRepeated() => $pb.PbList<Org>();
  @$core.pragma('dart2js:noInline')
  static Org getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Org>(create);
  static Org _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get logoResourceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set logoResourceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogoResourceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogoResourceId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get contact => $_getSZ(3);
  @$pb.TagNumber(4)
  set contact($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContact() => $_has(3);
  @$pb.TagNumber(4)
  void clearContact() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get creatorId => $_getSZ(5);
  @$pb.TagNumber(6)
  set creatorId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatorId() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatorId() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<Project> get projects => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get logo => $_getN(7);
  @$pb.TagNumber(8)
  set logo($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLogo() => $_has(7);
  @$pb.TagNumber(8)
  void clearLogo() => clearField(8);
}

class OrgRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OrgRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoFilepath')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creatorId')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoUploadBytes', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  OrgRequest._() : super();
  factory OrgRequest() => create();
  factory OrgRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrgRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrgRequest clone() => OrgRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrgRequest copyWith(void Function(OrgRequest) updates) => super.copyWith((message) => updates(message as OrgRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrgRequest create() => OrgRequest._();
  OrgRequest createEmptyInstance() => create();
  static $pb.PbList<OrgRequest> createRepeated() => $pb.PbList<OrgRequest>();
  @$core.pragma('dart2js:noInline')
  static OrgRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrgRequest>(create);
  static OrgRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get logoFilepath => $_getSZ(1);
  @$pb.TagNumber(2)
  set logoFilepath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoFilepath() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoFilepath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get contact => $_getSZ(2);
  @$pb.TagNumber(3)
  set contact($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContact() => $_has(2);
  @$pb.TagNumber(3)
  void clearContact() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get creatorId => $_getSZ(3);
  @$pb.TagNumber(4)
  set creatorId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatorId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatorId() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get logoUploadBytes => $_getN(4);
  @$pb.TagNumber(5)
  set logoUploadBytes($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLogoUploadBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearLogoUploadBytes() => clearField(5);
}

class OrgUpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OrgUpdateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoFilepath')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logoUploadBytes', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  OrgUpdateRequest._() : super();
  factory OrgUpdateRequest() => create();
  factory OrgUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrgUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrgUpdateRequest clone() => OrgUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrgUpdateRequest copyWith(void Function(OrgUpdateRequest) updates) => super.copyWith((message) => updates(message as OrgUpdateRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrgUpdateRequest create() => OrgUpdateRequest._();
  OrgUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<OrgUpdateRequest> createRepeated() => $pb.PbList<OrgUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static OrgUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrgUpdateRequest>(create);
  static OrgUpdateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get contact => $_getSZ(2);
  @$pb.TagNumber(3)
  set contact($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContact() => $_has(2);
  @$pb.TagNumber(3)
  void clearContact() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get logoFilepath => $_getSZ(3);
  @$pb.TagNumber(4)
  set logoFilepath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLogoFilepath() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogoFilepath() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get logoUploadBytes => $_getN(4);
  @$pb.TagNumber(5)
  set logoUploadBytes($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLogoUploadBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearLogoUploadBytes() => clearField(5);
}

class IdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IdRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  IdRequest._() : super();
  factory IdRequest() => create();
  factory IdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IdRequest clone() => IdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IdRequest copyWith(void Function(IdRequest) updates) => super.copyWith((message) => updates(message as IdRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdRequest create() => IdRequest._();
  IdRequest createEmptyInstance() => create();
  static $pb.PbList<IdRequest> createRepeated() => $pb.PbList<IdRequest>();
  @$core.pragma('dart2js:noInline')
  static IdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IdRequest>(create);
  static IdRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class ListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'perPageEntries')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderBy')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentPageId')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDescending')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', $pb.PbFieldType.OY)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matcher')
    ..hasRequiredFields = false
  ;

  ListRequest._() : super();
  factory ListRequest() => create();
  factory ListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRequest clone() => ListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRequest copyWith(void Function(ListRequest) updates) => super.copyWith((message) => updates(message as ListRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListRequest create() => ListRequest._();
  ListRequest createEmptyInstance() => create();
  static $pb.PbList<ListRequest> createRepeated() => $pb.PbList<ListRequest>();
  @$core.pragma('dart2js:noInline')
  static ListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRequest>(create);
  static ListRequest _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get perPageEntries => $_getI64(0);
  @$pb.TagNumber(1)
  set perPageEntries($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPerPageEntries() => $_has(0);
  @$pb.TagNumber(1)
  void clearPerPageEntries() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderBy => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderBy($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrderBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderBy() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get currentPageId => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentPageId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentPageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPageId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isDescending => $_getBF(3);
  @$pb.TagNumber(4)
  set isDescending($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsDescending() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsDescending() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get filters => $_getN(4);
  @$pb.TagNumber(5)
  set filters($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFilters() => $_has(4);
  @$pb.TagNumber(5)
  void clearFilters() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get accountId => $_getSZ(5);
  @$pb.TagNumber(6)
  set accountId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAccountId() => $_has(5);
  @$pb.TagNumber(6)
  void clearAccountId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get matcher => $_getSZ(6);
  @$pb.TagNumber(7)
  set matcher($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMatcher() => $_has(6);
  @$pb.TagNumber(7)
  void clearMatcher() => clearField(7);
}

class ListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..pc<Project>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projects', $pb.PbFieldType.PM, subBuilder: Project.create)
    ..pc<Org>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgs', $pb.PbFieldType.PM, subBuilder: Org.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPageId')
    ..hasRequiredFields = false
  ;

  ListResponse._() : super();
  factory ListResponse() => create();
  factory ListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListResponse clone() => ListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListResponse copyWith(void Function(ListResponse) updates) => super.copyWith((message) => updates(message as ListResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListResponse create() => ListResponse._();
  ListResponse createEmptyInstance() => create();
  static $pb.PbList<ListResponse> createRepeated() => $pb.PbList<ListResponse>();
  @$core.pragma('dart2js:noInline')
  static ListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListResponse>(create);
  static ListResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Project> get projects => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Org> get orgs => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get nextPageId => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextPageId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextPageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextPageId() => clearField(3);
}

class UserRoles extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserRoles', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..e<Roles>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Roles.INVALID, valueOf: Roles.valueOf, enumValues: Roles.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgId')
    ..hasRequiredFields = false
  ;

  UserRoles._() : super();
  factory UserRoles() => create();
  factory UserRoles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRoles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRoles clone() => UserRoles()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRoles copyWith(void Function(UserRoles) updates) => super.copyWith((message) => updates(message as UserRoles)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRoles create() => UserRoles._();
  UserRoles createEmptyInstance() => create();
  static $pb.PbList<UserRoles> createRepeated() => $pb.PbList<UserRoles>();
  @$core.pragma('dart2js:noInline')
  static UserRoles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRoles>(create);
  static UserRoles _defaultInstance;

  @$pb.TagNumber(1)
  Roles get role => $_getN(0);
  @$pb.TagNumber(1)
  set role(Roles v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get projectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set projectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get orgId => $_getSZ(2);
  @$pb.TagNumber(3)
  set orgId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrgId() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrgId() => clearField(3);
}

class NewUserRoles extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewUserRoles', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..e<Roles>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Roles.INVALID, valueOf: Roles.valueOf, enumValues: Roles.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectName')
    ..hasRequiredFields = false
  ;

  NewUserRoles._() : super();
  factory NewUserRoles() => create();
  factory NewUserRoles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewUserRoles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewUserRoles clone() => NewUserRoles()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewUserRoles copyWith(void Function(NewUserRoles) updates) => super.copyWith((message) => updates(message as NewUserRoles)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewUserRoles create() => NewUserRoles._();
  NewUserRoles createEmptyInstance() => create();
  static $pb.PbList<NewUserRoles> createRepeated() => $pb.PbList<NewUserRoles>();
  @$core.pragma('dart2js:noInline')
  static NewUserRoles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewUserRoles>(create);
  static NewUserRoles _defaultInstance;

  @$pb.TagNumber(1)
  Roles get role => $_getN(0);
  @$pb.TagNumber(1)
  set role(Roles v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get projectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set projectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get orgId => $_getSZ(2);
  @$pb.TagNumber(3)
  set orgId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrgId() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrgId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get projectName => $_getSZ(3);
  @$pb.TagNumber(4)
  set projectName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProjectName() => $_has(3);
  @$pb.TagNumber(4)
  void clearProjectName() => clearField(4);
}

class Permission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Permission', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resource')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resourceKind')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activities')
    ..hasRequiredFields = false
  ;

  Permission._() : super();
  factory Permission() => create();
  factory Permission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Permission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Permission clone() => Permission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Permission copyWith(void Function(Permission) updates) => super.copyWith((message) => updates(message as Permission)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Permission create() => Permission._();
  Permission createEmptyInstance() => create();
  static $pb.PbList<Permission> createRepeated() => $pb.PbList<Permission>();
  @$core.pragma('dart2js:noInline')
  static Permission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Permission>(create);
  static Permission _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get resource => $_getSZ(0);
  @$pb.TagNumber(1)
  set resource($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResource() => $_has(0);
  @$pb.TagNumber(1)
  void clearResource() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resourceKind => $_getSZ(1);
  @$pb.TagNumber(2)
  set resourceKind($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResourceKind() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceKind() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get activities => $_getList(2);
}

class Account extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Account', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..pc<UserRoles>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: UserRoles.create)
    ..aOM<$2.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastLogin', subBuilder: $2.Timestamp.create)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'disabled')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verified')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarResourceId')
    ..a<$core.List<$core.int>>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Account._() : super();
  factory Account() => create();
  factory Account.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Account clone() => Account()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Account copyWith(void Function(Account) updates) => super.copyWith((message) => updates(message as Account)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Account create() => Account._();
  Account createEmptyInstance() => create();
  static $pb.PbList<Account> createRepeated() => $pb.PbList<Account>();
  @$core.pragma('dart2js:noInline')
  static Account getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account>(create);
  static Account _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UserRoles> get roles => $_getList(3);

  @$pb.TagNumber(5)
  $2.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.Timestamp get updatedAt => $_getN(5);
  @$pb.TagNumber(6)
  set updatedAt($2.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureUpdatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $2.Timestamp get lastLogin => $_getN(6);
  @$pb.TagNumber(7)
  set lastLogin($2.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastLogin() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastLogin() => clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureLastLogin() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get disabled => $_getBF(7);
  @$pb.TagNumber(8)
  set disabled($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDisabled() => $_has(7);
  @$pb.TagNumber(8)
  void clearDisabled() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get verified => $_getBF(8);
  @$pb.TagNumber(9)
  set verified($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasVerified() => $_has(8);
  @$pb.TagNumber(9)
  void clearVerified() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get avatarResourceId => $_getSZ(9);
  @$pb.TagNumber(10)
  set avatarResourceId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAvatarResourceId() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvatarResourceId() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.int> get avatar => $_getN(10);
  @$pb.TagNumber(11)
  set avatar($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAvatar() => $_has(10);
  @$pb.TagNumber(11)
  void clearAvatar() => clearField(11);
}

class AccountNewRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AccountNewRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..pc<UserRoles>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: UserRoles.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarFilepath')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUploadBytes', $pb.PbFieldType.OY)
    ..pc<NewUserRoles>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newUserRoles', $pb.PbFieldType.PM, subBuilder: NewUserRoles.create)
    ..hasRequiredFields = false
  ;

  AccountNewRequest._() : super();
  factory AccountNewRequest() => create();
  factory AccountNewRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountNewRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountNewRequest clone() => AccountNewRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountNewRequest copyWith(void Function(AccountNewRequest) updates) => super.copyWith((message) => updates(message as AccountNewRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountNewRequest create() => AccountNewRequest._();
  AccountNewRequest createEmptyInstance() => create();
  static $pb.PbList<AccountNewRequest> createRepeated() => $pb.PbList<AccountNewRequest>();
  @$core.pragma('dart2js:noInline')
  static AccountNewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountNewRequest>(create);
  static AccountNewRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<UserRoles> get roles => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get avatarFilepath => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatarFilepath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatarFilepath() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatarFilepath() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get avatarUploadBytes => $_getN(4);
  @$pb.TagNumber(5)
  set avatarUploadBytes($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvatarUploadBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatarUploadBytes() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<NewUserRoles> get newUserRoles => $_getList(5);
}

class AccountUpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AccountUpdateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'disabled')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verified')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarFilepath')
    ..a<$core.List<$core.int>>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUploadBytes', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AccountUpdateRequest._() : super();
  factory AccountUpdateRequest() => create();
  factory AccountUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountUpdateRequest clone() => AccountUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountUpdateRequest copyWith(void Function(AccountUpdateRequest) updates) => super.copyWith((message) => updates(message as AccountUpdateRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountUpdateRequest create() => AccountUpdateRequest._();
  AccountUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<AccountUpdateRequest> createRepeated() => $pb.PbList<AccountUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static AccountUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountUpdateRequest>(create);
  static AccountUpdateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get disabled => $_getBF(3);
  @$pb.TagNumber(4)
  set disabled($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisabled() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get verified => $_getBF(4);
  @$pb.TagNumber(5)
  set verified($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVerified() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerified() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatarFilepath => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatarFilepath($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatarFilepath() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatarFilepath() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get avatarUploadBytes => $_getN(6);
  @$pb.TagNumber(7)
  set avatarUploadBytes($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAvatarUploadBytes() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvatarUploadBytes() => clearField(7);
}

class GetAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAccountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetAccountRequest._() : super();
  factory GetAccountRequest() => create();
  factory GetAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccountRequest clone() => GetAccountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccountRequest copyWith(void Function(GetAccountRequest) updates) => super.copyWith((message) => updates(message as GetAccountRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountRequest create() => GetAccountRequest._();
  GetAccountRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountRequest> createRepeated() => $pb.PbList<GetAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountRequest>(create);
  static GetAccountRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ListAccountsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListAccountsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'perPageEntries')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderBy')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentPageId')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDescending')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', $pb.PbFieldType.OY)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matcher')
    ..hasRequiredFields = false
  ;

  ListAccountsRequest._() : super();
  factory ListAccountsRequest() => create();
  factory ListAccountsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAccountsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAccountsRequest clone() => ListAccountsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAccountsRequest copyWith(void Function(ListAccountsRequest) updates) => super.copyWith((message) => updates(message as ListAccountsRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListAccountsRequest create() => ListAccountsRequest._();
  ListAccountsRequest createEmptyInstance() => create();
  static $pb.PbList<ListAccountsRequest> createRepeated() => $pb.PbList<ListAccountsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAccountsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAccountsRequest>(create);
  static ListAccountsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get perPageEntries => $_getI64(0);
  @$pb.TagNumber(1)
  set perPageEntries($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPerPageEntries() => $_has(0);
  @$pb.TagNumber(1)
  void clearPerPageEntries() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderBy => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderBy($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrderBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderBy() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get currentPageId => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentPageId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentPageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPageId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isDescending => $_getBF(3);
  @$pb.TagNumber(4)
  set isDescending($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsDescending() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsDescending() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get filters => $_getN(4);
  @$pb.TagNumber(5)
  set filters($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFilters() => $_has(4);
  @$pb.TagNumber(5)
  void clearFilters() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get matcher => $_getSZ(5);
  @$pb.TagNumber(6)
  set matcher($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMatcher() => $_has(5);
  @$pb.TagNumber(6)
  void clearMatcher() => clearField(6);
}

class ListAccountsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListAccountsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..pc<Account>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accounts', $pb.PbFieldType.PM, subBuilder: Account.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPageId')
    ..hasRequiredFields = false
  ;

  ListAccountsResponse._() : super();
  factory ListAccountsResponse() => create();
  factory ListAccountsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAccountsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAccountsResponse clone() => ListAccountsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAccountsResponse copyWith(void Function(ListAccountsResponse) updates) => super.copyWith((message) => updates(message as ListAccountsResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListAccountsResponse create() => ListAccountsResponse._();
  ListAccountsResponse createEmptyInstance() => create();
  static $pb.PbList<ListAccountsResponse> createRepeated() => $pb.PbList<ListAccountsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAccountsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAccountsResponse>(create);
  static ListAccountsResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Account> get accounts => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageId() => clearField(2);
}

class SearchAccountsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchAccountsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query', $pb.PbFieldType.OY)
    ..aOM<ListAccountsRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'searchParams', subBuilder: ListAccountsRequest.create)
    ..hasRequiredFields = false
  ;

  SearchAccountsRequest._() : super();
  factory SearchAccountsRequest() => create();
  factory SearchAccountsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchAccountsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchAccountsRequest clone() => SearchAccountsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchAccountsRequest copyWith(void Function(SearchAccountsRequest) updates) => super.copyWith((message) => updates(message as SearchAccountsRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchAccountsRequest create() => SearchAccountsRequest._();
  SearchAccountsRequest createEmptyInstance() => create();
  static $pb.PbList<SearchAccountsRequest> createRepeated() => $pb.PbList<SearchAccountsRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchAccountsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchAccountsRequest>(create);
  static SearchAccountsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get query => $_getN(0);
  @$pb.TagNumber(1)
  set query($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);

  @$pb.TagNumber(2)
  ListAccountsRequest get searchParams => $_getN(1);
  @$pb.TagNumber(2)
  set searchParams(ListAccountsRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSearchParams() => $_has(1);
  @$pb.TagNumber(2)
  void clearSearchParams() => clearField(2);
  @$pb.TagNumber(2)
  ListAccountsRequest ensureSearchParams() => $_ensure(1);
}

class SearchAccountsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchAccountsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOM<ListAccountsResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'searchResponse', subBuilder: ListAccountsResponse.create)
    ..hasRequiredFields = false
  ;

  SearchAccountsResponse._() : super();
  factory SearchAccountsResponse() => create();
  factory SearchAccountsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchAccountsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchAccountsResponse clone() => SearchAccountsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchAccountsResponse copyWith(void Function(SearchAccountsResponse) updates) => super.copyWith((message) => updates(message as SearchAccountsResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchAccountsResponse create() => SearchAccountsResponse._();
  SearchAccountsResponse createEmptyInstance() => create();
  static $pb.PbList<SearchAccountsResponse> createRepeated() => $pb.PbList<SearchAccountsResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchAccountsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchAccountsResponse>(create);
  static SearchAccountsResponse _defaultInstance;

  @$pb.TagNumber(1)
  ListAccountsResponse get searchResponse => $_getN(0);
  @$pb.TagNumber(1)
  set searchResponse(ListAccountsResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSearchResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearSearchResponse() => clearField(1);
  @$pb.TagNumber(1)
  ListAccountsResponse ensureSearchResponse() => $_ensure(0);
}

class AssignAccountToRoleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AssignAccountToRoleRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'assigneeAccountId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'assignedAccountId')
    ..aOM<UserRoles>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', subBuilder: UserRoles.create)
    ..hasRequiredFields = false
  ;

  AssignAccountToRoleRequest._() : super();
  factory AssignAccountToRoleRequest() => create();
  factory AssignAccountToRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignAccountToRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssignAccountToRoleRequest clone() => AssignAccountToRoleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssignAccountToRoleRequest copyWith(void Function(AssignAccountToRoleRequest) updates) => super.copyWith((message) => updates(message as AssignAccountToRoleRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AssignAccountToRoleRequest create() => AssignAccountToRoleRequest._();
  AssignAccountToRoleRequest createEmptyInstance() => create();
  static $pb.PbList<AssignAccountToRoleRequest> createRepeated() => $pb.PbList<AssignAccountToRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static AssignAccountToRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssignAccountToRoleRequest>(create);
  static AssignAccountToRoleRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get assigneeAccountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set assigneeAccountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssigneeAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssigneeAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assignedAccountId => $_getSZ(1);
  @$pb.TagNumber(2)
  set assignedAccountId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssignedAccountId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssignedAccountId() => clearField(2);

  @$pb.TagNumber(3)
  UserRoles get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(UserRoles v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);
  @$pb.TagNumber(3)
  UserRoles ensureRole() => $_ensure(2);
}

class DisableAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DisableAccountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.sys_account.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..hasRequiredFields = false
  ;

  DisableAccountRequest._() : super();
  factory DisableAccountRequest() => create();
  factory DisableAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisableAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DisableAccountRequest clone() => DisableAccountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DisableAccountRequest copyWith(void Function(DisableAccountRequest) updates) => super.copyWith((message) => updates(message as DisableAccountRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DisableAccountRequest create() => DisableAccountRequest._();
  DisableAccountRequest createEmptyInstance() => create();
  static $pb.PbList<DisableAccountRequest> createRepeated() => $pb.PbList<DisableAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static DisableAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisableAccountRequest>(create);
  static DisableAccountRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

