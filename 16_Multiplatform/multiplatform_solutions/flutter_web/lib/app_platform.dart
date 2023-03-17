import 'dart:io';
import 'package:flutter/foundation.dart';

class AppPlatform {
  static String getPlatform() {
    if (kIsWeb) return 'WEB';
    if (Platform.isAndroid) return 'ANDROID';
    if (Platform.isIOS) return 'IOS';
    if (Platform.isLinux) return 'LINUX';
    if (Platform.isMacOS) return 'MACOS';
    if (Platform.isWindows) return 'WINDOWS';
    if (Platform.isFuchsia) return 'FUCHSIA';
    return 'UNDEFINED';
  }
  static bool get isMobile => getPlatform() == 'IOS' || getPlatform() == 'ANDROID';
}
