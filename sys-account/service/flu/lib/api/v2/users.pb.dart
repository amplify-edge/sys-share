///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pb.dart' as $3;
import 'google/protobuf/timestamp.pb.dart' as $2;

import 'users.pbenum.dart';

export 'users.pbenum.dart';

class UserDefinedFields extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserDefinedFields', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..m<$core.String, $3.Value>(1, 'fields', entryClassName: 'UserDefinedFields.FieldsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $3.Value.create, packageName: const $pb.PackageName('getcouragenow.sys.v2.sys_account'))
    ..hasRequiredFields = false
  ;

  UserDefinedFields._() : super();
  factory UserDefinedFields() => create();
  factory UserDefinedFields.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserDefinedFields.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserDefinedFields clone() => UserDefinedFields()..mergeFromMessage(this);
  UserDefinedFields copyWith(void Function(UserDefinedFields) updates) => super.copyWith((message) => updates(message as UserDefinedFields));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserDefinedFields create() => UserDefinedFields._();
  UserDefinedFields createEmptyInstance() => create();
  static $pb.PbList<UserDefinedFields> createRepeated() => $pb.PbList<UserDefinedFields>();
  @$core.pragma('dart2js:noInline')
  static UserDefinedFields getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserDefinedFields>(create);
  static UserDefinedFields _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $3.Value> get fields => $_getMap(0);
}

class Project extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Project', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  Project._() : super();
  factory Project() => create();
  factory Project.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Project.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Project clone() => Project()..mergeFromMessage(this);
  Project copyWith(void Function(Project) updates) => super.copyWith((message) => updates(message as Project));
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
}

class Org extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Org', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  Org._() : super();
  factory Org() => create();
  factory Org.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Org.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Org clone() => Org()..mergeFromMessage(this);
  Org copyWith(void Function(Org) updates) => super.copyWith((message) => updates(message as Org));
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
}

enum UserRoles_Resource {
  project, 
  org, 
  notSet
}

class UserRoles extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UserRoles_Resource> _UserRoles_ResourceByTag = {
    2 : UserRoles_Resource.project,
    3 : UserRoles_Resource.org,
    0 : UserRoles_Resource.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserRoles', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<Roles>(1, 'role', $pb.PbFieldType.OE, defaultOrMaker: Roles.INVALID, valueOf: Roles.valueOf, enumValues: Roles.values)
    ..aOM<Project>(2, 'project', subBuilder: Project.create)
    ..aOM<Org>(3, 'org', subBuilder: Org.create)
    ..hasRequiredFields = false
  ;

  UserRoles._() : super();
  factory UserRoles() => create();
  factory UserRoles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRoles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserRoles clone() => UserRoles()..mergeFromMessage(this);
  UserRoles copyWith(void Function(UserRoles) updates) => super.copyWith((message) => updates(message as UserRoles));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRoles create() => UserRoles._();
  UserRoles createEmptyInstance() => create();
  static $pb.PbList<UserRoles> createRepeated() => $pb.PbList<UserRoles>();
  @$core.pragma('dart2js:noInline')
  static UserRoles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRoles>(create);
  static UserRoles _defaultInstance;

  UserRoles_Resource whichResource() => _UserRoles_ResourceByTag[$_whichOneof(0)];
  void clearResource() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Roles get role => $_getN(0);
  @$pb.TagNumber(1)
  set role(Roles v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => clearField(1);

  @$pb.TagNumber(2)
  Project get project => $_getN(1);
  @$pb.TagNumber(2)
  set project(Project v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProject() => $_has(1);
  @$pb.TagNumber(2)
  void clearProject() => clearField(2);
  @$pb.TagNumber(2)
  Project ensureProject() => $_ensure(1);

  @$pb.TagNumber(3)
  Org get org => $_getN(2);
  @$pb.TagNumber(3)
  set org(Org v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrg() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrg() => clearField(3);
  @$pb.TagNumber(3)
  Org ensureOrg() => $_ensure(2);
}

class Account extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Account', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'email')
    ..aOS(3, 'password')
    ..aOM<UserRoles>(4, 'role', subBuilder: UserRoles.create)
    ..aOM<$2.Timestamp>(5, 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(6, 'updatedAt', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(7, 'lastLogin', subBuilder: $2.Timestamp.create)
    ..aOB(8, 'disabled')
    ..aOM<UserDefinedFields>(9, 'fields', subBuilder: UserDefinedFields.create)
    ..hasRequiredFields = false
  ;

  Account._() : super();
  factory Account() => create();
  factory Account.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Account clone() => Account()..mergeFromMessage(this);
  Account copyWith(void Function(Account) updates) => super.copyWith((message) => updates(message as Account));
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
  UserRoles get role => $_getN(3);
  @$pb.TagNumber(4)
  set role(UserRoles v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => clearField(4);
  @$pb.TagNumber(4)
  UserRoles ensureRole() => $_ensure(3);

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
  UserDefinedFields get fields => $_getN(8);
  @$pb.TagNumber(9)
  set fields(UserDefinedFields v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasFields() => $_has(8);
  @$pb.TagNumber(9)
  void clearFields() => clearField(9);
  @$pb.TagNumber(9)
  UserDefinedFields ensureFields() => $_ensure(8);
}

class GetAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountRequest', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  GetAccountRequest._() : super();
  factory GetAccountRequest() => create();
  factory GetAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetAccountRequest clone() => GetAccountRequest()..mergeFromMessage(this);
  GetAccountRequest copyWith(void Function(GetAccountRequest) updates) => super.copyWith((message) => updates(message as GetAccountRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListAccountsRequest', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aInt64(1, 'perPageEntries')
    ..aOS(2, 'orderBy')
    ..aOS(3, 'currentPageToken')
    ..hasRequiredFields = false
  ;

  ListAccountsRequest._() : super();
  factory ListAccountsRequest() => create();
  factory ListAccountsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAccountsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListAccountsRequest clone() => ListAccountsRequest()..mergeFromMessage(this);
  ListAccountsRequest copyWith(void Function(ListAccountsRequest) updates) => super.copyWith((message) => updates(message as ListAccountsRequest));
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
  $core.String get currentPageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentPageToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPageToken() => clearField(3);
}

class ListAccountsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListAccountsResponse', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..pc<Account>(1, 'accounts', $pb.PbFieldType.PM, subBuilder: Account.create)
    ..aOS(2, 'nextPageToken')
    ..hasRequiredFields = false
  ;

  ListAccountsResponse._() : super();
  factory ListAccountsResponse() => create();
  factory ListAccountsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAccountsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListAccountsResponse clone() => ListAccountsResponse()..mergeFromMessage(this);
  ListAccountsResponse copyWith(void Function(ListAccountsResponse) updates) => super.copyWith((message) => updates(message as ListAccountsResponse));
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
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => clearField(2);
}

class SearchAccountsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SearchAccountsRequest', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aOS(1, 'query')
    ..aOM<ListAccountsRequest>(2, 'searchParams', subBuilder: ListAccountsRequest.create)
    ..hasRequiredFields = false
  ;

  SearchAccountsRequest._() : super();
  factory SearchAccountsRequest() => create();
  factory SearchAccountsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchAccountsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SearchAccountsRequest clone() => SearchAccountsRequest()..mergeFromMessage(this);
  SearchAccountsRequest copyWith(void Function(SearchAccountsRequest) updates) => super.copyWith((message) => updates(message as SearchAccountsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchAccountsRequest create() => SearchAccountsRequest._();
  SearchAccountsRequest createEmptyInstance() => create();
  static $pb.PbList<SearchAccountsRequest> createRepeated() => $pb.PbList<SearchAccountsRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchAccountsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchAccountsRequest>(create);
  static SearchAccountsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SearchAccountsResponse', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aOM<ListAccountsResponse>(1, 'searchResponse', subBuilder: ListAccountsResponse.create)
    ..hasRequiredFields = false
  ;

  SearchAccountsResponse._() : super();
  factory SearchAccountsResponse() => create();
  factory SearchAccountsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchAccountsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SearchAccountsResponse clone() => SearchAccountsResponse()..mergeFromMessage(this);
  SearchAccountsResponse copyWith(void Function(SearchAccountsResponse) updates) => super.copyWith((message) => updates(message as SearchAccountsResponse));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AssignAccountToRoleRequest', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aOS(1, 'assigneeAccountId')
    ..aOS(2, 'assignedAccountId')
    ..aOM<UserRoles>(3, 'role', subBuilder: UserRoles.create)
    ..hasRequiredFields = false
  ;

  AssignAccountToRoleRequest._() : super();
  factory AssignAccountToRoleRequest() => create();
  factory AssignAccountToRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssignAccountToRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AssignAccountToRoleRequest clone() => AssignAccountToRoleRequest()..mergeFromMessage(this);
  AssignAccountToRoleRequest copyWith(void Function(AssignAccountToRoleRequest) updates) => super.copyWith((message) => updates(message as AssignAccountToRoleRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DisableAccountRequest', package: const $pb.PackageName('getcouragenow.sys.v2.sys_account'), createEmptyInstance: create)
    ..aOS(1, 'accountId')
    ..hasRequiredFields = false
  ;

  DisableAccountRequest._() : super();
  factory DisableAccountRequest() => create();
  factory DisableAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisableAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DisableAccountRequest clone() => DisableAccountRequest()..mergeFromMessage(this);
  DisableAccountRequest copyWith(void Function(DisableAccountRequest) updates) => super.copyWith((message) => updates(message as DisableAccountRequest));
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

