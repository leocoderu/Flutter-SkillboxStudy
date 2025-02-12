import 'dart:math';

import 'package:flutter/material.dart';

Future<dynamic> heavyFunction1(List<dynamic> args) async {
  debugPrint('heavyFunction1');

  double total = 0.0;
  int delta = Random().nextInt(200000000) - 100000000;

  for (var i = 0; i < args[0] + delta; i++) {
    total += i;
  }

  return total;
}

dynamic heavyFunction2(List<dynamic> args) {
  debugPrint('heavyFunction2');

  double total = 0.0;
  int delta = Random().nextInt(200000000) - 100000000;

  for (var i = 0; i < args[0] + delta; i++) {
    total += i;
  }
  return '${args[1]} = ${total.toString()}';
}

Future<dynamic> heavyFunction3(List<dynamic> args) async {
  debugPrint('heavyFunction3');

  await Future.delayed(const Duration(seconds: 4));
  return args[0] * args[1];
}