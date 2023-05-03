import 'package:business/di/locator.dart';
import 'package:model/model.dart';
import 'package:data/data.dart';

class PersonController {
  Future<Person?> getNextPerson() async {
    // TODO 6: Call the Repository and receive a Person
    return locator.get<PersonRepo>().getPerson();
  }
}