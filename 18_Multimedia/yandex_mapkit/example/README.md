# yandex_mapkit_example

Demonstrates how to use the yandex_mapkit plugin with Java.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).



1. pubspec.yaml
   dependencies:   
      permission_handler: ^10.4.0
      yandex_mapkit:
        path: ../
 
   flutter:
   assets:
    - lib/assets/user.png
    - lib/assets/cluster.png
    - lib/assets/place.png
    - lib/assets/arrow.png
    - lib/assets/route_start.png
    - lib/assets/route_stop_by.png
    - lib/assets/route_end.png

2. android/app/build.grandle
   defaultConfig {
     minSdkVersion 21
     targetSdkVersion 31 
   }
   dependencies {
     implementation 'com.yandex.android:maps.mobile:4.2.2-full'
   }

3. android/app/src/main/java/com/unact/yandexmapkitexample/MainActivity
   public class MainActivity extends FlutterActivity {
     @Override
     public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
       MapKitFactory.setLocale("YOUR_LOCALE");
       MapKitFactory.setApiKey("...ENTER API CODE HERE...");
       super.configureFlutterEngine(flutterEngine);
     }
   }

4. ios/Runner/AppDelegate.swift
   @objc class AppDelegate: FlutterAppDelegate {
    ...
       YMKMapKit.setLocale("YOUR_LOCALE")
       YMKMapKit.setApiKey("...ENTER API CODE HERE...")
    ...
   }
 
5. ios/Runner/Info.plist
   Something change