# susanin

This is a simple Example of README.md file

###Add to example\android\app\src\main\AndroidManifest.xml
<manifest...>
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    ...
    <application...>
    ...
    </application>
</manifest>

###Change in example\android\app\src\build.gradle
android {
    compileSdkVersion 31
    defaultConfig {
        ...
        minSdkVersion 21
        targetSdkVersion 31
    }
}

###Add to example\android\app\src\build.gradle
dependencies {
    implementation 'com.yandex.android:maps.mobile:4.2.2-full'
}

###Add Key to example\android\app\src\main\java\com\unact\[appName]\MainActivity.java
####For Java:
public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        ...
        MapKitFactory.setApiKey("YOUR_API_KEY");
        ...
    }
}

###Add Key to example\android\app\src\main\kotlin\com.example.susanin\MainActivity.kt
####For Kotlin:
Add import:
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

Add override:
class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("YOUR_API_KEY") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}