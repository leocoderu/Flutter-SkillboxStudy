// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Project imports:
import 'package:app_firebase_shop/consts/keys.dart';
import 'package:app_firebase_shop/consts/routes.dart';
import 'package:app_firebase_shop/consts/translations.dart';
import 'package:app_firebase_shop/models/app_drawer_item.dart';
import 'package:app_firebase_shop/ui/components/ui_divider.dart';
import 'package:app_firebase_shop/ui/components/ui_text.dart';

part 'components/ui_avatar.dart';
part 'components/ui_tile.dart';

class UiDrawer extends StatelessWidget {
  const UiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            _UiAvatar(),
            const UiDivider(paddingX: 16),
            Expanded(
              child: Column(
                children: [
                  _UiTile(
                    item: AppDrawerItem(
                      route: routePurchases,
                      title: labelsPurchases[keyTitle]!,
                      iconData: Icons.list_alt,
                    ),
                  ),
                ],
              ),
            ),
            const UiDivider(paddingX: 16),
            _UiTile(
              item: AppDrawerItem(
                route: '',
                title: labelsButton[keyLogout]!,
                iconData: Icons.logout_outlined,
                onTap: FirebaseAuth.instance.signOut,
              ),
              withoutArrow: true,
            ),
          ],
        ),
      ),
    );
  }
}
