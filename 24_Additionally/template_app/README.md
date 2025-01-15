# template_app

Template for new Flutter project with DI, BloC, Hive etc.

## Getting Started

- Clear Architecture (Layers in different packages)
- Analyzer Layer with Pedantic 
- Dependency Injection (GetIt)
- BloC Statement Management
- Hive storage persistent data
- Fluro Navigation
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


Usability commands:

    Очистка проекта: flutter clean
    Получение пакетов: flutter pub get
    Обновление зависимостей: flutter packages upgrade
    Обновление до последних версий пакетов: flutter pub upgrade --major-versions

    Запуск кодогенерации: flutter packages pub run build_runner build
                          flutter pub run build_runner build --delete-conflicting-outputs

    Перегенерация файлов локализации: flutter gen-l10n
    Команда для запуска интеграционного теста: flutter drive --target=test_driver/app.dart

    Получение информации о версии Gradle (subDir: android): ./gradlew --version
    Получение ключей SHA1 и SHA256 из Gradle (subDir: android): ./gradlew signingReport
    Активизация Flutterfire CLI: dart pub global activate flutterfire_cli
    Конфигурирование проекта для firebase: flutterfire configure --project=<specific Proj Name>