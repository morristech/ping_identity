// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_identity_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PingIdentityConfig _$PingIdentityConfigFromJson(Map<String, dynamic> json) {
  return PingIdentityConfig(
    appIdentifier: json['appIdentifier'] as String,
    senderId: json['senderId'] as String,
    mfaType: _$enumDecodeNullable(
        _$PingIdentitySupportedMFATypeEnumMap, json['mfaType']),
  );
}

Map<String, dynamic> _$PingIdentityConfigToJson(PingIdentityConfig instance) =>
    <String, dynamic>{
      'appIdentifier': instance.appIdentifier,
      'senderId': instance.senderId,
      'mfaType': _$PingIdentitySupportedMFATypeEnumMap[instance.mfaType],
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

const _$PingIdentitySupportedMFATypeEnumMap = {
  PingIdentitySupportedMFAType.automatic: 'automatic',
  PingIdentitySupportedMFAType.enforceRemoteNotifications:
      'enforceRemoteNotifications',
  PingIdentitySupportedMFAType.disableRemoteNotifications:
      'disableRemoteNotifications',
};
