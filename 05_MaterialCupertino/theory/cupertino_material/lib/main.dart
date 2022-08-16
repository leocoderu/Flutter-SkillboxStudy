import 'package:flutter/material.dart';
//import 'package:cupertino_material/safe_area_example.dart';
//import 'package:cupertino_material/expended_example.dart';
//import 'package:cupertino_material/center_example.dart';
//import 'package:cupertino_material/align_example.dart';
//import 'package:cupertino_material/column_row_example.dart';
//import 'package:cupertino_material/scaffold_example.dart';
import 'package:cupertino_material/bottom_navigation_bar_example.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const SafeAreaExample(),
      //home: const ExpendedExample(),
      //home: const CenterExample(),
      //home: const AlignExample(),
      //home: const ColumnRowExample(),
      //home: const ScaffoldExample(),
      home: const BottomNavigationBarExample(),
    );
  }
}
