void main() async {
  // ignore: avoid_print
  print('start');

  // Подписка на поток
  // intStream(5).listen((value) {
  //   // ignore: avoid_print
  //   print(value);
  // });

  // Ожидает выполнение всего потока
  var stream = intStream(5).where((value) => value > 2);
  await for (var item in stream){
    // ignore: avoid_print
    print(item);
  }

  // ignore: avoid_print
  print('finish');
}

Stream<int> intStream(count) async* {
  for (var i = 0; i < count; i++){
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
