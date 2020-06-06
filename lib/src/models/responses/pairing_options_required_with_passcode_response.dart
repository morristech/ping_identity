import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_trust_level.dart';

part 'pairing_options_required_with_passcode_response.g.dart';

@JsonSerializable()
class PairingOptionsRequiredWithPasscodeResponse extends Equatable {
  final List<PingIdentityTrustLevel> availableTrustLevels;
  final String deviceName;

  PairingOptionsRequiredWithPasscodeResponse({
    this.availableTrustLevels,
    this.deviceName,
  });

  @override
  List<Object> get props => [
        availableTrustLevels,
        deviceName,
      ];

  factory PairingOptionsRequiredWithPasscodeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PairingOptionsRequiredWithPasscodeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PairingOptionsRequiredWithPasscodeResponseToJson(this);
}
