import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_data_center.dart';

part 'root_detection.g.dart';

@JsonSerializable()
class RootDetection extends Equatable {
  final bool toActivate;
  final String deviceVerificationApiKey;
  final PingIdentityDataCenter dataCenter;

  RootDetection({
    this.toActivate,
    this.deviceVerificationApiKey,
    this.dataCenter,
  });

  @override
  List<Object> get props => [
        toActivate,
        deviceVerificationApiKey,
        dataCenter,
      ];

  factory RootDetection.fromJson(Map<String, dynamic> json) =>
      _$RootDetectionFromJson(json);

  Map<String, dynamic> toJson() => _$RootDetectionToJson(this);
}
