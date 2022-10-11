class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User({required this.id, required this.name, required this.username, required this.email});

  User.fromJson(Map<String, dynamic> json)
      : this(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email']
      );
}