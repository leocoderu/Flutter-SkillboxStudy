const kName = 'name';
const kAmount = 'amount';

class Person {
  final String name;
  final int amount;

  Person({
    required this.name,
    required this.amount
  });

  factory Person.fromJson(Map<String, Object?> json) => Person(
    name: json['kName']! as String,
    amount: json['kAmount']! as int,
  );

  Map<String, Object?> toJson() => {kName: name, kAmount: amount};
}