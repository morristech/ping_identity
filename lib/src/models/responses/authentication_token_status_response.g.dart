// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_token_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationTokenStatusResponse _$AuthenticationTokenStatusResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationTokenStatusResponse(
    sessionInfo: json['sessionInfo'],
    errorDomain: _$enumDecodeNullable(
        _$PingIdentityErrorDomainEnumMap, json['errorDomain']),
  );
}

Map<String, dynamic> _$AuthenticationTokenStatusResponseToJson(
        AuthenticationTokenStatusResponse instance) =>
    <String, dynamic>{
      'sessionInfo': instance.sessionInfo,
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
