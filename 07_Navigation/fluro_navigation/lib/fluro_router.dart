import 'package:fluro/fluro.dart';
import 'package:fluro_navigation/pages/about_page.dart';
import 'package:fluro_navigation/pages/blog_page.dart';
import 'package:fluro_navigation/pages/home_page.dart';
import 'package:fluro_navigation/pages/not_found_page.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const HomePage();
  });

  static Handler aboutHandler = Handler(handlerFunc: (context, Map<String, dynamic>? params) {
    //print(params);
    if (params != null && params.containsKey('uuid')) {
      return AboutPage(id: params['uuid'][0]);
    }
    return const AboutPage();
  });

  static Handler blogHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const BlogPage();
  });

  static void setupRouter(){
    router.define(HomePage.routeName, handler: homeHandler, transitionType: TransitionType.fadeIn);
    router.define(AboutPage.routeName, handler: aboutHandler, transitionType: TransitionType.inFromLeft);
    router.define('${AboutPage.routeName}/:uuid', handler: aboutHandler);
    router.define(BlogPage.routeName, handler: blogHandler, transitionType: TransitionType.cupertino);
    router.notFoundHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const NotFoundPage());
  }

}
