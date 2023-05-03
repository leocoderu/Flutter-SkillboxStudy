import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:model/model.dart';

class PersonRepo {
  String _getImgUrl(int uid) =>
     "https://starwars-visualguide.com/assets/img/characters/$uid.jpg";

  Future<Person?> getPerson() async {
    int id = Random().nextInt(10)+1;
    var url = Uri.https('swapi.dev', '/api/people/$id/', {'q': '{http}'});

    http.Response response = await http.get(url);
    if(response.statusCode != 200) return null;

    Map<String, dynamic> singlePersonJson = jsonDecode(response.body);
    Person? result = Person.fromJson(singlePersonJson, id, _getImgUrl(id));
    return result;
  }
}