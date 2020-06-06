// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_detection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootDetection _$RootDetectionFromJson(Map<String, dynamic> json) {
  return RootDetection(
    toActivate: json['toActivate'] as bool,
    deviceVerificationApiKey: json['deviceVerificationApiKey'] as String,
    dataCenter: _$enumDecodeNullable(
        _$PingIdentityDataCenterEnumMap, json['dataCenter']),
  );
}

Map<String, dynamic> _$RootDetectionToJson(RootDetection instance) =>
    <String, dynamic>{
      'toActivate': instance.toActivate,
      'deviceVerificationApiKey': instance.deviceVerificationApiKey,
      'dataCenter': _$PingIdentityDataCenterEnumMap[instance.dataCenter],
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

const _$PingIdentityDataCenterEnumMap = {
  PingIdentityDataCenter.defaultRegion: 'defaultRegion',
  PingIdentityDataCenter.northAmerica: 'northAmerica',
  PingIdentityDataCenter.australia: 'australia',
  PingIdentityDataCenter.europe: 'europe',
};
