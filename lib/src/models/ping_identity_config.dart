import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_supported_mfa_type.dart';

part 'ping_identity_config.g.dart';

@JsonSerializable()
class PingIdentityConfig extends Equatable {
  final String appIdentifier;
  final String senderId;
  final PingIdentitySupportedMFAType mfaType;

  PingIdentityConfig({
    this.appIdentifier,
    this.senderId,
    this.mfaType,
  });

  @override
  List<Object> get props => [
        appIdentifier,
        senderId,
        mfaType,
      ];

  factory PingIdentityConfig.fromJson(Map<String, dynamic> json) =>
      _$PingIdentityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PingIdentityConfigToJson(this);
}
