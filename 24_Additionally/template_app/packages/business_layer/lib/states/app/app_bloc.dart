// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Layers
import 'package:model_layer/model_layer.dart';
import 'package:business_layer/business_layer.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(locator.get<AppStateController>().getAppState()) {
    on<IncCounter>((event, emit) async {
      final counter = await locator.get<AppStateController>().getCounter().then((value) => value + 1);
      emit(state.copyWith(counter: counter));
      locator.get<AppStateController>().setCounter(counter);
    });
    on<DecCounter>((event, emit) async {
      final counter = await locator.get<AppStateController>().getCounter().then((value) => value - 1);
      emit(state.copyWith(counter: counter));
      locator.get<AppStateController>().setCounter(counter);
    });
    on<ChangeAuthLocal>((event, emit) async {
      emit(state.copyWith(auth_local: event.value));
      locator.get<AppStateController>().setAuthLocal(event.value);
    });
    on<ChangeAutoLogin>((event, emit) async {
      emit(state.copyWith(auto_login: event.value));
      locator.get<AppStateController>().setAutoLogin(event.value);
    });
  }
}