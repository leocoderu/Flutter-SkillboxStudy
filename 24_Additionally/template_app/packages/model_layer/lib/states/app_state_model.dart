import 'package:hive/hive.dart';

part 'app_state_model.g.dart';

@HiveType(typeId: 0)
class AppStateModel {

  @HiveField(0)
  final int? counter;

  @HiveField(1)
  final bool? switcher;

  @HiveField(2)
  final String?  text;

  AppStateModel({this.counter, this.switcher, this.text});

  AppStateModel copyWith({int? counter, bool? switcher, String? text}) =>
    AppStateModel(counter: counter, switcher: switcher, text: text);

  @override
  String toString() =>
      'AppState(counter: $counter, switcher: $switcher , text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppStateModel
        && other.counter == counter
        && other.switcher == switcher
        && other.text == text;
  }

  @override
  int get hashCode => counter.hashCode ^ switcher.hashCode ^ text.hashCode;
}