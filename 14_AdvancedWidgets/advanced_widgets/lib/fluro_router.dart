import 'package:fluro/fluro.dart';

import 'package:advanced_widgets/pages/home_page.dart';
import 'package:advanced_widgets/pages/not_found_page.dart';
import 'package:advanced_widgets/pages/settings_page.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const HomePage(title: 'Weather Forecast');
  });

  static Handler settingsHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const SettingsPage();
  });

  static void setupRouter(){
    router.define(HomePage.routeName, handler: homeHandler, transitionType: TransitionType.fadeIn);
    router.define(SettingsPage.routeName, handler: settingsHandler, transitionType: TransitionType.inFromRight);
    router.notFoundHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const NotFoundPage());
  }

}