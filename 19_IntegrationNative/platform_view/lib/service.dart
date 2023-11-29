import 'package:flutter/services.dart';

class PlatformServices {
  static const method = MethodChannel('CALL_METHOD');
  static const stream = EventChannel('CALL_EVENTS');

  Future<int> callMethodChannel() async {
    try {
      return await method.invokeMethod('CALL');
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to get value: ${e.message}.");
      return 0;
    }
  }

  Stream<int> callEventChannel() => stream.receiveBroadcastStream().map((event) => event as int);
}