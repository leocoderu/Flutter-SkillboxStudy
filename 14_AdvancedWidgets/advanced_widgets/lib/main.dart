import 'package:business_sm/business_sm.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:advanced_widgets/pages/home_page.dart';
import 'package:advanced_widgets/fluro_router.dart';
//import 'package:advanced_widgets/themes/theme_app.dart';

void main() {
  MyFluroRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => WeatherBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeData state) {
    return
      // ThemeApp(
      // theme: ModelTheme(brightness: state.brightness, primary: state.primarySwatch),
      // child:
      Builder(
        builder: (themeContext) => MaterialApp(
          title: 'Advanced Widget',
          theme: state,
          // ThemeData(
          //   brightness: ThemeApp.of(themeContext).brightness,
          //   primarySwatch: ThemeApp.of(themeContext).primary,
          // ),
          initialRoute: '/',
          onGenerateRoute: MyFluroRouter.router.generator,
        ),
      //),
    );
  }
}
