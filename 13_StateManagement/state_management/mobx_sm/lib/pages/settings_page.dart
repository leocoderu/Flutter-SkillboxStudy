import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'package:business_sm/business_sm.dart';

ThemeData getSystem() =>
    (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),

      body: Row(
        children: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () => state.changeTheme(getSystem()),
            tooltip: 'System theme',
            icon: const Icon(Icons.sunny_snowing),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () => state.changeTheme(ThemeData.light()),
            tooltip: 'Light theme',
            icon: const Icon(Icons.sunny),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () => state.changeTheme(ThemeData.dark()),
            tooltip: 'Dark theme',
            icon: const Icon(Icons.nights_stay),
            iconSize: 100,
          ),
        ],
      ),
    );
  }
}
