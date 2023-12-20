import 'package:flutter/services.dart';
import 'package:js_interop_app/platform/service.dart';

class PlatformServicesImpl implements PlatformService {
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
  Stream<int> getStream() => stream.receiveBroadcastStream().map((event) => event as int);
}