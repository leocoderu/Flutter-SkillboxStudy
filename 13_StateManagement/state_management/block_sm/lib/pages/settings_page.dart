import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:business_sm/business_sm.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final ThemeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ThemeBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

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
            onPressed: () => bloc.action.add(ThemeEvent.system),
            tooltip: 'System theme',
            icon: const Icon(Icons.sunny_snowing),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () => bloc.action.add(ThemeEvent.light),
            tooltip: 'Light theme',
            icon: const Icon(Icons.sunny),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () => bloc.action.add(ThemeEvent.dark),
            tooltip: 'Dark theme',
            icon: const Icon(Icons.nights_stay),
            iconSize: 100,
          ),
        ],
      ),
    );
  }
}
