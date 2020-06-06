import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_passcode_status.dart';

part 'restrictive_one_time_passcode_response.g.dart';

@JsonSerializable()
class RestrictiveOneTimePasscodeResponse extends Equatable {
  final String code;
  final PingIdentityOneTimePasscodeStatus status;

  RestrictiveOneTimePasscodeResponse({this.code, this.status});

  @override
  List<Object> get props => [code, status];

  factory RestrictiveOneTimePasscodeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RestrictiveOneTimePasscodeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RestrictiveOneTimePasscodeResponseToJson(this);
}
