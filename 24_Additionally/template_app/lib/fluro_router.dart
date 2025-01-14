// Import Packages
import 'package:fluro/fluro.dart';

// Import Pages
import 'package:template_app/pages/home_page/home_page.dart';
import 'package:template_app/pages/settings_page/settings_page.dart';
import 'package:template_app/pages/unknown_page/unknown_page.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const HomePage());
  static Handler settingsHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const SettingsPage());

  static void setupRouter(){
    router.define(HomePage.routeName, handler: homeHandler); //, transitionType: TransitionType.fadeIn);
    router.define(SettingsPage.routeName, handler: settingsHandler, transitionType: TransitionType.inFromRight);
    router.notFoundHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const NotFoundPage());
  }
}