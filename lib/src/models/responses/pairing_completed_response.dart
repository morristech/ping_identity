import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_action_status.dart';
import 'package:ping_identity/src/models/ping_identity_error_domain.dart';

part 'pairing_completed_response.g.dart';

@JsonSerializable()
class PairingCompletedResponse extends Equatable {
  final PingIdentityActionStatus status;
  final PingIdentityErrorDomain errorDomain;

  PairingCompletedResponse({this.status, this.errorDomain});

  @override
  List<Object> get props => [status, errorDomain];

  factory PairingCompletedResponse.fromJson(Map<String, dynamic> json) =>
      _$PairingCompletedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PairingCompletedResponseToJson(this);
}
