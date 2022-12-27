import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  final ThemeData theme;
  final VoidCallback press_dark;
  final VoidCallback press_light;
  final VoidCallback press_system;


  const SettingsPage({
    super.key,
    required this.theme,
    required this.press_dark,
    required this.press_light,
    required this.press_system,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),

      body: Row(
        children: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: press_system,
            tooltip: 'System theme',
            icon: const Icon(Icons.sunny_snowing),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: press_light,
            tooltip: 'Light theme',
            icon: const Icon(Icons.sunny),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: press_dark,
            tooltip: 'Dark theme',
            icon: const Icon(Icons.nights_stay),
            iconSize: 100,
          ),
        ],
      ),
    );
  }
}
