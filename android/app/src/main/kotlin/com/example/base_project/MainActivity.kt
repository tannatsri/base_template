package com.example.base_project


import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val navigationChanelName = "navigation.base-channel"
    private var navigationChannel: MethodChannel? = null


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        navigationChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, navigationChanelName)
        handleNavigationChannel()
        super.configureFlutterEngine(flutterEngine)
    }

    private fun handleNavigationChannel() {
        navigationChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "pop" -> {
//                    finish()
                    result.success(null)
                }

            }
        }
    }


    override fun onResume() {

        val data = intent.data
        navigationChannel?.invokeMethod("initialRoute", "${data.toString()}")
        print(data.toString())
        super.onResume()
    }

    override fun onBackPressed() {
        navigationChannel?.invokeMethod("pop", "something")
    }

}
