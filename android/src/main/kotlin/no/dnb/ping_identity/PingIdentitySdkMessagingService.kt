package no.dnb.ping_identity

import android.os.Bundle
import androidx.annotation.CallSuper
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import pingidsdkclient.fcm.PingIdPushHelper

open class PingIdentitySdkMessagingService : FirebaseMessagingService() {
    /**
     * Called when message is received.
     *
     * @param remoteMessage Object representing the message received from Firebase Cloud Messaging.
     */
    @CallSuper
    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        val dataMap = remoteMessage.data
        if (dataMap.containsKey("pingidsdk") && dataMap["pingidsdk"].equals("true")) {
            val data = Bundle()
            dataMap.forEach { (key, value) ->
                data.putString(key, value)
            }
            PingIdPushHelper.handlePushMessage(applicationContext, remoteMessage.from, data)
        }
    }
}
