// Packages
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

// Layers
import 'package:model/model.dart';

class ProductRepo {
  //late CollectionReference<Product> _products;
  //late List<Product>? _prodList;

  StreamController<List<Product>?> _streamController = StreamController<List<Product>?>();
  Stream<List<Product>?> get streamProducts => _streamController.stream;

  Future<CollectionReference<Product>> initProducts() async {
    CollectionReference<Product> _products = await FirebaseFirestore.instance.collection('products').withConverter<Product>(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
      toFirestore: (product, _) => product.toJson(),
    );
    // QuerySnapshot querySnapshot = await _products.get();
    // _prodList = querySnapshot.docs.map<Product>((e) => e.data() as Product).toList();
    // _streamController.add(_prodList);

    return _products;
  }

  Future<void> addProduct(CollectionReference<Product> collection, Product product) async {
    await collection.add(product);
  }

  Future<void> updProduct(CollectionReference<Product> collection, QueryDocumentSnapshot<Product> snapshot, Product product) async {
    await collection.doc(snapshot.id).update({"bought": product.bought});
  }

  // Future<void> setBoughtR(CollectionReference<Product> product, bool state) async {
  //   // ignore: avoid_print
  //   print('setBought: ${product.toString()}');
  //   _products.doc('1LzS23Ssg9dgZZXlVhMU').update({"bought": state});
  //   // collection = await FirebaseFirestore.instance.collection('products');
  //   //     collection.doc('').update({"bought": state});
  // }

  Future<void> setBought(CollectionReference<Product> collection, QueryDocumentSnapshot<Product> product, bool state) async {
    // ignore: avoid_print
    //print('setBought:');

    // ignore: avoid_print
    //print(product.id); //s.doc('1LzS23Ssg9dgZZXlVhMU'));
    //_products.doc('1LzS23Ssg9dgZZXlVhMU').update({"bought": state});


    collection.doc(product.id).update({"bought": state});

    ////print(_products.doc().map() .forEach((element) {print(element);}));
    ////QuerySnapshot querySnapshot = _product.get();
    ////});

    ////print('Length: ${_product.get('').length}');
        ////.where((e) {e.data.docs.get('id') == product.id }).
        ////.map((event) => print(event.docs[1].id)).expand((element) => [if(element) ]);
  }
}