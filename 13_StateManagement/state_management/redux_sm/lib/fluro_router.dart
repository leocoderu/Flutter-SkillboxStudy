import 'package:fluro/fluro.dart';

import 'package:redux_sm/pages/cart_page.dart';
import 'package:redux_sm/pages/home_page/home_page.dart';
import 'package:redux_sm/pages/home_page/home_page_connector.dart';
import 'package:redux_sm/pages/not_found_page.dart';
import 'package:redux_sm/pages/settings_page/settings_page.dart';
import 'package:redux_sm/pages/settings_page/settings_page_connector.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return HomePageConnector(title: 'Product Store');
  });

  static Handler settingsHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SettingsPageConnector();
  });

  static Handler cartHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const CartPage();
  });

  static void setupRouter(){
    router.define(HomePage.routeName, handler: homeHandler, transitionType: TransitionType.fadeIn);
    router.define(SettingsPage.routeName, handler: settingsHandler, transitionType: TransitionType.inFromRight);
    router.define(CartPage.routeName, handler: cartHandler, transitionType: TransitionType.fadeIn);
    router.notFoundHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const NotFoundPage());
  }
}

