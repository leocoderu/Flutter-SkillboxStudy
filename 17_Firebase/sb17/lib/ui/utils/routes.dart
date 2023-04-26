// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_firebase_shop/consts/routes.dart';
import 'package:app_firebase_shop/ui/screens/screen_not_found.dart';
import 'package:app_firebase_shop/ui/screens/screen_purchases/screen_purchases.dart';
import 'package:app_firebase_shop/ui/screens/screen_signin/screen_signin.dart';

Route<dynamic> generateRoute(RouteSettings settings) => MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        switch (settings.name) {
          case routeSignin:
            return const ScreenSignin();

          case routePurchases:
            return const ScreenPurchases();

          default:
            return const ScreenNotFound();
        }
      },
    );
