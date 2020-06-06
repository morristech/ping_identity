import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/device_details.dart';
import 'package:ping_identity/src/models/ping_identity_trust_level.dart';

part 'pairing_options_required_response.g.dart';

@JsonSerializable()
class PairingOptionsRequiredResponse extends Equatable {
  final List<PingIdentityTrustLevel> availableTrustLevels;
  final DeviceDetails deviceDetails;

  PairingOptionsRequiredResponse({
    this.availableTrustLevels,
    this.deviceDetails,
  });

  @override
  List<Object> get props => [
        availableTrustLevels,
        deviceDetails,
      ];

  factory PairingOptionsRequiredResponse.fromJson(Map<String, dynamic> json) =>
      _$PairingOptionsRequiredResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PairingOptionsRequiredResponseToJson(this);
}
