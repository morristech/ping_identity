import 'package:json_annotation/json_annotation.dart';

enum PingIdentityTrustLevel {
  @JsonValue('IS_PRIMARY')
  primary,
  @JsonValue('IS_TRUSTED')
  trusted,
  @JsonValue('IGNORE')
  ignore,
}
