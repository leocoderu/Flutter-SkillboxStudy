import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:block_sm/pages/cart_page.dart';
import 'package:block_sm/pages/home_page.dart';
import 'package:block_sm/pages/not_found_page.dart';
import 'package:block_sm/pages/settings_page.dart';
import 'package:business_sm/business_sm.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return BlocProvider(
        create: (_) => CounterBloc(),
        child: const HomePage(title: 'Product Store'),
    );
  });

  static Handler settingsHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const SettingsPage();
  });

  static Handler cartHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const CartPage();
  });

  // static Handler aboutHandler = Handler(handlerFunc: (context, Map<String, dynamic>? params) {
  //   //print(params);
  //   if (params != null && params.containsKey('uuid')) {
  //     return AboutPage(id: params['uuid'][0]);
  //   }
  //   return const AboutPage();
  // });

  // static Handler blogHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return const BlogPage();
  // });

  static void setupRouter(){
    router.define(HomePage.routeName, handler: homeHandler, transitionType: TransitionType.fadeIn);
    router.define(SettingsPage.routeName, handler: settingsHandler, transitionType: TransitionType.inFromRight);
    router.define(CartPage.routeName, handler: cartHandler, transitionType: TransitionType.fadeIn);

    //router.define(AboutPage.routeName, handler: aboutHandler, transitionType: TransitionType.inFromLeft);
    //router.define('${AboutPage.routeName}/:uuid', handler: aboutHandler);
    //router.define(BlogPage.routeName, handler: blogHandler, transitionType: TransitionType.cupertino);
    router.notFoundHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const NotFoundPage());
  }

}