///
//  Generated code. Do not modify.
//  source: sys_account_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Roles extends $pb.ProtobufEnum {
  static const Roles INVALID = Roles._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID');
  static const Roles GUEST = Roles._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GUEST');
  static const Roles USER = Roles._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER');
  static const Roles ADMIN = Roles._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ADMIN');
  static const Roles SUPERADMIN = Roles._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUPERADMIN');

  static const $core.List<Roles> values = <Roles> [
    INVALID,
    GUEST,
    USER,
    ADMIN,
    SUPERADMIN,
  ];

  static final $core.Map<$core.int, Roles> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Roles valueOf($core.int value) => _byValue[value];

  const Roles._($core.int v, $core.String n) : super(v, n);
}

