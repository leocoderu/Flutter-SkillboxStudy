// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:app_firebase_shop/consts/keys.dart';
import 'package:app_firebase_shop/consts/translations.dart';
import 'package:app_firebase_shop/services/service_auth/service_auth.dart';
import 'package:app_firebase_shop/ui/components/ui_text.dart';
import 'package:app_firebase_shop/ui/screens/screen_purchases/screen_purchases.dart';
import 'package:app_firebase_shop/ui/styles/themes.dart';

part 'components/ui_logo.dart';

class ScreenSignin extends StatelessWidget {
  const ScreenSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: signinSystemOverlayStyle,
        child: SafeArea(
          child: Center(
            child: StreamBuilder(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const UiLogo(),
                      ElevatedButton(
                        onPressed: GetIt.I.get<ServiceAuth>().signin,
                        child: UiText(
                          text: labelsButton[keyLogin]!,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                }

                return const ScreenPurchases();
              },
            ),
          ),
        ),
      ),
    );
  }
}
