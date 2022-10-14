//import 'package:json_serializable/json_serializable.dart';
//import 'package:build_runner/build_runner.dart';

class Hotel {
  String uuid;
  String name;
  String poster;

  //part 'hotel.g.dart';

  Hotel({required this.uuid, required this.name, required this.poster});

  Hotel.fromJson(Map<String, dynamic> json)
    :this(
      uuid: json['uuid'],
      name: json['name'],
      poster: json['poster'],
    );

}