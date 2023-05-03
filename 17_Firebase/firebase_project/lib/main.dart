// Import Flutter
import 'package:flutter/material.dart';

// Import Localizations
import 'package:firebase_project/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Import Packages
import 'package:firebase_project/fluro_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import Layers
import 'package:business_sm/business_sm.dart';
import 'package:firebase_project/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MyFluroRouter.setupRouter();
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProductBloc()),
          BlocProvider(create: (_) => UserBloc()),
        ],
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (_, snapshot) {
            return MaterialApp(
                    title: 'Something Store',
                    theme: ThemeData(primarySwatch: Colors.blue),
                    supportedLocales: L10n.all,
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    initialRoute: snapshot.hasData ? '/' : '/auth',
                    onGenerateRoute: MyFluroRouter.router.generator,
                  );
          },
        ),
    );
  }
}
