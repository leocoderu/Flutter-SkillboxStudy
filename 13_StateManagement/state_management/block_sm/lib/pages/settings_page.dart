import 'package:flutter/material.dart';

import 'package:business_sm/business_sm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.system),
            tooltip: 'System theme',
            icon: const Icon(Icons.sunny_snowing),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.light),
            tooltip: 'Light theme',
            icon: const Icon(Icons.sunny),
            iconSize: 100,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.dark),
            tooltip: 'Dark theme',
            icon: const Icon(Icons.nights_stay),
            iconSize: 100,
          ),
        ],
      ),
    );
  }
}
