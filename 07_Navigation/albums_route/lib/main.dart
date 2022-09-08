import 'package:flutter/material.dart';
import 'package:albums_route/pages/home_page.dart';
import 'package:albums_route/pages/not_found_page.dart';
import 'package:albums_route/pages/artist_page.dart';
import 'package:albums_route/pages/artist_detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => const NotFoundPage());
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name){
          case HomePage.namePage:
            return MaterialPageRoute(builder: (BuildContext context) => const HomePage());

          case ArtistPage.namePage:
            final args = settings.arguments as Map<String, dynamic>?;
            if(args != null && args.containsKey('title')){
              return MaterialPageRoute(builder: (BuildContext context) => ArtistDetailPage(title: args['title'], about: args['about']));
            }
            return MaterialPageRoute(builder: (BuildContext context) => const ArtistPage());

          default:
            return MaterialPageRoute(builder: (BuildContext context) => const NotFoundPage());
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}