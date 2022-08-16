import 'package:flutter/material.dart';

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key}) : super(key : key);
  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

// Добавляет отступы сверху и снизу по интерфейсу телефона
class _ScaffoldExampleState extends State<ScaffoldExample>{
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void toggleBottomSheet() {
    if(_controller == null){
      _controller = scaffoldKey.currentState?.showBottomSheet(
              (context) => Container(
                color: Colors.deepOrange,
                height: 200,
                child: const Center(
                  child: Text('BOTTOM SHEET'),
                ),
              ),
      );
    } else {
      _controller?.close();
      _controller = null;
    }
  }

  void openDrawer(){
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        title: const Text('App Bar Title'),
        centerTitle: false,
        actions: [
          Builder(builder: (context) =>
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          Builder(builder: (context) =>
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
          )
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.green,
                  backgroundImage: NetworkImage('https://i.pinimg.com/200x150/36/ad/0e/36ad0e036efa1dd0697d6a33707fce8e.jpg'),
                  //child: Text('SH'),
                )
            ),
            const ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: const Text('Favorite'),
              leading: const Icon(Icons.favorite),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // ignore: avoid_print
                print('TAP');
              },
              onLongPress: () {
                // ignore: avoid_print
                print('LONG PRESS');
              },
            ),
          ],
        ),
      ),

      endDrawer: const Drawer(
        child: Center(
          child: Text('END DRAWER'),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: openDrawer, //openDrawer,
              child: const Text('Open Drawer'),
            )
          ],
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   elevation: 10,
      //   notchMargin: 8,
      //   clipBehavior: Clip.antiAlias,
      //   child: BottomNavigationBar(
      //     elevation: 10,     // Тень под BottomNavigationBar
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite),
      //         label: "Favorite",
      //       ),
      //     ]
      //   ),
      // ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Open'),
        onPressed: toggleBottomSheet,
      ),

      // Панель для доббавления дополнительных действий
      // bottomSheet: BottomSheet(
      //   //animationController: bottomController,
      //   builder: (context) => Container(
      //     color: Colors.greenAccent,
      //     height: 200,
      //     child: const Center(
      //       child: Text('BOTTOM SHEET'),
      //     ),
      //   ),
      //   onClosing: () {},
      // ),
    );
  }
}
