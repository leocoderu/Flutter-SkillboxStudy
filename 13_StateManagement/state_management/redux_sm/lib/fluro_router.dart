//import 'package:business_sm/business_sm.dart';
//import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
//import 'package:redux/redux.dart';
//import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux_sm/pages/cart_page.dart';
import 'package:redux_sm/pages/home_page/home_page.dart';
import 'package:redux_sm/pages/home_page/home_page_connector.dart';
import 'package:redux_sm/pages/not_found_page.dart';
import 'package:redux_sm/pages/settings_page.dart';
//import 'package:business_sm/business_sm.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return HomePageConnector(title: 'Product Store');
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

