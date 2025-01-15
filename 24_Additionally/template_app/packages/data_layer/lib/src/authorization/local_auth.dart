// // Import Flutter
// import 'package:flutter/material.dart';
//
// // Import Packages
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_darwin/local_auth_darwin.dart';
//
// class LocalAuth {
//   final _auth = LocalAuthentication();
//   Future<bool> _canAuthenticate() async =>
//       await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
//
//   Future<bool> checkBio() async {
//     final List<BiometricType> availableBiometrics = await _auth.getAvailableBiometrics();
//     return await _canAuthenticate() && availableBiometrics.isNotEmpty;
//   }
//
//   Future<bool> authenticate(String signInTitle, String cancelButton, String localizedReason) async {
//     try {
//       if (!await _canAuthenticate()) return false;
//
//       return await _auth.authenticate(
//         authMessages: [
//           AndroidAuthMessages(
//             signInTitle: signInTitle,
//             cancelButton: cancelButton,
//           ),
//           IOSAuthMessages(
//             cancelButton: cancelButton,
//           ),
//         ],
//         localizedReason: localizedReason,
//         options: const AuthenticationOptions(
//           useErrorDialogs: true,
//           stickyAuth: false,
//           sensitiveTransaction: true,
//           biometricOnly: true,
//         ),
//       );
//     } catch (e) {
//       debugPrint('error: $e');
//       return false;
//     }
//   }
// }