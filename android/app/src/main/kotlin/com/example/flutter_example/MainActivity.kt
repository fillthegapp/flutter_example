package com.example.flutter_example

import android.util.Log
import com.amplitude.android.Amplitude
import com.amplitude.android.Configuration
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {

    private val amplitude by lazy {
        Amplitude(
            Configuration(
                apiKey = "<AMPLITUDE_API_KEY>",
                context = applicationContext
            )
        )
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "AmplitudeChannel"
        ).setMethodCallHandler {
            // This method is invoked on the main thread.
                call, result ->
            if (call.method == "sendAnalytics") {
                amplitude.track(
                    call.argument<String>("eventName").orEmpty(),
                    eventProperties = mapOf("artID" to call.argument<String>("id").orEmpty())
                )
                result.success("ok")
            } else {
                Log.d("Emilio", "Not implemented")
                result.notImplemented()
            }
        }
    }

}