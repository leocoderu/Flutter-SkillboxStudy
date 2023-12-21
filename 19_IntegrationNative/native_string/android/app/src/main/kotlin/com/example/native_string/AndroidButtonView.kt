package com.example.native_string

import android.content.Context
import android.content.Intent
import android.view.View
import android.widget.Button
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView
import kotlin.random.Random

internal class AndroidButtonView(context: Context, id: Int, creationParams: Map<String?, Any?>?, messenger: BinaryMessenger) :
    PlatformView {
    private val button: Button = Button(context)

    private val intentName = "EVENTS"
    private val intentMessageId = "CALL"

    override fun getView(): View {
        return button
    }

    override fun dispose() {}

    init {
        button.textSize = 13f
        button.text = "Send to Native"
        button.setOnClickListener {
            val intent = Intent(intentName)
            intent.putExtra(intentMessageId, "String from Android Native Side")
            //intent.putExtra(intentMessageId, Random.nextInt(0, 500))
            context.sendBroadcast(intent)
        }
    }
}