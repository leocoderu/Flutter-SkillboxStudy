import 'dart:async';

StreamController<String> controller = StreamController<String>.broadcast();
Stream stream = controller.stream;

void main() async {
  // Подписка на прослушивание событий
  StreamSubscription streamSubscription1 = stream.listen((value) {
    // ignore: avoid_print
    print(value);
  });

  // Подписка на прослушивание событий
  StreamSubscription streamSubscription2 = stream.listen((value) {
    // ignore: avoid_print
    print(value);
  });
  controller.add('event #1');
  controller.add('event #2');
  controller.add('event #3');
  controller.add('event #4');

  // Отмена подписки на потоки
  //streamSubscription.cancel();
}
