import 'package:flutter/material.dart';
import 'package:stateful_stateless_widget/data_img.dart';

class StatefulStatelessWidget extends StatefulWidget {
  const StatefulStatelessWidget({Key? key}) : super(key: key);
  @override
  State<StatefulStatelessWidget> createState() => _StatefulStatelessWidgetState();
}

class _StatefulStatelessWidgetState extends State<StatefulStatelessWidget>{
  final List<String>  nav = ['Мои фото', 'Галерея'];
  //List<String> fakeData = List.generate(100, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Random Image Gallery', style: TextStyle(fontSize: 15)),
          centerTitle: true,
          //toolbarHeight: 50,
          //backgroundColor: Colors.green,
          actions: [
            IconButton(
                icon: const Icon(Icons.add_photo_alternate),
                tooltip: 'Add New Gallery',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added new image gallery')));
                }
            )
          ],
          bottom: TabBar(
            tabs: nav.map((String item) => Tab(text: item)).toList(),
          ),
        ),
        body: TabBarView(
          children: nav.map((name) {
            return ListView(
              key: PageStorageKey(name),
              children: <Widget>[
                if (dataImg[name] != null)
                  for(var el in dataImg[name])
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(el),
                    ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}