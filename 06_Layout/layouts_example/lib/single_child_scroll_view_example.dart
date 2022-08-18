import 'package:flutter/material.dart';
import 'package:layouts_example/utils.dart';

class SingleChildScrollViewExample extends StatefulWidget{
  const SingleChildScrollViewExample({Key? key}) : super (key: key);
  @override
  State<SingleChildScrollViewExample> createState() => _SingleChildScrollViewExampleState();
}

class _SingleChildScrollViewExampleState extends State<SingleChildScrollViewExample>{
  final ScrollController controller = ScrollController(); 

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // ignore: avoid_print
      print(controller.offset.round());
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('SingleChildScrollView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              const Text('The first of such lists was made by a Greek historian Herodotus. Only three places were mentioned in it. Eventually the list was expanded up to seven Wonders. Probably everyone can name at least some of those monuments: the Great Pyramid of Giza; the Hanging Gardens of Babylon; the Lighthouse of Alexandria; the Colossus of Rhodes; the Mausoleum at Halicarnassus; the Temple of Artemis; the Statue of Zeus at Olympia. The curious thing about these Wonders is that almost all of them represent3 the Greek culture.'),

              for(final item in fakeData(100, true)) item,

              const Text('The first of such lists was made by a Greek historian Herodotus. Only three places were mentioned in it. Eventually the list was expanded up to seven Wonders. Probably everyone can name at least some of those monuments: the Great Pyramid of Giza; the Hanging Gardens of Babylon; the Lighthouse of Alexandria; the Colossus of Rhodes; the Mausoleum at Halicarnassus; the Temple of Artemis; the Statue of Zeus at Olympia. The curious thing about these Wonders is that almost all of them represent3 the Greek culture.'),
            ]
          ),
        )
      );
      
  }
}