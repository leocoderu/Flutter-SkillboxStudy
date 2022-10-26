import 'package:flutter/material.dart';

import 'package:hero_card/utils/generate_material_color.dart';
import 'package:hero_card/views/spaces_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Card Anime',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Colors.black54),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const SpacesPage(),
      },
    );
  }
}


