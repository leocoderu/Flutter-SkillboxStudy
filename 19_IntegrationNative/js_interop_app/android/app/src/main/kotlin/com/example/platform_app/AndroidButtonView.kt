package com.example.js_interop_app

internal class AndroidButtonView(context: Context, id: Int, creationParams: Map<String?, Any?>?, messenger: BinaryMessenger) : PlatformView {
    private val button: Button = Button(context)

    private val intentName = "EVENTS"
    private val intentMessageId = "CALL"

    override fun getView(): View {
        return button
    }

    override fun dispose() {}

    init {
        button.textSize = 13f
        button.text = "Android Native Button"
        button.setOnClickListener {
            val intent = Intent(intentName)
            intent.putExtra(intentMessageId, Random.nextInt(0, 500))
            context.sendBroadcast(intent)
        }
    }
}