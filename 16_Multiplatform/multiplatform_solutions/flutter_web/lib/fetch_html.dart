import 'package:http/http.dart' as http;

Future fetchHTML(String urlPath) async => await http.get(Uri.parse(urlPath));