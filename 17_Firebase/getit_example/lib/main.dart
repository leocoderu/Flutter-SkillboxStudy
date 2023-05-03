import 'package:flutter/material.dart';

import 'package:business/business.dart';
import 'package:getit_example/pages/home_page.dart';

void main() {
  // TODO 4: Call the setup method to initialize the services
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageView(),
    );
  }
}

