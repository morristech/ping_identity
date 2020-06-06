import 'package:json_annotation/json_annotation.dart';

enum PingIdentityDataCenter {
  @JsonValue('defaultRegion')
  defaultRegion,
  @JsonValue('northAmerica')
  northAmerica,
  @JsonValue('australia')
  australia,
  @JsonValue('europe')
  europe,
}
