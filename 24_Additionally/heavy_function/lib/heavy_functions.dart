import 'dart:math';

double function1(int iteration) {
  var total = 0.0;
  int delta = Random().nextInt(200000000) - 100000000;

  for (var i = 0; i < iteration + delta; i++) {
    total += i;
  }
  return total;
}