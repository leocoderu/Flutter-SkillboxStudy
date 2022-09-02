import 'package:flutter/material.dart';
import 'package:named_navigation/pages/about_page.dart';
import 'package:named_navigation/pages/blog_page.dart';
import 'package:named_navigation/pages/home_page.dart';
import 'package:named_navigation/pages/not_found_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Navigation',
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => const NotFoundPage());
      },
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/about': (BuildContext context) => const AboutPage(),
        '/blog': (BuildContext context) => const BlogPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const NamedNavigation(),
    );
  }
}
