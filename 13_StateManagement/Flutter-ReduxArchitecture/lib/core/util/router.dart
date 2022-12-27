import 'package:flutter/material.dart';
import 'package:reduxdemo/core/constant/page_route_constants.dart';
import 'package:reduxdemo/model/login/login_response.dart';
import 'package:reduxdemo/screens/home_screen.dart';
import 'package:reduxdemo/screens/login_screen.dart';
import 'package:reduxdemo/screens/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteConstants.home_screen:
        LoginResponse loginResponse = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  loginResponse: loginResponse,
                ));
      case PageRouteConstants.splash_screen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case PageRouteConstants.login_screen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
