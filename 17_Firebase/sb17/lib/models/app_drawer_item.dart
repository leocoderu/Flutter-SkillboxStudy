// Flutter imports:
import 'package:flutter/material.dart';

class AppDrawerItem {
  final String route, title;
  final IconData iconData;
  final VoidCallback? onTap;

  const AppDrawerItem({
    required this.route,
    required this.title,
    required this.iconData,
    this.onTap,
  });
}
