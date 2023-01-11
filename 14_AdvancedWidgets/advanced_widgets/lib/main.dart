import 'package:flutter/material.dart';

import 'package:advanced_widgets/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Widget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(title: 'Advanced Widgets'),
    );
  }
}

