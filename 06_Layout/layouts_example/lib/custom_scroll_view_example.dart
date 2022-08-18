//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:layouts_example/utils.dart';

class CustomScrollViewExample extends StatefulWidget{
  const CustomScrollViewExample({Key? key}) : super(key: key);
  @override
  State<CustomScrollViewExample> createState() => _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample>{
  @override
  Widget build(BuildContext context){
    return Material(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // SliverList(
            //     delegate: SliverChildListDelegate(
            //       [
            //         for (var item in fakeData(20)) item,
            //       ]
            //     ),
            // ),
            // SliverGrid.count(
            //     crossAxisCount: 2,
            //     children: [
            //       for (var item in fakeData(10)) item,
            //     ],
            // ),
            // SliverGrid.extent(
            //   maxCrossAxisExtent: 150,
            //   children: [
            //     for (var item in fakeData(10)) item,
            //   ],
            // ),
            // const CupertinoSliverNavigationBar(
            //   largeTitle: Text('Sliver navigation Bar'),
            // ),
            // SliverGrid.count(
            //   crossAxisCount: 2,
            //   children: [
            //     for (var item in fakeData(10)) item,
            //   ],
            // ),

            // SliverAppBar(
            //   expandedHeight: 200.0,
            //     floating: false,
            //     pinned: true,                   // Collapsing Toolbar зафиксируется после скролла
            //     flexibleSpace: FlexibleSpaceBar(
            //       centerTitle: true,
            //       title: const Text('Collapsing Toolbar',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16.0,
            //         )),
            //       background: Image.network('https://i.pinimg.com/200x150/36/ad/0e/36ad0e036efa1dd0697d6a33707fce8e.jpg',
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            // ),

            // SliverGrid.count(
            //   crossAxisCount: 2,
            //   children: [
            //     for (var item in fakeData(10)) item,
            //   ],
            // ),
            //
            // const SliverToBoxAdapter(
            //   child: Text('The first of such lists was made by a Greek historian Herodotus. Only three places were mentioned in it. Eventually the list was expanded up to seven Wonders. Probably everyone can name at least some of those monuments: the Great Pyramid of Giza; the Hanging Gardens of Babylon; the Lighthouse of Alexandria; the Colossus of Rhodes; the Mausoleum at Halicarnassus; the Temple of Artemis; the Statue of Zeus at Olympia. The curious thing about these Wonders is that almost all of them represent3 the Greek culture.'),
            // ),
            //
            // SliverFillRemaining(
            //   child: Container(
            //     color: Colors.red,
            //     child: const Center(
            //       child: Text('The first of such lists was made by a Greek historian Herodotus. Only three places were mentioned in it. Eventually the list was expanded up to seven Wonders. Probably everyone can name at least some of those monuments: the Great Pyramid of Giza; the Hanging Gardens of Babylon; the Lighthouse of Alexandria; the Colossus of Rhodes; the Mausoleum at Halicarnassus; the Temple of Artemis; the Statue of Zeus at Olympia. The curious thing about these Wonders is that almost all of them represent3 the Greek culture.'),
            //     ),
            //   ),
            // ),
            //
            // const SliverToBoxAdapter(
            //   child: Text('The first of such lists was made by a Greek historian Herodotus. Only three places were mentioned in it. Eventually the list was expanded up to seven Wonders. Probably everyone can name at least some of those monuments: the Great Pyramid of Giza; the Hanging Gardens of Babylon; the Lighthouse of Alexandria; the Colossus of Rhodes; the Mausoleum at Halicarnassus; the Temple of Artemis; the Statue of Zeus at Olympia. The curious thing about these Wonders is that almost all of them represent3 the Greek culture.'),
            // ),

            SliverLayoutBuilder(
                builder: (context, constrains) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const Text('The first of such lists was made by a Greek historian Herodotus. Only three places were mentioned in it. Eventually the list was expanded up to seven Wonders. Probably everyone can name at least some of those monuments: the Great Pyramid of Giza; the Hanging Gardens of Babylon; the Lighthouse of Alexandria; the Colossus of Rhodes; the Mausoleum at Halicarnassus; the Temple of Artemis; the Statue of Zeus at Olympia. The curious thing about these Wonders is that almost all of them represent3 the Greek culture.'),
                        Text('${constrains.viewportMainAxisExtent}'),
                        Text('${constrains.crossAxisExtent}'),
                      ],
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}