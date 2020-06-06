// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_completed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PairingCompletedResponse _$PairingCompletedResponseFromJson(
    Map<String, dynamic> json) {
  return PairingCompletedResponse(
    status:
        _$enumDecodeNullable(_$PingIdentityActionStatusEnumMap, json['status']),
    errorDomain: _$enumDecodeNullable(
        _$PingIdentityErrorDomainEnumMap, json['errorDomain']),
  );
}

Map<String, dynamic> _$PairingCompletedResponseToJson(
        PairingCompletedResponse instance) =>
    <String, dynamic>{
      'status': _$PingIdentityActionStatusEnumMap[instance.status],
      'errorDomain': _$PingIdentityErrorDomainEnumMap[instance.errorDomain],
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

const _$PingIdentityErrorDomainEnumMap = {
  PingIdentityErrorDomain.unknown: 'PIDErrorUnknown',
  PingIdentityErrorDomain.pairing: 'PIDErrorWithPairing',
  PingIdentityErrorDomain.appDisabled: 'PIDErrorAppDisabled',
  PingIdentityErrorDomain.wrongAppId: 'PIDErrorWrongAppID',
  PingIdentityErrorDomain.timeoutError: 'PIDErrorTimeout',
  PingIdentityErrorDomain.noInternetConnection: 'PIDErrorNoInternetConnection',
  PingIdentityErrorDomain.signature: 'PIDErrorWrongSignature',
  PingIdentityErrorDomain.publicKey: 'PIDErrorProblemWithPublicKey',
  PingIdentityErrorDomain.network: 'PIDNetworkError',
  PingIdentityErrorDomain.internal: 'PIDInternalError',
  PingIdentityErrorDomain.missingPermissions: 'PIDMissingPermissions',
  PingIdentityErrorDomain.deviceTokenMissing: 'PIDErrorDeviceTokenIsMissing',
  PingIdentityErrorDomain.expiredOrWrongAuthToken:
      'PIDErrorExpiredOrWrongAuthToken',
  PingIdentityErrorDomain.wrongAppIdFromAuthToken:
      'PIDErrorWrongAppIDFromAuthToken',
  PingIdentityErrorDomain.wrongAccountIdFromAuthToken:
      'PIDErrorWrongAccountIDFromAuthToken',
  PingIdentityErrorDomain.userIsSuspended: 'PIDErrorUserIsSuspended',
  PingIdentityErrorDomain.usernameNotPairedForToken:
      'PIDErrorUsernameNotPairedForToken',
  PingIdentityErrorDomain.authTokenAlreadyUsed: 'PIDErrorAuthTokenAlreadyUsed',
  PingIdentityErrorDomain.serverResponse: 'PIDErrorServerResponse',
  PingIdentityErrorDomain.deviceRooted: 'PIDErrorDeviceRooted',
  PingIdentityErrorDomain.rePairing: 'PIDErrorWithRepairing',
  PingIdentityErrorDomain.rePairingTestOtp: 'PIDErrorWithRepairingTestOtp',
};
