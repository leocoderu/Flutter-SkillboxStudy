// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
//import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';

// Import Localizations
import '../l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Import Navigation
import '../fluro_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // ThemeData _getTheme(int id) {
  //   final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  //   switch (id) {
  //     case 1:
  //       return ThemeData.light();
  //     case 2:
  //       return ThemeData.dark();
  //     default:
  //       return brightness == Brightness.light ? ThemeData.light() : ThemeData.dark();
  //   }
  // }

  // ThemeMode _getThemeMode(int id) {
  //   final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  //   switch (id) {
  //     case 1:
  //       return ThemeMode.light;
  //     case 2:
  //       return ThemeMode.dark;
  //     default:
  //       return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
      builder: (BuildContext ctx, DefaultTheme state) {
        print('MainPage: theme mode is: ${locator.get<ThemeController>().get()}');
        return MaterialApp(
          title: 'Template Application',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: locator.get<ThemeController>().get(),
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          initialRoute: '/',
          onGenerateRoute: MyFluroRouter.router.generator,
        );
      },
    );
  }
}
