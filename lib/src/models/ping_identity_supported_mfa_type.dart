import 'package:json_annotation/json_annotation.dart';

enum PingIdentitySupportedMFAType {
  @JsonValue('automatic')
  automatic,
  @JsonValue('enforceRemoteNotifications')
  enforceRemoteNotifications,
  @JsonValue('disableRemoteNotifications')
  disableRemoteNotifications,
}
