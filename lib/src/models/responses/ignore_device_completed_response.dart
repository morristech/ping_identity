import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_action_status.dart';
import 'package:ping_identity/src/models/ping_identity_error_domain.dart';

part 'ignore_device_completed_response.g.dart';

@JsonSerializable()
class IgnoreDeviceCompletedResponse extends Equatable {
  final PingIdentityActionStatus status;
  final PingIdentityErrorDomain errorDomain;

  IgnoreDeviceCompletedResponse({this.status, this.errorDomain});

  @override
  List<Object> get props => [status, errorDomain];

  factory IgnoreDeviceCompletedResponse.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDeviceCompletedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDeviceCompletedResponseToJson(this);
}
