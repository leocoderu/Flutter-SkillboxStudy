import 'package:app_theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeLight,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;
  int _currentTabIndex = 0;
  bool _isLoading = false;
  List<Map<String, Object>> _chips = [
    {'name': 'News', 'isSelect': false},
    {'name': 'Book', 'isSelect': true},
    {'name': 'Games', 'isSelect': true},
    {'name': 'Messages', 'isSelect': false},
    {'name': 'People', 'isSelect': false}
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme app'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save_alt),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentIndex) {
          _tabController.index = currentIndex;
          setState(() {
            _currentTabIndex = currentIndex;
            _tabController.animateTo(_currentTabIndex);
          });
        },
        currentIndex: _currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Список товаров',
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Поиск товаров',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text('Заказать товар'),
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        await Future.delayed(Duration(seconds: 1));
                        setState(() => _isLoading = false);
                      },
                    ),
                  ],
                ),
              ),
              if (_isLoading)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(),
                ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    8,
                    (index) => Card(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/img_${index + 1}.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Краткое описание карточки'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 12,
                children: [
                  ..._chips
                      .map(
                        (item) => FilterChip(
                          onSelected: (v) {
                            setState(() {
                              item['isSelect'] = v;
                            });
                          },
                          selected: item['isSelect'],
                          label: Text(item['name']),
                        ),
                      )
                      .toList(),
                  FilterChip(
                    onSelected: null,
                    label: Text('City'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      child: AlertDialog(
                        actions: [
                          RaisedButton(
                            child: Text('Да'),
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                          ),
                          RaisedButton(
                            child: Text('Нет'),
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                        title: Text('Сменить аватар'),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 40,
                    child: Text('AB'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
