// Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Layers
import 'package:model_layer/model_layer.dart';

import 'app_state_events.dart';

class AppStateBloc extends Bloc<AppState, AppStateModel>{
  AppStateBloc() : super(AppStateModel(counter: 0, switcher: false, text: '')){
     on<IncreaseCounter>((event, emit) => emit(state.counter);
     on<SetCounter>((event, emit) => emit(state.copyWith(counter: event.counter)));
  }
}