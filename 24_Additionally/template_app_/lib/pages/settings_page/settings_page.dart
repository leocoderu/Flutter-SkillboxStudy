// Import Flutter
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: const Text('SettingsPage'),
        ),
      ),
    );
  }
}
