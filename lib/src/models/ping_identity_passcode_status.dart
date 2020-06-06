import 'package:json_annotation/json_annotation.dart';

enum PingIdentityOneTimePasscodeStatus {
  @JsonValue('PIDOneTimePasscodeOK')
  ok,
  @JsonValue('PIDOneTimePasscodeDeviceRooted')
  deviceRooted,
  @JsonValue('PIDOneTimePasscodeCannotCheckRootDetectionAtOffline')
  cannotCheckRootDetection,
  @JsonValue('PIDOneTimePasscodeUnsuccessful')
  unsuccessful,
}
