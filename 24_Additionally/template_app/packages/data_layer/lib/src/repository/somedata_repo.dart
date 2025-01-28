//import 'dart:convert';
import 'dart:isolate';

//import 'package:flutter/material.dart';
//import 'package:get_weather/model/weather.dart';
//import 'package:http/http.dart' as http;

void requestData(({String parameter, SendPort sendPort}) data) async {
  double res = 9934.434;
  //Weather? weather;

  // String api = 'https://api.weatherapi.com/v1/current.json';
  // String apikey = '92033b39736a46008c3100547243011';
  //
  // final weatherResponse = await http.get(Uri.parse('$api?key=$apikey&q=${data.city}&aqi=no'));
  // try {
  //   if (weatherResponse.statusCode == 200) {
  //     weather = Weather.fromJson(json.decode(weatherResponse.body));
  //   } else {
  //     debugPrint('error: ${weatherResponse.statusCode}');
  //   }
  // } catch (e) {
  //   debugPrint(e.toString());
  // }
  data.sendPort.send(res);
}

class SomeDataRepo {
  Future<void> getSomeData(String parameter, ReceivePort receiverPort) async {
    await Isolate.spawn(requestData, (parameter: parameter, sendPort:receiverPort.sendPort));
  }
}