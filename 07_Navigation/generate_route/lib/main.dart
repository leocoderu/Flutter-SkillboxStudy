import 'package:flutter/material.dart';
import 'package:generate_route/pages/about_page.dart';
import 'package:generate_route/pages/blog_page.dart';
import 'package:generate_route/pages/home_page.dart';
import 'package:generate_route/pages/not_found_page.dart';

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
      onGenerateRoute: (RouteSettings  settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) => const HomePage());

          case AboutPage.routeName:
            final args = settings.arguments as Map<String, dynamic>?;
            //print(args);
            if(args != null && args.containsKey('id')) {
              return MaterialPageRoute(
                  fullscreenDialog: true,             // Вместо стрелки "Возврат" отображает "Крестик"
                  builder: (BuildContext context) {
                      return AboutPage(id: args['id']);
                  },
              );
            }
            return MaterialPageRoute(builder: (BuildContext context) {
              return const AboutPage();
            });

          // Со стандартной анимацией
          /*case BlogPage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return const BlogPage();
              },
            );*/

          // Обрабортка страницы с кастомной анимацией
          case BlogPage.routeName:
            return PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation1, Animation animation2){
              return const BlogPage();
            },
              transitionsBuilder: (
                  BuildContext context,
                  Animation<double> animation1,
                  Animation animation2,             //<--- TODO: Что с анимацией 2, почему мы ее не использовали???
                  child
              ){
                  CurvedAnimation curved = CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn,
                  );
                  Animation<double> animate = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
                  return ScaleTransition(
                    scale: animate,
                    child: FadeTransition(
                      opacity: animation1,
                      child: child,
                    ),
                  );
              }
            );
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
