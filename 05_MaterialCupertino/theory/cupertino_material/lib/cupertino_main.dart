import 'package:flutter/cupertino.dart';
import 'package:cupertino_material/cupertino_tab_example.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      //home: CupertinoExample(),
      home: CupertinoTabExample(),
    );
  }
}
