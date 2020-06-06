// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_sent_to_server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogsSentToServerResponse _$LogsSentToServerResponseFromJson(
    Map<String, dynamic> json) {
  return LogsSentToServerResponse(
    status:
        _$enumDecodeNullable(_$PingIdentityActionStatusEnumMap, json['status']),
    supportId: json['supportId'] as String,
  );
}

Map<String, dynamic> _$LogsSentToServerResponseToJson(
        LogsSentToServerResponse instance) =>
    <String, dynamic>{
      'status': _$PingIdentityActionStatusEnumMap[instance.status],
      'supportId': instance.supportId,
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

const _$PingIdentityActionStatusEnumMap = {
  PingIdentityActionStatus.success: 'SUCCESS',
  PingIdentityActionStatus.failure: 'FAILURE',
  PingIdentityActionStatus.rePairSuccess: 'RE_PAIR_SUCCESS',
};
