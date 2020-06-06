import 'package:json_annotation/json_annotation.dart';

enum PingIdentityActionType {
  @JsonValue('none')
  none,
  @JsonValue('approve')
  approve,
  @JsonValue('deny')
  deny,
  @JsonValue('block')
  block,
}
