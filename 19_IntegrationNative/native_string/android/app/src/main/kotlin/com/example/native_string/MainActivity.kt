package com.example.native_string

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random

class MainActivity: FlutterActivity() {
    private val androidViewId = "INTEGRATION_ANDROID"
    private val eventChannel = "CALL_EVENTS"
    private val methodChannelId = "CALL_METHOD"
    private val intentName = "EVENTS"
    private val intentMessageId = "CALL"

    private var receiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(androidViewId, AndroidButtonViewFactory(flutterEngine.dartExecutor.binaryMessenger))

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelId).setMethodCallHandler {
                call, result ->
            if (call.method == intentMessageId) {
                result.success(Random.nextInt(0, 500))
            } else {
                result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor, eventChannel).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink) {
                    receiver = createReceiver(events)
                    applicationContext?.registerReceiver(receiver, IntentFilter(intentName))
                }

                override fun onCancel(args: Any?) {
                    receiver = null
                }
            }
        )
    }

    fun createReceiver(events: EventChannel.EventSink): BroadcastReceiver {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                events.success(intent.getIntExtra(intentMessageId, 0))  //!!!
            }
        }
    }
}
