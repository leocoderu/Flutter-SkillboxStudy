const kName = 'name';
const kAmount = 'amount';

class User {
  final String name;
  final int amount;

  User({
    required this.name,
    required this.amount
  });

  factory User.fromJson(Map<String, Object?> json) => User(
    name: json['kName']! as String,
    amount: json['kAmount']! as int,
  );

  Map<String, Object?> toJson() => {kName: name, kAmount: amount};
}