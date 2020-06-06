// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_options_required_with_passcode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PairingOptionsRequiredWithPasscodeResponse
    _$PairingOptionsRequiredWithPasscodeResponseFromJson(
        Map<String, dynamic> json) {
  return PairingOptionsRequiredWithPasscodeResponse(
    availableTrustLevels: (json['availableTrustLevels'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PingIdentityTrustLevelEnumMap, e))
        ?.toList(),
    deviceName: json['deviceName'] as String,
  );
}

Map<String, dynamic> _$PairingOptionsRequiredWithPasscodeResponseToJson(
        PairingOptionsRequiredWithPasscodeResponse instance) =>
    <String, dynamic>{
      'availableTrustLevels': instance.availableTrustLevels
          ?.map((e) => _$PingIdentityTrustLevelEnumMap[e])
          ?.toList(),
      'deviceName': instance.deviceName,
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
