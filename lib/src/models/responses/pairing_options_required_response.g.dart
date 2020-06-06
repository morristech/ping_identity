// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_options_required_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PairingOptionsRequiredResponse _$PairingOptionsRequiredResponseFromJson(
    Map<String, dynamic> json) {
  return PairingOptionsRequiredResponse(
    availableTrustLevels: (json['availableTrustLevels'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PingIdentityTrustLevelEnumMap, e))
        ?.toList(),
    deviceDetails: json['deviceDetails'] == null
        ? null
        : DeviceDetails.fromJson(json['deviceDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PairingOptionsRequiredResponseToJson(
        PairingOptionsRequiredResponse instance) =>
    <String, dynamic>{
      'availableTrustLevels': instance.availableTrustLevels
          ?.map((e) => _$PingIdentityTrustLevelEnumMap[e])
          ?.toList(),
      'deviceDetails': instance.deviceDetails,
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

const _$PingIdentityTrustLevelEnumMap = {
  PingIdentityTrustLevel.primary: 'IS_PRIMARY',
  PingIdentityTrustLevel.trusted: 'IS_TRUSTED',
  PingIdentityTrustLevel.ignore: 'IGNORE',
};
