import 'package:flutter/cupertino.dart';
import 'package:cupertino_navigation/cupertino_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertino Route',
      home: CupertinoRoute(),
    );
  }
}