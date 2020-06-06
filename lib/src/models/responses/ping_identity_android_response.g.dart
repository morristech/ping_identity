// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_identity_android_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PingIdentityAndroidResponse _$PingIdentityAndroidResponseFromJson(
    Map<String, dynamic> json) {
  return PingIdentityAndroidResponse(
    isGooglePlayServicesAvailable:
        json['isGooglePlayServicesAvailable'] as bool,
    isPushDisabled: json['isPushDisabled'] as bool,
  );
}

Map<String, dynamic> _$PingIdentityAndroidResponseToJson(
        PingIdentityAndroidResponse instance) =>
    <String, dynamic>{
      'isGooglePlayServicesAvailable': instance.isGooglePlayServicesAvailable,
      'isPushDisabled': instance.isPushDisabled,
    };
