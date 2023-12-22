import 'package:flutter/services.dart';
import 'package:native_string/platform/service.dart';

class PlatformServiceImpl implements PlatformService {
  static const platform = MethodChannel('CALL_METHOD');
  static const stream = EventChannel('CALL_EVENTS');

  @override
  Future<int> getValue() async {
    try {
      return await platform.invokeMethod('CALL');
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to get value: ${e.message}.");
      return 0;
    }
  }

  @override
  Future<String> sendString(String data) async {
    try {
      return await platform.invokeMethod('SOME_METHOD', {'key': data});
    } catch (e) {
      // ignore: avoid_print
      print("An error occurred while sending data to Kotlin: $e");
      return "Error of transfer data trow platform";
    }
  }

  @override
  Stream<String> getStream() => stream.receiveBroadcastStream().map((event) => event as String);  //!!! int
}