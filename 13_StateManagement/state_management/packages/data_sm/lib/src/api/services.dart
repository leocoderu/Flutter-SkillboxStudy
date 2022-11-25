import 'package:model_sm/model_sm.dart';

abstract class ProductService{
  Future<Product> getListProducts();
  Future<Product> getProductById(int id);
}