///
//  Generated code. Do not modify.
//  source: sys_core_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TimeSegment extends $pb.ProtobufEnum {
  static const TimeSegment INVALID = TimeSegment._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID');
  static const TimeSegment HOUR = TimeSegment._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HOUR');
  static const TimeSegment DAY = TimeSegment._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DAY');

  static const $core.List<TimeSegment> values = <TimeSegment> [
    INVALID,
    HOUR,
    DAY,
  ];

  static final $core.Map<$core.int, TimeSegment> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TimeSegment valueOf($core.int value) => _byValue[value];

  const TimeSegment._($core.int v, $core.String n) : super(v, n);
}

