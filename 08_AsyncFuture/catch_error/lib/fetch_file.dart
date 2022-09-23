import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) {
  if (assetsPath == 'assets/files/') {
    return Future.error('Empty path');
  }
  return rootBundle.loadString(assetsPath)
          .then((file) => file.toString())
          .catchError((error) {
            Future.error('File not found');
          });
}