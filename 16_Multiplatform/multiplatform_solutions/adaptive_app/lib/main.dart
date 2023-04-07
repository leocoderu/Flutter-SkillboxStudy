import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:adaptive_app/widgets/card_person.dart';
import 'package:adaptive_app/widgets/card_person2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive App',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/data/persons.json'),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasError){
              return const SizedBox(child: Text('We were can\'t loaded data from Json file'));
            }
          List<dynamic> personJson = json.decode(snapshot.data.toString());
            return (MediaQuery.of(context).orientation == Orientation.portrait) // .size.width < 720
              ? Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 70.0,
                    color: Colors.cyan,
                    child: const Text('Adaptive App',
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: personJson.length,
                      itemBuilder: (BuildContext itemContext, int index){
                        return CardPerson(
                          photo: personJson[index]['photo'],
                          name:  personJson[index]['name'],
                          about: personJson[index]['about'],
                        );
                      }
                    )
                  )
                ]
              )
              : Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.topCenter,
                    width: 100,
                    height: double.infinity,
                    color: Colors.cyan,
                    child: const Text('Adaptive App',
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 160,
                                childAspectRatio: 3/3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10
                            ),
                            itemCount: personJson.length,
                            itemBuilder: (BuildContext itemContext, int index){
                              return CardPerson2(
                                photo: personJson[index]['photo'],
                                name:  personJson[index]['name'],
                                about: personJson[index]['about'],
                              );
                            }
                        ),
                      )
                  )
                ],
              );
            } else {return const CircularProgressIndicator();}
          }
        ),
      ),
    );
  }
}
