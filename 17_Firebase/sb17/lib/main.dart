// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:app_firebase_shop/blocs/bloc_purchases.dart';
import 'package:app_firebase_shop/blocs/bloc_purchases_event.dart';
import 'package:app_firebase_shop/initialization.dart';
import 'package:app_firebase_shop/repositories/repository_purchases_imp.dart';
import 'package:app_firebase_shop/ui/components/ui_app.dart';
import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeServices();

  final repositoryPurchases = RepositoryPurchasesImp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BlocPurchases>(
          create: (_) => BlocPurchases(repo: repositoryPurchases)
            ..add(BlocPurchasesEventInit()),
        ),
      ],
      child: const UiApp(),
    ),
  );
}
