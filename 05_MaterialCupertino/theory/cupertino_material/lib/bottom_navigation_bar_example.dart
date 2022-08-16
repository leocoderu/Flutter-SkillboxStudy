import 'package:flutter/material.dart';

class TabItem{
  String title;
  Icon icon;
  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar= [
  TabItem(title: "Photo",  icon: const Icon(Icons.home)),
  TabItem(title: "Chat",   icon: const Icon(Icons.chat)),
  TabItem(title: "Albums", icon: const Icon(Icons.album)),
];

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key : key);
  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

// Добавляет отступы сверху и снизу по интерфейсу телефона
class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      // ignore: avoid_print
      //print('Listener: ${_tabController.index}');
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar'),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.green,
            child: const Center(child: Text('1')),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(child: Text('2')),
          ),
          Container(
            color: Colors.purple,
            child: const Center(child: Text('3')),
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: [
          for(final item in _tabBar)
            BottomNavigationBarItem(
              label: item.title,
              icon: item.icon
            )
        ],
      ),
    );
  }
}
