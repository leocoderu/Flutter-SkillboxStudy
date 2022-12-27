import 'dart:io';

import 'helper.dart';

Future<bool> checkConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
      Helper.printLogValue('connected');
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    Helper.printLogValue('not connected');
    return false;
  }
}
