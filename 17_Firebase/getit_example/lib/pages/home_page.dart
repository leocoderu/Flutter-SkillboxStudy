import 'package:flutter/material.dart';

import 'package:model/model.dart';
import 'package:business/business.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Person? visiblePerson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetIt Example App'),
        centerTitle: true,
      ),
      body: Container(
        child: (visiblePerson != null)
            ? Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${visiblePerson!.name}",
                          style: const TextStyle(fontSize: 30),
                        ),
                        Container(
                          height: 300,
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Image.network(visiblePerson!.imgUrl!),
                        ),
                        Text("Year of Birth: ${visiblePerson!.birthYear}"),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(child: Text("No Person loaded yet"),)
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: const Icon(Icons.cloud_download),
        onPressed: () async {
          // TODO 5: Locate the service with GetIt and call getNextPerson
          Person? person = await locator.get<PersonController>().getNextPerson();
          // TODO 7: Use setState to update the visiblePerson
          setState(() => visiblePerson = person);
        },
      ),
    );
  }
}
