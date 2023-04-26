// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:app_firebase_shop/blocs/bloc_purchases.dart';
import 'package:app_firebase_shop/blocs/bloc_purchases_event.dart';
import 'package:app_firebase_shop/blocs/bloc_purchases_state.dart';
import 'package:app_firebase_shop/consts/keys.dart';
import 'package:app_firebase_shop/consts/translations.dart';
import 'package:app_firebase_shop/models/api_purchase/api_purchase.dart';
import 'package:app_firebase_shop/ui/components/ui_data_empty.dart';
import 'package:app_firebase_shop/ui/components/ui_divider.dart';
import 'package:app_firebase_shop/ui/components/ui_drawer/ui_drawer.dart';
import 'package:app_firebase_shop/ui/components/ui_header.dart';
import 'package:app_firebase_shop/ui/components/ui_loader.dart';
import 'package:app_firebase_shop/ui/components/ui_text.dart';

part 'components/ui_purchase.dart';
part 'components/ui_purchases.dart';

class ScreenPurchases extends StatelessWidget {
  const ScreenPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPurchases, BlocPurchasesState>(
      builder: (_, state) => Scaffold(
        drawer: const UiDrawer(),
        appBar: UiHeader(title: labelsPurchases[keyTitle]!),
        body: SafeArea(
          child: state.when(
            loading: () => const UiLoader(),
            loaded: (purchases) => _UiPurchases(purchases: purchases),
            error: (error) => UiEmptyData(text: error),
          ),
        ),
      ),
    );
  }
}
