import 'dart:math';

Future<List<dynamic>> heavyFunction1(List<dynamic> args) async {
  double total = 0.0;
  int delta = Random().nextInt(200000000) - 100000000;
  bool res = Random().nextBool();

  //print('${DateTime.timestamp()} start: ${args[0] + delta}');
  for (int i = 0; i < (args[0] + delta); i++) {total += i;}
  //print('${DateTime.timestamp()} stop');

  return [total, res];
}

Future<List<dynamic>> heavyFunction2(List<dynamic> args) async {
  double total = 0.0;
  int delta = Random().nextInt(200000000) - 100000000;
  bool res = Random().nextBool();

  for (var i = 0; i < args[0] + delta; i++) {total += i;}

  return ['${args[1]} = ${total.toString()}', res];
}

Future<List<dynamic>> heavyFunction3(List<dynamic> args) async {
  await Future<void>.delayed(const Duration(seconds: 7));
  bool res = Random().nextBool();

  return [args[0] * args[1], res];
}