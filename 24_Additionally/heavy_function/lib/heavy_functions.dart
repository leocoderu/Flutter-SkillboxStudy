import 'dart:math';

String exampleTask() {
  print('start heavy function');

  var total = 0.0;
  int iteration = 1230000000;
  int delta = Random().nextInt(200000000) - 100000000;

  for (var i = 0; i < iteration + delta; i++) {
    total += i;
  }

  print('stop heavy function');
  return total.toString();
}