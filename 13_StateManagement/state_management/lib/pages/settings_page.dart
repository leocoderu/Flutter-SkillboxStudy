import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'package:state_management/app_state.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

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
            onPressed: () {
              if(SchedulerBinding.instance.window.platformBrightness == Brightness.dark) {
                context.read<AppState>().setTheme(ThemeData.dark());
              } else {
                context.read<AppState>().setTheme(ThemeData.light());
              }
            },
            tooltip: 'System theme',
            icon: const Icon(Icons.sunny_snowing),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () {context.read<AppState>().setTheme(ThemeData.light());},
            tooltip: 'Light theme',
            icon: const Icon(Icons.sunny),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () {context.read<AppState>().setTheme(ThemeData.dark());},
            tooltip: 'Dark theme',
            icon: const Icon(Icons.nights_stay),
            iconSize: 100,
          ),
        ],
      ),
    );
  }
}
