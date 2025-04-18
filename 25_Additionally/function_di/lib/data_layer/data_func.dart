// ignore_for_file: avoid_print

class DataFunc{
  // Future<void> runFunc() async {
  //   print('Start Mission');
  //   await Future<void>.delayed(const Duration(seconds: 5));
  //   print('Mission complete');
  // }
}

Future<List<dynamic>> heavyFunc(List<dynamic> args) async {
  print('Start Mission');
  await Future<void>.delayed(const Duration(seconds: 5));
  print('Mission complete');
  return [];
}