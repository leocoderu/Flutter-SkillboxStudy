// Import Packages
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Theme {

  @HiveField(0)
  final int? id;

  Theme({this.id});

  Theme copyWith({int? counter}) => Theme(id: counter);

  @override
  String toString() => 'Theme ID is: $id';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Theme && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}