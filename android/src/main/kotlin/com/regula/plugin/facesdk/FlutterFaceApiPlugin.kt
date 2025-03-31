package com.regula.plugin.facesdk

import android.content.Context
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding

const val channelID = "flutter_face_api"
val eventSinks = mutableMapOf<String, EventSink?>()

lateinit var args: List<Any?>
lateinit var binding: FlutterPluginBinding
val context: Context
    get() = binding.applicationContext

fun sendEvent(id: String, data: Any? = "") {
    eventSinks[id]?.let { Handler(Looper.getMainLooper()).post { it.success(data.toSendable()) } }
}

inline fun <reified T> argsNullable(index: Int) = when (val v = args[index]) {
    null -> null
    is Map<*, *> -> v.toJson() as T
    is List<*> -> v.toJson() as T
    else -> v as T
}

fun setupEventChannel(id: String) = EventChannel(binding.binaryMessenger, "$channelID/event/$id").setStreamHandler(object : StreamHandler {
    override fun onListen(arguments: Any?, events: EventSink) = events.let { eventSinks[id] = it }
    override fun onCancel(arguments: Any?) = Unit
})

class FlutterFaceApiPlugin : FlutterPlugin, MethodCallHandler {
    override fun onDetachedFromEngine(binding: FlutterPluginBinding) = Unit
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        args = call.arguments as List<*>
        methodCall(call.method) { data -> result.success(data.toSendable()) }
    }

    override fun onAttachedToEngine(flutterBinding: FlutterPluginBinding) {
        binding = flutterBinding
        for (event in arrayOf(
            cameraSwitchEvent,
            livenessNotificationEvent,
            videoEncoderCompletionEvent,
            onCustomButtonTappedEvent
        )) setupEventChannel(event)
        MethodChannel(binding.binaryMessenger, "$channelID/method").setMethodCallHandler(this)
    }
}
