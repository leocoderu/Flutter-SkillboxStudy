import 'package:flutter/material.dart';

void main(List<String> arguments) {
  debugPrint('Start');

  getData(3).then((value) {
    // ignore:avoid_print
    print(value);
  }).catchError((error) {
    debugPrint('Error: $error');
  }).whenComplete(() => {
    debugPrint('Функция вызывается в любом случае')
  });

  debugPrint('End');
}

Future<List<String>> getData([int delay = 1]){
  return Future.delayed(Duration(seconds: delay), () {
    if (delay > 2) {
      return Future.error('Delay > 2');
    }
    return ['Superman', 'Batman', 'Flash', 'Tor'];
  });
}