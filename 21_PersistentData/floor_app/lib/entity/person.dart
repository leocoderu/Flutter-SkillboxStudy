import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  int id;

  String name;

  Person({required this.id, required this.name});
}