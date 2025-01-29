//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SettingsPage())),
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Timer is now:', style: TextStyle(fontSize: 30)),
            // StreamBuilder(
            //   stream: _stopwatch(),
            //   builder: (context, snapshot) {
            //     return (snapshot.connectionState == ConnectionState.active)
            //       ? Text(snapshot.data.toString(), style: const TextStyle(fontSize: 60))
            //       : const Text('--', style: TextStyle(fontSize: 60));
            //   }
            // ),
            Text('--', style: TextStyle(fontSize: 60)),
          ],
        ),
      ),
    );
  }
}
