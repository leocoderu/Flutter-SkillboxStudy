import 'package:flutter/material.dart';
import 'package:automatic_keep_alive_client_mixin/tabbar_1.dart';
import 'package:automatic_keep_alive_client_mixin/tabbar_2.dart';

class AliveMixinDemo extends StatefulWidget {
  const AliveMixinDemo({Key? key}) : super(key: key);

  @override
  State<AliveMixinDemo> createState() => _AliveMixinDemoState();
}

class _AliveMixinDemoState extends State<AliveMixinDemo> {
  final PageController controller = PageController();  /// initializing controller for PageView

  int currentIndex = 0;
  final tabPages = [
    const Tabbar1(),
    const Tabbar2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(        /// Wrapping the tabs with PageView
        controller: controller,
        children: tabPages,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;     /// Switching bottom tabs
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          controller.jumpToPage(index);    /// Switching the PageView tabs
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Text("1"), label: "Tab"),
          BottomNavigationBarItem(icon: Text("2"), label: "Tab"),
        ],
      ),
    );
  }
}