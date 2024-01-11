// Model of Items

import 'package:hive/hive.dart';

part 'items.g.dart';

@HiveType(typeId: 1)
class Items {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int category;

  Items(this.id, this.name, this.category);
}