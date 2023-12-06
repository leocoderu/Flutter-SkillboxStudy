package com.example.js_interop_app

import "AndroidViewButton.kt"
class AndroidButtonViewFactory(messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val binaryMessenger: BinaryMessenger = messenger

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>
        return AndroidButtonView(context, viewId, creationParams, binaryMessenger)
    }
}