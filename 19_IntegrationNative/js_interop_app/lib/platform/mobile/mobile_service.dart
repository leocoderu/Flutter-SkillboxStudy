import 'package:flutter/services.dart';

class PlatformServices {
  static const platform = MethodChannel('CALL_METHOD');
  static const stream = EventChannel('CALL_EVENTS');

  Future<int> getValue() async {
    try {
      return await platform.invokeMethod('CALL');
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to get value: ${e.message}.");
      return 0;
    }
  }

  Stream<int> getStream() => stream.receiveBroadcastStream().map((event) => event as int);
}