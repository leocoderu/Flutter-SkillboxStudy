// Import Flutter
import 'package:flutter/material.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Import Widgets
import 'package:firebase_project/pages/home_page/widgets/summary_panel/widgets/info_container.dart';
import 'package:firebase_project/pages/home_page/widgets/summary_panel/widgets/costs_container.dart';

class SummaryPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 150,
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(color: Colors.black26, offset: Offset(0, -5),),
          const BoxShadow(color: Colors.white, spreadRadius: 5.0, blurRadius: 10.0,),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoContainer(title: AppLocalizations.of(context)!.home_sPanel_totalPurchase, count: 875,),
                Divider(),
                InfoContainer(title: AppLocalizations.of(context)!.home_sPanel_purchased, count: 814,),
                Divider(),
                InfoContainer(title: AppLocalizations.of(context)!.home_sPanel_left, count: 861,),
              ],
            ),
          ),
          SizedBox(width: 40,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CostsContainer(title: AppLocalizations.of(context)!.home_sPanel_totalCost, count: 8888983175),
                Divider(),
                CostsContainer(title: AppLocalizations.of(context)!.home_sPanel_spent, count: 9889656175.76),
              ],
            ),
          ),
        ],
      ),
    );
  }
}