import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kindacode.com',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy Product Data Here
  final List myProducts = List.generate(100, (index) {
    return {"id": index, "title": "Product #$index", "price": index + 1};
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dismissible Example')),
        body: ListView.builder(
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,
              onDismissed: (_) {
                setState(() {
                  myProducts.removeAt(index);
                });
              },
              // background: Container(
              //   color: Colors.red,
              //   margin: const EdgeInsets.symmetric(horizontal: 15),
              //   alignment: Alignment.centerLeft,
              //   child: const Icon(
              //     Icons.delete,
              //     color: Colors.white,
              //   ),
              // ),

              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(myProducts[index]["id"].toString()),
                  ),
                  title: Text(myProducts[index]["title"]),
                  subtitle: Text("\$${myProducts[index]["price"].toString()}"),
                  trailing: const Icon(Icons.check_box_outline_blank),
                ),
              ),
            );
          },
        ));
  }
}