import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_action_status.dart';
import 'package:ping_identity/src/models/ping_identity_action_type.dart';
import 'package:ping_identity/src/models/ping_identity_error_domain.dart';

part 'authentication_completed_response.g.dart';

@JsonSerializable()
class AuthenticationCompletedResponse extends Equatable {
  final PingIdentityActionStatus status;
  final PingIdentityActionType actionType;
  final PingIdentityErrorDomain errorDomain;

  AuthenticationCompletedResponse({
    this.status,
    this.actionType,
    this.errorDomain,
  });

  @override
  List<Object> get props => [
        status,
        actionType,
        errorDomain,
      ];

  factory AuthenticationCompletedResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationCompletedResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AuthenticationCompletedResponseToJson(this);
}
