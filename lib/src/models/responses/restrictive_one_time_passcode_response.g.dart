// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restrictive_one_time_passcode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestrictiveOneTimePasscodeResponse _$RestrictiveOneTimePasscodeResponseFromJson(
    Map<String, dynamic> json) {
  return RestrictiveOneTimePasscodeResponse(
    code: json['code'] as String,
    status: _$enumDecodeNullable(
        _$PingIdentityOneTimePasscodeStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$RestrictiveOneTimePasscodeResponseToJson(
        RestrictiveOneTimePasscodeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': _$PingIdentityOneTimePasscodeStatusEnumMap[instance.status],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PingIdentityOneTimePasscodeStatusEnumMap = {
  PingIdentityOneTimePasscodeStatus.ok: 'PIDOneTimePasscodeOK',
  PingIdentityOneTimePasscodeStatus.deviceRooted:
      'PIDOneTimePasscodeDeviceRooted',
  PingIdentityOneTimePasscodeStatus.cannotCheckRootDetection:
      'PIDOneTimePasscodeCannotCheckRootDetectionAtOffline',
  PingIdentityOneTimePasscodeStatus.unsuccessful:
      'PIDOneTimePasscodeUnsuccessful',
};
