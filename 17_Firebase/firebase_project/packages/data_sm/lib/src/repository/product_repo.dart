// Packages
import 'dart:async';

//import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// Layers
import 'package:model/model.dart';

abstract class SomeEvent {}

// Action for change First state
class ChangeFirst extends SomeEvent {
  final double value;
  ChangeFirst({required this.value});
}

// Action for change Text state
class ChangeText extends SomeEvent {
  final String value;
  ChangeText({required this.value});
}

// Action for change Count state
class ChangeCount extends SomeEvent {
  final int value;
  ChangeCount({required this.value});
}


class ProductRepo { //extends Bloc<SomeEvent, CollectionReference<Product>?> {
  late CollectionReference<Product> _prodRepo;
  //List<Product> _prodList = [];

  // ProductRepo(): super(null) {
  //   on<ChangeCount>((event, emit) => await emit(_prodRepo.doc('jhgjhg').update({'data': event.value})));
  // }

  StreamController<List<Product>?> _streamController = StreamController<List<Product>?>();
  Stream<List<Product>?> get streamProducts => _streamController.stream;

  // READ
  Future<CollectionReference<Product>> initProducts() async {
    // CollectionReference<Product> _products = await FirebaseFirestore.instance.collection('products').withConverter<Product>(
    //   fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
    //   toFirestore: (product, _) => product.toJson(),
    // );

    _prodRepo = await FirebaseFirestore.instance.collection('products').withConverter<Product>(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
      toFirestore: (product, _) => product.toJson(),
    );

     //QuerySnapshot querySnapshot = await _products.get();
     //_prodList = querySnapshot.docs.map<Product>((e) => e.data() as Product).toList();
     //_streamController.add(_prodList);

    return _prodRepo;
  }

  // CREATE
  //Future<void> addProduct(CollectionReference<Product> collection, Product product) async {
    // final docRef = await collection.add(product);
    // await collection.doc(docRef.id).update({'id': docRef.id});
  Future<void> addProduct(Product product) async {
    final docID = await _prodRepo.add(product);
    await _prodRepo.doc(docID.id).update({'id': docID.id});
  }

  // UPDATE
  //Future<void> updProduct(CollectionReference<Product> collection, QueryDocumentSnapshot<Product> snapshot, Product product) async {
    // await collection.doc(snapshot.id).update({
    //   "name": product.name,
    //   "currency": product.currency,
    //   "place": product.place,
    //   "price": product.price,
    //   "quantity": product.quantity,
    //   "unit": product.unit,
    // });
  Future<void> updProduct(Product product) async {
    await _prodRepo.doc(product.id).update({
      "name": product.name,
      "currency": product.currency,
      "place": product.place,
      "price": product.price,
      "quantity": product.quantity,
      "unit": product.unit,
    });
  }

  // UPDATE Bought
  Future<void> setBought(Product product, bool state) async {
    // collection.doc(product.id).update({"bought": state});

    _prodRepo.doc(product.id).update({"bought": state});
  }

  // UPDATE Hide
  Future<void> setHide(Product product, bool state) async {
    // collection.doc(product.id).update({"hide": state});

    _prodRepo.doc(product.id).update({"hide": state});
  }

  // DELETE
  Future<void> delProduct(Product product,) async {
    //await _prodRepo.delete(product);
    // ignore: avoid_print
    //print('Delete Product}');
    // collection.doc(product.id).delete();

    _prodRepo.doc(product.id).delete();
  }
}