package com.regula.plugin.facesdk

import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

lateinit var args: List<Any?>
val eventSinks = mutableMapOf<String, EventChannel.EventSink?>()
lateinit var binaryMessenger: BinaryMessenger

fun sendEvent(id: String, data: Any? = "") {
    eventSinks[id]?.let { Handler(Looper.getMainLooper()).post { it.success(data.toSendable()) } }
}

inline fun <reified T> argsNullable(index: Int) = when (val v = args[index]) {
    null -> null
    is Map<*, *> -> v.toJson() as T
    is List<*> -> v.toJson() as T
    else -> v as T
}

fun setupEventChannel(id: String) = EventChannel(binaryMessenger, "flutter_face_api/event/$id").setStreamHandler(object : EventChannel.StreamHandler {
    override fun onListen(arguments: Any?, events: EventChannel.EventSink) = events.let { eventSinks[id] = it }
    override fun onCancel(arguments: Any?) = Unit
})

class FlutterFaceApiPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    override fun onAttachedToActivity(binding: ActivityPluginBinding) = binding.activity.let { activity = it }
    override fun onDetachedFromActivityForConfigChanges() = Unit
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) = Unit
    override fun onDetachedFromActivity() = Unit
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) = Unit
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        args = call.arguments as List<*>
        methodCall(call.method) { data -> result.success(data.toSendable()) }
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binaryMessenger = binding.binaryMessenger
        for (event in arrayOf(
            cameraSwitchEvent,
            livenessNotificationEvent,
            videoEncoderCompletionEvent,
            onCustomButtonTappedEvent
        )) setupEventChannel(event)
        MethodChannel(binaryMessenger, "flutter_face_api/method").setMethodCallHandler(this)
    }
}
