import 'package:flutter/material.dart';
import 'package:material_cupertino/data_img.dart';

const String photoLink='https://i.pinimg.com/200x150/36/ad/0e/36ad0e036efa1dd0697d6a33707fce8e.jpg';

class TabItem{
  String title;
  Icon icon;
  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: 'Photo', icon: const Icon(Icons.home)),
  TabItem(title: 'Chat', icon: const Icon(Icons.chat)),
  TabItem(title: 'Albums', icon: const Icon(Icons.album)),
];

class MaterialExample extends StatefulWidget {
  const MaterialExample({Key? key}) : super(key: key);
  @override
  State<MaterialExample> createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<MaterialExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void toggleBottomSheet() {
    if(_controller == null){
      _controller = scaffoldKey.currentState?.showBottomSheet(
        (context) => SizedBox(
          //color: Colors.white,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: const [
                ListTile(
                  title: Text('Сумма'),
                  leading: Icon(Icons.credit_card),
                  trailing: Text('200 руб'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Оплатить'),
                ),
              ]
            ),
          )
        ),
      );
    } else {
      _controller?.close();
      _controller = null;
    }
  }

  void _toggleBottomSheet(context){
    showModalBottomSheet(context: context, builder: (BuildContext bc) {
    return SizedBox(
      //color: Colors.white,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
              children: const [
                ListTile(
                  title: Text('Сумма'),
                  leading: Icon(Icons.credit_card),
                  trailing: Text('200 руб'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Оплатить'),
                ),
              ]
          ),
        )
    );
    });
  }

  void openDrawer(){
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        title: const Text('App with Material Style'),
        centerTitle: true,
        actions: [
          Builder(builder: (context) =>
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          )
        ],
      ),

      drawer: Drawer(
        //backgroundColor: Colors.blue,
        semanticLabel: 'AM',
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const DrawerHeader(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(photoLink),
                )
            ),
            const ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
            ),
            const ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.account_box),
              trailing: Icon(Icons.arrow_forward),
            ),
            const ListTile(
              title: Text('Images'),
              leading: Icon(Icons.photo),
              trailing: Icon(Icons.arrow_forward),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ElevatedButton(
                          onPressed: null,
                          child: Text('Выход'),
                      ),
                      ElevatedButton(
                          onPressed: null,
                          child: Text('Регистрация')
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(photoLink),
            ),
            Text('Charlotta Hope')
          ],
        )
      ),

      body: TabBarView(
        controller: _tabController,
        children: _tabBar.map((item) {
          return ListView(
            key: PageStorageKey(item.title),
            children: <Widget>[
              if (dataImg[item.title] != null)
                for(var el in dataImg[item.title])
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(el),
                  ),
            ],
          );
        }).toList(),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 10,
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 80,
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _tabController.index = index;
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            items: [
              for(final item in _tabBar)
                BottomNavigationBarItem(
                    icon: item.icon,
                    label: item.title
                )
            ],
          ),
        )
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      floatingActionButton: FloatingActionButton.small(
        onPressed: () => _toggleBottomSheet(context),
        //onPressed: toggleBottomSheet,
        child: const Icon(Icons.add),
      ),

    );

  }


}
