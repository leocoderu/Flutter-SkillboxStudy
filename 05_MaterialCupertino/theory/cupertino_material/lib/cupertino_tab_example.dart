//import 'dart:ui';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';

class Nav{
  final String title;
  final IconData icon;
  Nav({required this.icon, required this.title});
}

final tabBar = [
  Nav(title: "Photo",  icon: CupertinoIcons.home),
  Nav(title: "Files",  icon: CupertinoIcons.folder),
  Nav(title: "Emails",  icon: CupertinoIcons.mail),
];

class CupertinoTabExample extends StatefulWidget {
  const CupertinoTabExample({Key? key}) : super(key : key);
  @override
  State<CupertinoTabExample> createState() => _CupertinoTabExampleState();
}

class _CupertinoTabExampleState extends State<CupertinoTabExample> with SingleTickerProviderStateMixin{
  final CupertinoTabController controller = CupertinoTabController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // ignore: avoid_print
      print(controller.index);
    });
  }

  @override
  Widget build(BuildContext context){
    return CupertinoTabScaffold(
      controller: controller,
      tabBuilder: (BuildContext context, int index){
        return CupertinoTabView(
          builder: (BuildContext context){
            switch (index) {
              case 0:
                return const HomeView();
              case 1:
                return FilesView(controller: controller);
              case 2:
                return const EmailsView();
              default:
                return const HomeView();
            }
          },
        );
      },
      tabBar: CupertinoTabBar(
        items: [
          for (final item in tabBar)
            BottomNavigationBarItem(
              label: item.title,
              icon: Icon(item.icon)
            )
        ],
      ),
    );
  }
}

class HomeView extends StatelessWidget{
  const HomeView({Key? key}) : super(key : key);
  @override
  Widget build(BuildContext context){
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home nav bar'),
      ),
      child: Center(
        child: Text('Home'),
      )
    );
  }
}

class FilesView extends StatelessWidget {
  const FilesView({Key? key, this.controller}) : super(key : key);
  final CupertinoTabController? controller;

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Files nav bar'),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Files'),
                const SizedBox(height: 12),
                CupertinoButton.filled(
                    child: const Text('Go to Emails tab'),
                    onPressed: () {
                      controller?.index = 2;
                    }
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class EmailsView extends StatelessWidget {
  const EmailsView({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context){
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Emails nav bar'),
      ),
      child: Center(
        child: Text('Emails'),
      ),
    );
  }
}
