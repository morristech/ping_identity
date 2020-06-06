import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ping_identity/src/models/models.dart';

// TODO: Documentation
class PingIdentity extends ChangeNotifier {
  MethodChannel _channel;
  final Function(AuthenticationTokenStatusResponse) authenticationTokenStatus;
  final Function didUntrustDevice;
  final Function onAuthenticationCancelled;
  final Function(AuthenticationCompletedResponse) onAuthenticationCompleted;
  final Function(dynamic) onAuthenticationRequired;
  final Function(ErrorResponse) onError;
  final Function(String) onGeneralMessage;
  final Function(int) onGooglePlayServicesStatusReceived;
  final Function(IgnoreDeviceCompletedResponse) onIgnoreDeviceCompleted;
  final Function(LogsSentToServerResponse) onLogsSentToServer;
  final Function(String) onOneTimePasscodeChanged;
  final Function(PairingCompletedResponse) onPairingCompleted;
  final Function(PairingOptionsRequiredResponse) onPairingOptionsRequired;
  final Function(PairingOptionsRequiredWithPasscodeResponse)
      onPairingOptionsRequiredWithPasscode;
  final Function(String) onPairingProgress;
  final Function onServicePayloadReceivedWithStatusDone;

  PingIdentity({
    @required this.authenticationTokenStatus,
    @required this.didUntrustDevice,
    @required this.onAuthenticationCancelled,
    @required this.onAuthenticationCompleted,
    @required this.onAuthenticationRequired,
    @required this.onError,
    @required this.onGeneralMessage,
    @required this.onGooglePlayServicesStatusReceived,
    @required this.onIgnoreDeviceCompleted,
    @required this.onLogsSentToServer,
    @required this.onOneTimePasscodeChanged,
    @required this.onPairingCompleted,
    @required this.onPairingOptionsRequired,
    @required this.onPairingOptionsRequiredWithPasscode,
    @required this.onPairingProgress,
    @required this.onServicePayloadReceivedWithStatusDone,
  }) {
    _channel = MethodChannel('no.dnb.ping_identity');
    _channel.setMethodCallHandler(_messageHandler);
  }

  Future<bool> isPushDisabled() {
    return _channel.invokeMethod<bool>('isPushDisabled');
  }

  Future<bool> isGooglePlayServicesAvailable() {
    if (!Platform.isAndroid) {
      return Future.value(false);
    }
    return _channel.invokeMethod<bool>('isGooglePlayServicesAvailable');
  }

  Future<bool> isDeviceTrusted() async {
    return _channel.invokeMethod<bool>('isDeviceTrusted');
  }

  Future<void> updateExistingPayloadWithUserSelection({
    String userAnswer,
    String ignoreInterval,
  }) {
    return _channel.invokeMethod('updateExisitingPayloadWithUserSelection', {
      'userAnswer': userAnswer,
      'ignoreInterval': ignoreInterval,
    });
  }

  Future<void> setServerPayload(String payload) {
    return _channel.invokeMethod('setServerPayload', payload);
  }

  Future<void> validateAuthenticationToken(String token) {
    return _channel.invokeMethod('validateAuthenticationToken', token);
  }

  Future<void> setRootDetection({
    @required bool toActivate,
    @required String deviceVerificationApiKey,
    @required PingIdentityDataCenter dataCenter,
  }) {
    final rootDetection = RootDetection(
      toActivate: toActivate,
      deviceVerificationApiKey: deviceVerificationApiKey,
      dataCenter: dataCenter,
    );
    return _channel.invokeMethod('setRootDetection', rootDetection.toJson());
  }

  Future<RestrictiveOneTimePasscodeResponse> getRestrictiveOneTimePasscode() {
    return _channel
        .invokeMapMethod('getRestrictiveOneTimePasscode')
        .then((res) => RestrictiveOneTimePasscodeResponse.fromJson(res));
  }

  Future<void> sendLogs() {
    return _channel.invokeMethod<void>('sendLogs');
  }

  Future<String> generatePayload() {
    return _channel.invokeMethod<String>('generatePayload');
  }

  Future<void> postIDPAuthenticationStepWithDataCenter(
    PingIdentityDataCenter dataCenter,
  ) async {
    return _channel.invokeMethod(
      'postIDPAuthenticationStepWithDataCenter',
      dataCenter,
    );
  }

  Future<void> removeLocalData() {
    return _channel.invokeMethod<void>('removeLocalData');
  }

  Future<void> setUserSelection({
    @required PingIdentityActionType actionType,
    @required PingIdentityTrustLevel trustLevel,
  }) {
    final selection = UserSelection(
      actionType: actionType,
      trustLevel: trustLevel,
    );
    return _channel.invokeMethod<void>('setUserSelection', selection.toJson());
  }

  Future<void> init(PingIdentityConfig config) {
    return _channel.invokeMapMethod('init', config.toJson());
  }

  void _messageHandler(MethodCall call) {
    switch (call.method) {
      case "onPairingProgress":
        onPairingProgress(call.arguments);
        break;
      case "onPairingOptionsRequired":
        onPairingOptionsRequired(
          PairingOptionsRequiredResponse.fromJson(call.arguments),
        );
        break;
      case "onServicePayloadReceivedWithStatusDone":
        onServicePayloadReceivedWithStatusDone();
        break;
      case "onAuthenticationCancelled":
        onAuthenticationCancelled();
        break;
      case "onOneTimePasscodeChanged":
        onOneTimePasscodeChanged(call.arguments);
        break;
      case "onIgnoreDeviceCompleted":
        onIgnoreDeviceCompleted(
          IgnoreDeviceCompletedResponse.fromJson(call.arguments),
        );
        break;
      case "onLogsSentToServer":
        onLogsSentToServer(
          LogsSentToServerResponse.fromJson(call.arguments),
        );
        break;
      case "onPairingCompleted":
        onPairingCompleted(
          PairingCompletedResponse.fromJson(call.arguments),
        );
        break;
      case "onGeneralMessage":
        onGeneralMessage(call.arguments);
        break;
      case "onAuthenticationCompleted":
        onAuthenticationCompleted(
          AuthenticationCompletedResponse.fromJson(call.arguments),
        );
        break;
      case "onGooglePlayServicesStatusReceived":
        onGooglePlayServicesStatusReceived(call.arguments);
        break;
      case "onPairingOptionsRequiredWithPasscode":
        onPairingOptionsRequiredWithPasscode(
          PairingOptionsRequiredWithPasscodeResponse.fromJson(call.arguments),
        );
        break;
      case "authenticationTokenStatus":
        authenticationTokenStatus(
          AuthenticationTokenStatusResponse.fromJson(call.arguments),
        );
        break;
      case "onAuthenticationRequired":
        onAuthenticationRequired(call.arguments);
        break;
      case "didUntrustDevice":
        didUntrustDevice();
        break;
      case "onError":
        onError(ErrorResponse.fromJson(call.arguments));
        break;
      case "onPlatformException":
        throw PlatformException(
          code: call.arguments['code'],
          message: call.arguments['message'],
          details: '$PlatformException on method ${call.arguments['method']}',
        );
        break;
    }
  }
}
