// Import Packages
import 'package:hive/hive.dart';

//part 'counter.g.dart';

@HiveType(typeId: 1)
class Counter {

  @HiveField(0)
  final int? counter;

  Counter({this.counter});

  Counter copyWith({int? counter}) => Counter(counter: counter);

  @override
  String toString() => 'CounterState(counter: $counter)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Counter && other.counter == counter;
  }

  @override
  int get hashCode => counter.hashCode;
}