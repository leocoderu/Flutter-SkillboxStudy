// import 'dart:io';
// import 'package:flutter/foundation.dart';
//
// enum CustomPlatform {linux, macos, windows, ios, fuchsia, web, undefined}
//
// class AppPlatform {
//   static const Map<String, CustomPlatform> _platformMap = {
//     'linux': CustomPlatform.linux,
//     'macos': CustomPlatform.macos,
//     'windows': CustomPlatform.windows,
//     'ios': CustomPlatform.ios,
//     'fuchsia': CustomPlatform.fuchsia,
//   };
//
//   static CustomPlatform _getPlatform() {
//     if(kIsWeb) {
//       return CustomPlatform.web;
//     }
//     return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
//   }
//
//   static bool isMobile() => !kIsWeb;
//
//   static CustomPlatform get platform => _getPlatform();
// }

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