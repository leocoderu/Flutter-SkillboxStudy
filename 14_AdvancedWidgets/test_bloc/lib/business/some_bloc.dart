import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/business/some_bloc_events.dart';
import 'package:test_bloc/model/some_data.dart';

class SomeBloc extends Bloc<SomeEvent, SomeData> {
  SomeBloc() : super(const SomeData(first: 0.0, text: '', count: 0, posts: [])) {
    on<ChangeFirst>((event, emit) => emit(state.copyWith(first: event.value)));
    on<ChangeText>((event, emit) => emit(state.copyWith(text: event.value)));
    on<ChangeCount>((event, emit) => emit(state.copyWith(count: event.value)));
    on<ChangeList>((event, emit) => emit(state.copyWith(posts: event.value)));
    on<ClearList>((event, emit) => emit(state.copyWith(posts: [])));
    on<AddToList>((event, emit) {
      List<String> tmpList = [...state.posts];
      tmpList.add(event.value);
      emit(state.copyWith(posts: tmpList));
    });
  }
}