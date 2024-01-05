import 'dart:async';

class Model {
  int _cnt = 0;

  final StreamController<int> _streamController = StreamController<int>();

  Stream<int> get counterUpdates => _streamController.stream;

  void incrementCounter() {
    _cnt++;
    _streamController.add(_cnt);
  }
}