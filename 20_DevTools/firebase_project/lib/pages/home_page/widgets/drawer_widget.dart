import 'dart:io';

import 'package:flutter/material.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Layers
import 'package:business_sm/business_sm.dart';

class DrawerWidget extends StatelessWidget {
  final String photoURL;

  const DrawerWidget({super.key, required this.photoURL});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            //color: Colors.indigo,
            height: 200,
            child: CircleAvatar(
              maxRadius: 100,
              minRadius: 75,
              backgroundColor: Colors.indigo,
              backgroundImage: NetworkImage(photoURL),
              //child: Text('No Data'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await locator.get<AuthController>().logOut();
            },
            child: Text(AppLocalizations.of(context)!.butLogOut),
          ),
          Expanded(
            child: Container(
              //color: Colors.indigoAccent,
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () => exit(0),
              child: Text(AppLocalizations.of(context)!.butExit),
            ),
          ),
        ],
      ),
    );
  }
}
