import 'dart:async';

enum CounterEvent { increase, decrease }

class CounterBloc {
  int value = 0;

  final _stateController = StreamController<int>();
  final _eventsController = StreamController<CounterEvent>();

  Stream<int> get state => _stateController.stream;

  Sink<CounterEvent> get action => _eventsController.sink;

  CounterBloc(){
    _eventsController.stream.listen(_handleEvent);
  }

  void _handleEvent(CounterEvent action) async {
    switch (action) {
      case CounterEvent.increase:
        value++;
        break;
      case CounterEvent.decrease:
        value--;
        break;
      default:
        break;
    }
    _stateController.add(value);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }
}