import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/src/models/ping_identity_action_status.dart';

part 'logs_sent_to_server_response.g.dart';

@JsonSerializable()
class LogsSentToServerResponse extends Equatable {
  final PingIdentityActionStatus status;
  final String supportId;

  LogsSentToServerResponse({this.status, this.supportId});

  @override
  List<Object> get props => [status, supportId];

  factory LogsSentToServerResponse.fromJson(Map<String, dynamic> json) =>
      _$LogsSentToServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogsSentToServerResponseToJson(this);
}
