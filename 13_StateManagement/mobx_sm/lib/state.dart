import 'package:mobx/mobx.dart';

part 'state.g.dart';

class ExampleState = _ExampleState with _$ExampleState;

abstract class _ExampleState with Store {

  @observable
  int value = 0;

  @observable
  bool isLoaded = false;

  @action
  void increment(){
    value++;
  }

  @action
  void changeLoading(){
    isLoaded = !isLoaded;
  }
}