// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSelection _$UserSelectionFromJson(Map<String, dynamic> json) {
  return UserSelection(
    actionType: _$enumDecodeNullable(
        _$PingIdentityActionTypeEnumMap, json['actionType']),
    trustLevel: _$enumDecodeNullable(
        _$PingIdentityTrustLevelEnumMap, json['trustLevel']),
  );
}

Map<String, dynamic> _$UserSelectionToJson(UserSelection instance) =>
    <String, dynamic>{
      'actionType': _$PingIdentityActionTypeEnumMap[instance.actionType],
      'trustLevel': _$PingIdentityTrustLevelEnumMap[instance.trustLevel],
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

const _$PingIdentityActionTypeEnumMap = {
  PingIdentityActionType.none: 'none',
  PingIdentityActionType.approve: 'approve',
  PingIdentityActionType.deny: 'deny',
  PingIdentityActionType.block: 'block',
};

const _$PingIdentityTrustLevelEnumMap = {
  PingIdentityTrustLevel.primary: 'IS_PRIMARY',
  PingIdentityTrustLevel.trusted: 'IS_TRUSTED',
  PingIdentityTrustLevel.ignore: 'IGNORE',
};
