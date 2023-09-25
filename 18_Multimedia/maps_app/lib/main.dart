import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:maps_app/examples/widgets/map_page.dart';
import 'package:maps_app/examples/circle_map_object_page.dart';
import 'package:maps_app/examples/clusterized_placemark_collection_page.dart';
import 'package:maps_app/examples/bicycle_page.dart';
import 'package:maps_app/examples/driving_page.dart';
import 'package:maps_app/examples/map_controls_page.dart';
import 'package:maps_app/examples/map_object_collection_page.dart';
import 'package:maps_app/examples/placemark_map_object_page.dart';
import 'package:maps_app/examples/polyline_map_object_page.dart';
import 'package:maps_app/examples/polygon_map_object_page.dart';
import 'package:maps_app/examples/reverse_search_page.dart';
import 'package:maps_app/examples/search_page.dart';
import 'package:maps_app/examples/suggest_page.dart';
import 'package:maps_app/examples/user_layer_page.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MyApp());
}

const List<MapPage> _allPages = <MapPage>[
  MapControlsPage(),
  ClusterizedPlacemarkCollectionPage(),
  MapObjectCollectionPage(),
  PlacemarkMapObjectPage(),
  PolylineMapObjectPage(),
  PolygonMapObjectPage(),
  CircleMapObjectPage(),
  UserLayerPage(),
  SuggestionsPage(),
  SearchPage(),
  ReverseSearchPage(),
  BicyclePage(),
  DrivingPage(),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _pushPage(BuildContext context, MapPage page) {
    Navigator.push(context,
      MaterialPageRoute<void>(builder: (_) => Scaffold(
        appBar: AppBar(title: Text(page.title)),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: page,
        ),
      ))
    );
  }

  const MyHomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Yandex Maps Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const YandexMap(),
                )
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: _allPages.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(_allPages[index].title),
                    onTap: () => _pushPage(context, _allPages[index]),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
