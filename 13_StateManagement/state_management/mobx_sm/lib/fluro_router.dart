import 'package:fluro/fluro.dart';

import 'package:mobx_sm/pages/cart_page.dart';
import 'package:mobx_sm/pages/home_page.dart';

import 'package:mobx_sm/pages/not_found_page.dart';
import 'package:mobx_sm/pages/settings_page.dart';


class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return HomePage(title: 'Product Store');
  });

  static Handler settingsHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SettingsPage();
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

