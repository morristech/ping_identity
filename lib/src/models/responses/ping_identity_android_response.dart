import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ping_identity_android_response.g.dart';

@JsonSerializable()
class PingIdentityAndroidResponse extends Equatable {
  final bool isGooglePlayServicesAvailable;
  final bool isPushDisabled;

  bool get isPushEnabled => !isPushDisabled;

  PingIdentityAndroidResponse({
    this.isGooglePlayServicesAvailable,
    this.isPushDisabled,
  });

  @override
  List<Object> get props => [
        isGooglePlayServicesAvailable,
        isPushDisabled,
      ];

  factory PingIdentityAndroidResponse.fromJson(Map<String, dynamic> json) =>
      _$PingIdentityAndroidResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PingIdentityAndroidResponseToJson(this);
}
