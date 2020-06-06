import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ping_identity/ping_identity.dart';

import 'models/ping_identity_action_type.dart';
import 'models/ping_identity_data_center.dart';
import 'models/user_selection.dart';
import 'models/responses/pairing_options_required_response.dart';
import 'models/responses/pairing_options_required_with_passcode_response.dart';
import 'models/responses/pairing_completed_response.dart';
import 'models/responses/logs_sent_to_server_response.dart';
import 'models/responses/ignore_device_completed_response.dart';
import 'models/responses/error_response.dart';
import 'models/responses/authentication_token_status_response.dart';
import 'models/responses/authentication_completed_response.dart';
import 'models/ping_identity_config.dart';

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

  Future<bool> get isPushDisabled {
    return _channel.invokeMethod<bool>('isPushDisabled');
  }

  Future<bool> get isGooglePlayServicesAvailable async {
    if (!Platform.isAndroid) {
      return false;
    }
    return _channel.invokeMethod<bool>('isGooglePlayServicesAvailable');
  }

  Future<bool> get isDeviceTrusted async {
    return _channel.invokeMethod<bool>('isDeviceTrusted');
  }

  Future<void> sendLogs() async {
    return _channel.invokeMethod<void>('sendLogs');
  }

  Future<String> generatePayload() async {
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

  Future<void> removeLocalData() async {
    return _channel.invokeMethod<void>('removeLocalData');
  }

  Future<void> setUserSelection(UserSelection selection) async {
    return _channel.invokeMethod<void>('setUserSelection', selection.toJson());
  }

  Future<void> pairDevice() async {
    final selection = UserSelection(
      actionType: PingIdentityActionType.none,
      trustLevel: PingIdentityTrustLevel.trusted,
    );

    return setUserSelection(selection);
  }

  Future<void> unpairDevice() async {
    final selection = UserSelection(
      actionType: PingIdentityActionType.deny,
      trustLevel: PingIdentityTrustLevel.ignore,
    );

    return setUserSelection(selection);
  }

  Future<void> init(PingIdentityConfig config) async {
    return _channel.invokeMapMethod('init', config.toJson());
  }

  Future<void> _messageHandler(MethodCall call) async {
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
    }
  }
}
