import 'package:flutter/material.dart';

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

      body: ListView(
        children: [
          const ListTile(
            title: Text('System theme'),
          ),
          const ListTile(
            title: Text('Light theme'),
          ),
          const ListTile(
            title: Text('Dark theme'),
          ),
        ],
      ),
    );
  }
}
