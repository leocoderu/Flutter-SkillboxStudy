package com.unact.yandexmapkitexample;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

import com.yandex.mapkit.MapKitFactory;

public class MainActivity extends FlutterActivity {
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    MapKitFactory.setLocale("YOUR_LOCALE");
    MapKitFactory.setApiKey("8c949bf5-8192-4615-b57f-632e79ca7c66");
    super.configureFlutterEngine(flutterEngine);
  }
}
