// // Import Layers
// import 'package:business_layer/di/locator.dart';
// import 'package:data_layer/data_layer.dart';
//
// class LocalPinController {
//   Future<bool> checkPin(String value) async =>
//     await locator.get<LocalPin>().getLocalPin() == value;
//
//   Future<void> setPin(String value) async =>
//       await locator.get<LocalPin>().setLocalPin(value);
// }