package com.example.platzi_trip_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Hace la barra de estado transparente
        window.statusBarColor = android.graphics.Color.TRANSPARENT
    }
}