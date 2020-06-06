package no.dnb.ping_identity

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.MethodChannel
import pingidsdkclient.DeviceDetails
import pingidsdkclient.PingID

// TODO: Documentation
class PingIdentitySdkEvents(private val channel: MethodChannel) : PingID.PingIdSdkEvents {

    private var handler: Handler = Handler(Looper.getMainLooper())

    private fun invokeMainThreadMethod(method: String, arguments: Any?) {
        handler.post {
            channel.invokeMethod(method, arguments)
        }
    }

    override fun onPairingProgress(message: String?) {
        invokeMainThreadMethod("onPairingProgress", message)
    }

    override fun onPairingOptionsRequired(availableTrustLevels: MutableList<String>?,
                                          deviceDetails: DeviceDetails?) {
        val map = mapOf("availableTrustLevels" to availableTrustLevels, "deviceLevels" to deviceDetails)
        invokeMainThreadMethod("onPairingOptionsRequired", map)
    }

    override fun onServicePayloadReceivedWithStatusDone() {
        invokeMainThreadMethod("onServicePayloadReceivedWithStatusDone", null)
    }

    override fun onAuthenticationCancelled() {
       invokeMainThreadMethod("onAuthenticationCancelled", null)
    }

    override fun onOneTimePasscodeChanged(newPasscode: String?) {
        invokeMainThreadMethod("onOneTimePasscodeChanged", newPasscode)
    }

    override fun onIgnoreDeviceCompleted(status: PingID.PIDActionStatus?,
                                         errorDomain: PingID.PIDErrorDomain?) {
        val map = mapOf("status" to status?.name, "errorDomain" to errorDomain?.name)
        invokeMainThreadMethod("onIgnoreDeviceCompleted", map)
    }

    override fun onLogsSentToServer(status: PingID.PIDActionStatus?, supportId: String?) {
        val map = mapOf("status" to status?.name, "supportId" to supportId)
        invokeMainThreadMethod("onLogsSentToServer", map)
    }

    override fun onPairingCompleted(status: PingID.PIDActionStatus?,
                                    errorDomain: PingID.PIDErrorDomain?) {
        val map = mapOf("status" to status, "errorDomain" to errorDomain?.name)
        invokeMainThreadMethod("onPairingCompleted", map)
    }

    override fun onGeneralMessage(message: String?) {
        invokeMainThreadMethod("onGeneralMessage", message)
    }

    override fun onAuthenticationCompleted(status: PingID.PIDActionStatus?,
                                           actionType: PingID.PIDActionType?,
                                           pidErrorDomain: PingID.PIDErrorDomain?) {
        val map = mapOf(
                "status" to status?.name,
                "actionType" to actionType?.name,
                "pidErrorDomain" to pidErrorDomain?.name
        )
        invokeMainThreadMethod("onAuthenticationCompleted", map)
    }

    override fun onGooglePlayServicesStatusReceived(status: Int) {
        invokeMainThreadMethod("onGooglePlayServicesStatusReceived", status)
    }

    override fun onPairingOptionsRequiredWithPasscode(availableTrustLevels: MutableList<String>?,
                                                      deviceName: String?) {
        val map = mapOf("availableTrustLevels" to availableTrustLevels, "deviceName" to deviceName)
        invokeMainThreadMethod("onPairingOptionsRequiredWithPasscode", map)
    }

    override fun authenticationTokenStatus(sessionInfo: Bundle?, errorDomain: PingID.PIDErrorDomain?) {
        val map = mapOf("sessionInfo" to sessionInfo.toString(), "errorDomain" to errorDomain?.name)
     invokeMainThreadMethod("authenticationTokenStatus", map)
    }

    override fun onAuthenticationRequired(data: Bundle?) {
        invokeMainThreadMethod("onAuthenticationRequired", data)
    }

    override fun didUntrustDevice() {
        invokeMainThreadMethod("didUntrustDevice", null)
    }

    override fun onError(throwable: Throwable?, description: String?) {
        val map = mapOf("throwable" to throwable.toString(), "description" to description)
        invokeMainThreadMethod("onError", map)
    }

}