package no.dnb.ping_identity

import android.app.Application
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.HashMap
import kotlin.Exception
import pingidsdkclient.PIDUserSelectionObject
import pingidsdkclient.PingID

/** PingIdentityPlugin */
// TODO: Documentation
public class PingIdentityPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    // / The MethodChannel that will the communication between Flutter and native Android
    // /
    // / This local reference serves to register the plugin with the Flutter Engine and unregister it
    // / when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var application: Application? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.flutterEngine.dartExecutor, "no.dnb.ping_identity")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "init" -> initPingIdentity(call, result)
            "setUserSelection" -> setUserSelection(call, result)
            "generatePayload" -> generatePayload(result)
            "removeLocalData" -> removeLocalData(result)
            "postIDPAuthenticationStepWithDataCenter" -> postIDPAuthenticationStepWithDataCenter(call, result)
            "sendLogs" -> sendLogs(result)
            "isDeviceTrusted" -> isDeviceTrusted(result)
            "isPushDisabled" -> isPushDisabled(result)
            "isGooglePlayServicesAvailable" -> isGooglePlayServicesAvailable(result)
            "getRestrictiveOneTimePasscode" -> getRestrictiveOneTimePasscode(result)
            "validateAuthenticationToken" -> validateAuthenticationToken(call, result)
            "setRootDetection" -> setRootDetection(call, result)
            "setServerPayload" -> setServerPayload(call, result)
            "updateExistingPayloadWithUserSelection" -> updateExistingPayloadWithUserSelection(call, result)
            else -> result.notImplemented()
        }
    }

    private fun updateExistingPayloadWithUserSelection(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            val userAnswer = call.argument<String>("userAnswer")
            val ignoreInterval = call.argument<String>("ignoreInterval")

            result.success(PingID.getInstance().updateExistingPayloadWithUserSelection(userAnswer, ignoreInterval))
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun setServerPayload(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            PingID.getInstance().setServerPayload(call.arguments as String)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun setRootDetection(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            val toActivate = call.argument<Boolean>("toActivate")!!
            val deviceVerificationApiKey = call.argument<String>("deviceVerificationApiKey")!!
            val dataCenter = dataCenterFromString(call.argument<String>("dataCenter")!!)
            PingID.getInstance().setRootDetection(toActivate, dataCenter, deviceVerificationApiKey)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun validateAuthenticationToken(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            result.success(PingID.getInstance().validateAuthenticationToken(call.arguments as String));
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun getRestrictiveOneTimePasscode(@NonNull result: Result) {
        try {
            PingID.getInstance().getRestrictiveOneTimePasscode {
                result.success(mapOf("passcode" to it.first, "status" to it.second.name))
            }
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun isPushDisabled(@NonNull result: Result) {
        try {
            result.success(PingID.getInstance().isPushDisabled)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun isGooglePlayServicesAvailable(@NonNull result: Result) {
        try {
            result.success(PingID.getInstance().isGooglePlayServicesAvailable)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun isDeviceTrusted(@NonNull result: Result) {
        try {
            result.success(PingID.getInstance().isDeviceTrusted)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun sendLogs(@NonNull result: Result) {
        try {
            PingID.getInstance().sendLogs()
        } catch (e: Exception) {
            reportException(result, e)
        }
        result.success(null)
    }

    private fun postIDPAuthenticationStepWithDataCenter(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            val dataCenter = dataCenterFromString(call.arguments as String)
            PingID.getInstance().postIDPAuthenticationStepWithDataCenter(dataCenter)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun dataCenterFromString(input: String): PingID.PIDDataCenterType {
        var result = PingID.PIDDataCenterType.PIDDataCenterTypeDefault
        when (input) {
            "northAmerica" -> result = PingID.PIDDataCenterType.PIDDataCenterTypeNA
            "australia" -> result = PingID.PIDDataCenterType.PIDDataCenterTypeAU
            "europe" -> result = PingID.PIDDataCenterType.PIDDataCenterTypeEU
        }
        return result
    }

    private fun generatePayload(@NonNull result: Result) {
        try {
            PingID.getInstance().generatePayload {
                result.success(it)
            }
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun removeLocalData(@NonNull result: Result) {
        try {
            PingID.getInstance().removePingIDSDKLocalData()
            result.success(null)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun setUserSelection(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            val arguments: HashMap<String, Any> = call.arguments()

            var actionType = PingID.PIDActionType.PIDActionTypeNone
            when (arguments["actionType"] as String) {
                "approve" -> actionType = PingID.PIDActionType.PIDActionTypeApprove
                "deny" -> actionType = PingID.PIDActionType.PIDActionTypeDeny
                "block" -> actionType = PingID.PIDActionType.PIDActionTypeBlock
            }

            var trustLevel = PingID.PIDTrustLevel.PIDTrustLevelIgnored
            when (arguments["trustLevel"] as String) {
                "IS_PRIMARY" -> trustLevel = PingID.PIDTrustLevel.PIDTrustLevelPrimary
                "IS_TRUSTED" -> trustLevel = PingID.PIDTrustLevel.PIDTrustLevelTrusted
            }

            val pidUserSelectionObject = PIDUserSelectionObject()
            pidUserSelectionObject.pidActionType = actionType
            pidUserSelectionObject.pidTrustLevel = trustLevel
            PingID.getInstance().setUserSelection(pidUserSelectionObject)

            result.success(null)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun initPingIdentity(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            val arguments: HashMap<Any, Any> = call.arguments()
            val appIdentifier = arguments["appIdentifier"] as String
            val senderId = arguments["senderId"] as String
            var mfaType = PingID.PIDSupportedMfaType.PIDSupportedMfaTypeAutomatic

            when (call.argument<String>("mfaType")) {
                "enforceRemoteNotifications" -> mfaType = PingID.PIDSupportedMfaType.PIDSupportedMfaTypeEnforceRemoteNotifications
                "disableRemoteNotifications" -> mfaType = PingID.PIDSupportedMfaType.PIDSupportedMfaTypeDisableRemoteNotifications
            }

            PingID.init(
                    application,
                    appIdentifier,
                    PingIdentitySdkEvents(channel),
                    senderId,
                    mfaType
            )
            val map = mapOf(
                    "isGooglePlayServicesAvailable" to PingID.getInstance().isGooglePlayServicesAvailable,
                    "isPushDisabled" to PingID.getInstance().isPushDisabled
            )
            result.success(map)
        } catch (e: Exception) {
            reportException(result, e)
        }
    }

    private fun reportException(@NonNull result: Result, exception: Exception) {
        result.error(exception.javaClass.simpleName, exception.message, null)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        application = binding.activity.application
    }

    override fun onDetachedFromActivity() {
        application = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        application = binding.activity.application
    }

    override fun onDetachedFromActivityForConfigChanges() {
        application = null
    }
}
