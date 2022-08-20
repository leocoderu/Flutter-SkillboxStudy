import 'package:flutter/material.dart';
//import 'package:layouts_example/example_list_grid.dart';
//import 'package:layouts_example/keep_alive_example.dart';
//import 'package:layouts_example/custom_scroll_view_example.dart';
import 'package:layouts_example/layout_builder_example.dart';
//import 'package:layouts_example/stack_example.dart';
//import 'package:layouts_example/aspect_example.dart';
//import 'package:layouts_example/intrinsic_example.dart';
//import 'package:layouts_example/gesture_example.dart';
//import 'package:layouts_example/pageview_example.dart';

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
      //home: const SingleChildScrollViewExample(),
      //home: const ListGridExample(),
      //home: const KeepAliveExample(),
      //home: const CustomScrollViewExample(),
      home: const LayoutBuilderExample(),
      //home: const StackExample(),
      //home: const AspectExample(),
      //home: const IntrinsicExample(),
      //home: const GestureExample(),
      //home: const PageViewExample(),
    );
  }
}