# template_app

Template for new Flutter project with DI, BloC, Hive etc.

## Getting Started

- Clear Architecture (Layers in different packages)
- Analyzer Layer with Pedantic 
- Dependency Injection (GetIt)
- BloC Statement Management
- Hive storage persistent data
- Fluro Navigation
- Local Authorization
- Internationalization and localization
- Basic structure of project

## Android

### Set Versions in android\app\build.gradle
- compileSdk = 34
- ndkVersion = "27.0.12077973"
- minSdk = 23
- targetSdk = 34


### Add to AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
    <application>
    ...
    </application>
</manifest>

### Change in MainActivity.kt
import io.flutter.embedding.android.FlutterFragmentActivity
class MainActivity: FlutterFragmentActivity() {
}

## iOS

### Add to ios/Runner/info.plist
<dict>
    <key>NSFaceIDUsageDescription</key>
    <string>This app authenticating using biometric</string>
    ...
</dict>