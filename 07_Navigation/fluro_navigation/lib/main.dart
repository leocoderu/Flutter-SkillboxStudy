import 'package:flutter/material.dart';
import 'package:fluro_navigation/fluro_router.dart';

void main() {
  MyFluroRouter.setupRouter();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluro Navigation',
      initialRoute: '/',
      /*onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => const NotFoundPage());
      },*/
      onGenerateRoute: MyFluroRouter.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
