import 'package:dart_ffi/ffi_bridge.dart';
import 'package:flutter/services.dart';
import 'package:dart_ffi/platform/service.dart';

class PlatformServicesImpl implements PlatformService {
  static const stream = EventChannel('CALL_EVENTS');
  final _bridge = FFIBridge();

  @override
  int getValue() {
    try {
      return _bridge.getCValue();
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to get value: ${e.message}.");
      return 0;
    }
  }

  @override
  Stream<int> getStream() => stream.receiveBroadcastStream().map((event) => event as int);
}