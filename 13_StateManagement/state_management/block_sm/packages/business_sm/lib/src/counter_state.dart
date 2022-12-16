import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increase, decrease }

class CounterBloc extends Bloc<CounterEvent, int>{
  int value = 0;

  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case CounterEvent.increase:
          emit(++value);
          break;
        case CounterEvent.decrease:
          emit(--value);
          break;
        default: emit(value);
      }
    });
  }
}