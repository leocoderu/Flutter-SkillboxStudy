// Model of Category

import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  Category(this.id, this.name);
}