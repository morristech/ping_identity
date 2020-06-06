import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_error_domain.dart';

part 'authentication_token_status_response.g.dart';

@JsonSerializable()
class AuthenticationTokenStatusResponse extends Equatable {
  final dynamic sessionInfo;
  final PingIdentityErrorDomain errorDomain;

  AuthenticationTokenStatusResponse({
    this.sessionInfo,
    this.errorDomain,
  });

  @override
  List<Object> get props => [sessionInfo, errorDomain];

  factory AuthenticationTokenStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AuthenticationTokenStatusResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AuthenticationTokenStatusResponseToJson(this);
}
