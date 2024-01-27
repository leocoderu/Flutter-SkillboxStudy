import 'package:model/model.dart';

class FullUser extends User {
  FullUser({
    this.card_num,
    required super.id,
    required super.name,
    super.soname,
    super.s_name,
    super.photo,
    super.dateBirth,
    super.phone,
    super.card,
  });
  String? card_num;
}