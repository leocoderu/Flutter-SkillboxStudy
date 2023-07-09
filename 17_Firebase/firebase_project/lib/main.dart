// Import Flutter
import 'package:flutter/material.dart';

// Import Localizations
import 'package:firebase_project/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Import Packages
import 'package:firebase_project/fluro_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hive/hive.dart';
//import 'package:hive_flutter/hive_flutter.dart';

// Import Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/firebase_options.dart';

// Import Layers
import 'package:business_sm/business_sm.dart';
import 'package:model/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MyFluroRouter.setupRouter();
  setupServices();

  // Инициализация Hive была тут

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final _storeBox = Hive.box<AppStateModel>('store_box').get('summary_panel') != null
    //     ? Hive.box<AppStateModel>('store_box').get('summary_panel')!.summary_panel
    //     : true;

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => AppStateBloc()),
        ],
        child: BlocBuilder<AppStateBloc, AppStateModel>(
          builder: (context, state) {
            //context.read<AppStateBloc>().add(EnableSummaryPanel(summary_panel: _storeBox));
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
              initialRoute: '/',
              onGenerateRoute: MyFluroRouter.router.generator,
            );
          },
        ),
    );
  }
}
