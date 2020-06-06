import 'package:json_annotation/json_annotation.dart';

enum PingIdentityActionStatus {
  @JsonValue('SUCCESS')
  success,
  @JsonValue('FAILURE')
  failure,
  @JsonValue('RE_PAIR_SUCCESS')
  rePairSuccess,
}
