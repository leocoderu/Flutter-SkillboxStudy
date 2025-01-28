import 'package:flutter_bloc/flutter_bloc.dart';

import '../switch_model.dart';
import 'sw_event.dart';

class SwBloc extends Bloc<SwEvent, SwitchModel> {
  SwBloc() : super(SwitchModel()) {
    on<SetPosition>((event, emit) {
      emit(state.copyWith(position: event.switchPosition));
    });

    on<SetPrevious>((event, emit) {
      emit(state.copyWith(previous: event.previousPosition));
    });

    on<SetTimeout>((event, emit) {
      emit(state.copyWith(timeout: event.timeout));
    });
  }
}