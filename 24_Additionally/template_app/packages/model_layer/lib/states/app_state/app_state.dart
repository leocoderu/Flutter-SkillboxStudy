// Import Packages
import 'package:hive/hive.dart';

part 'app_state.g.dart';

@HiveType(typeId: 0)
class AppState extends HiveObject {
  @HiveField(0)
  final bool? auth_local;

  @HiveField(1)
  final bool? auto_login;

  @HiveField(2)
  final int? counter;

  @HiveField(3)
  final bool? switcher;

  @HiveField(4)
  final String? text;

  AppState({this.auth_local, this.auto_login, this.counter, this.switcher, this.text});

  AppState copyWith({bool? auth_local, bool? auto_login, int? counter, bool? switcher, String? text}) =>
    AppState(auth_local: auth_local, auto_login: auto_login, counter: counter, switcher: switcher, text: text);

  @override
  String toString() =>
    'AppState(auth_local: $auth_local, auto_login:$auto_login, counter: $counter, switcher: $switcher , text: $text)';

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //
  //   return other is AppState
  //       && other.counter == counter
  //       && other.switcher == switcher
  //       && other.text == text;
  // }
  //
  // @override
  // int get hashCode => counter.hashCode ^ switcher.hashCode ^ text.hashCode;
}