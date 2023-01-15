import 'package:advanced_widgets/components/group_box.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:business_sm/business_sm.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          GroupBox(
            //borderColor: Colors.black,
            borderWidth: 2.0,
            text: 'Выбор темы приложения',
            //textColor: Colors.black,
            child: Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
                  onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.system),
                  tooltip: 'System theme',
                  icon: const FaIcon(FontAwesomeIcons.yinYang),
                  iconSize: 50,
                ),
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.light),
                  tooltip: 'Light theme',
                  icon: const Icon(Icons.sunny),
                  iconSize: 50,
                ),
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.dark),
                  tooltip: 'Dark theme',
                  icon: const Icon(Icons.nights_stay),
                  iconSize: 50,
                ),
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.green),
                  tooltip: 'Green theme',
                  icon: const FaIcon(FontAwesomeIcons.leaf),
                  iconSize: 50,
                ),
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
                  onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.red),
                  tooltip: 'Red theme',
                  icon: const FaIcon(FontAwesomeIcons.fireFlameCurved),
                  iconSize: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
