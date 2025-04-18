import 'package:shared_preferences/shared_preferences.dart';

Future<bool> readData(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}

void saveData(String key, bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, data);
}