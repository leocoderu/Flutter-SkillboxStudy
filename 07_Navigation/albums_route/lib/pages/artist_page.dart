import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:albums_route/pages/home_page.dart';
import 'package:albums_route/menu/item_menu.dart';
//import 'package:albums_route/menu/menu.dart';

class ArtistPage extends StatelessWidget {
  static const namePage = '/artists';
  const ArtistPage({Key? key}) : super(key: key);

  static const List<ItemMenu> menu = [
    ItemMenu(icon: Icons.home, title: 'Home', route: HomePage.namePage),
    ItemMenu(icon: Icons.person_pin, title: 'Artists', route: ArtistPage.namePage, active: true,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Artists'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  ...menu.map((e) => e),
                ],
              ),
            )
        ),
      ),
      body: Center(
         child: FutureBuilder(
           future: DefaultAssetBundle.of(context).loadString('assets/files/artists.json'),
           builder: (context, snapshot){
             if(snapshot.connectionState == ConnectionState.done) {
               if(snapshot.hasError){
                 return const SizedBox(
                     child: Text('We were can\'t loaded data from Json file'),
                 );
               }
               var artJson = json.decode(snapshot.data.toString());
               return Scrollbar(
                   child: ListView.builder(
                     itemCount: artJson.length,
                     itemBuilder: (BuildContext context, int index){
                       return ListTile(
                         title: Text(artJson[index]['artist']),
                         onTap: () {
                           Navigator.of(context).pushNamed('/artists',
                               arguments: {
                                 'title': artJson[index]['artist'],
                                 'about': artJson[index]['about']
                               }
                           );
                         },
                       );
                     },
                   )
               );
             } else {
               return const CircularProgressIndicator();
             }
          },
        )
      )
    );
  }
}
