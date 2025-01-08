abstract class ThemeState {}

class ChangeEvent extends ThemeState {
    final int? id;

    ChangeEvent({this.id});
}
