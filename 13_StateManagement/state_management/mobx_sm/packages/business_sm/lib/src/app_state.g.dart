// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  late final _$valueAtom = Atom(name: '_AppState.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$themeAtom = Atom(name: '_AppState.theme', context: context);

  @override
  ThemeData get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeData value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$isLoadedAtom =
      Atom(name: '_AppState.isLoaded', context: context);

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
    });
  }

  late final _$_AppStateActionController =
      ActionController(name: '_AppState', context: context);

  @override
  void increment() {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.increment');
    try {
      return super.increment();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.decrement');
    try {
      return super.decrement();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme(ThemeData themeData) {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.changeTheme');
    try {
      return super.changeTheme(themeData);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_AppStateActionController.startAction(
        name: '_AppState.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
theme: ${theme},
isLoaded: ${isLoaded}
    ''';
  }
}
