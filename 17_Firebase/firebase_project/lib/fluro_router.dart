// Import Packages
import 'package:fluro/fluro.dart';

// Import Pages
import 'package:firebase_project/pages/main_page.dart';
import 'package:firebase_project/pages/home_page/home_page.dart';
import 'package:firebase_project/pages/auth_page/auth_page.dart';
import 'package:firebase_project/pages/settings_page/settings_page.dart';
import 'package:firebase_project/pages/unknown_page.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler mainHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return MainPage();
  });

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const HomePage();
  });

  static Handler authHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const AuthPage();
  });

  static Handler settingsHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const SettingsPage();
  });

  static void setupRouter(){
    router.define(MainPage.routeName, handler: mainHandler, transitionType: TransitionType.fadeIn);
    router.define(HomePage.routeName, handler: homeHandler, transitionType: TransitionType.fadeIn);
    router.define(AuthPage.routeName, handler: authHandler, transitionType: TransitionType.fadeIn);
    router.define(SettingsPage.routeName, handler: settingsHandler, transitionType: TransitionType.inFromRight);
    router.notFoundHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const NotFoundPage());
  }
}