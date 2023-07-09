// Import Layers
import 'package:business_sm/di/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_sm/data_sm.dart';
import 'package:model/model.dart';

class ProdController {
  //Future<List<Product>?> initProducts() async => await locator.get<ProductRepo>().initProducts();
  Future<CollectionReference<Product>> initProducts() async => await locator.get<ProductRepo>().initProducts();
  Stream<List<Product>?> streamProducts() => locator.get<ProductRepo>().streamProducts;
  Future<void> setBought(CollectionReference<Product> collection, QueryDocumentSnapshot<Product> product, bool state) async
      => await locator.get<ProductRepo>().setBought(collection, product, state);
  Future<void> addProduct(CollectionReference<Product> collection, Product product) async => await locator.get<ProductRepo>().addProduct(collection, product);
  Future<void> updProduct(CollectionReference<Product> collection, QueryDocumentSnapshot<Product> snapshot, Product product) async => await locator.get<ProductRepo>().updProduct(collection, snapshot, product);
}