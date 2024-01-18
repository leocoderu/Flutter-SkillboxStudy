// Model of User

class User {
  int id;               // Идентификатор
  String name;          // Имя
  String? soname;       // Фамилия
  String? s_name;       // Отчество
  DateTime? dateBirth;  // Дата рождения
  String? photo;        // Путь к сохраненному фото
  String? phone;        // Номер телефона
  String? card;         // Номер кредитной карты

  User({
    required this.id,
    required this.name,
    this.soname,
    this.s_name,
    this.dateBirth,
    this.photo,
    this.phone,
    this.card,
  });

  User copyWith({
    int? id,
    String? name,
    String? soname,
    String? s_name,
    DateTime? dateBirth,
    String? photo,
    String? phone,
    String? card,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      soname: soname ?? this.soname,
      s_name: s_name ?? this.s_name,
      dateBirth: dateBirth ?? this.dateBirth,
      photo: photo ?? this.photo,
      phone: phone ?? this.phone,
      card: card ?? this.card,
    );
  }

  @override
  String toString() => 'User(index: $id, name: $name, soname: $soname, second name: $s_name, '
      'date of birth: ${dateBirth.toString()}, photo: ${photo == null || photo!.isEmpty  ? '[empty]' : '[present]'},'
      'phone: $phone, card number: ${card == null || card!.isEmpty ? '[no number]' : '[************]'})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id && other.name == name && other.soname == soname &&
      other.s_name == s_name && other.dateBirth == dateBirth && other.photo == photo &&
      other.phone == phone && other.card == card;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ soname.hashCode ^ s_name.hashCode ^ dateBirth.hashCode ^
    photo.hashCode ^ phone.hashCode ^ card.hashCode;
}