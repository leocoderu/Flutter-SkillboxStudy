import 'package:data_sm/main.dart';
import 'package:model_sm/model_sm.dart';

class ConstProductsRepository extends ProductsRepository {
  ConstProductsRepository();

  static const _products = <Product>[
    Product(name: 'Orange',
        id: 1,
        price: 17.0,
        description: 'This is citrus fruit Orange',
        photo: 'orange.jpg',),
    Product(name: 'Apple',
        id: 2,
        price: 10.0,
        description: 'This is fruit Apple',
        photo: 'apple.jpg',),
    Product(name: 'Banana',
        id: 3,
        price: 15.0,
        description: 'This is fruit Banana from Africa',
        photo: 'banana.jpg',),
    Product(name: 'Grape',
        id: 4,
        price: 18.0,
        description: 'This is fruit Grape',
        photo: 'grape.jpg',),
    Product(name: 'Kiwi',
        id: 5,
        price: 9.0,
        description: 'This is fruit has name like bird',
        photo: 'kiwi.jpg',),
    Product(name: 'Lemon',
        id: 6,
        price: 11.0,
        description: 'This is very sour fruit Lemon',
        photo: 'lemon.jpg',),
    Product(name: 'Mango',
        id: 7,
        price: 16.0,
        description: 'This is fruit Mango',
        photo: 'mango.jpg',),
    Product(name: 'Pear',
        id: 8,
        price: 12.0,
        description: 'This is fruit Pear has shape like a lamp',
        photo: 'pear.jpg',),
    Product(name: 'Peach',
        id: 9,
        price: 14.0,
        description: 'This is fruit Peach',
        photo: 'peach.jpg',),
    Product(name: 'Pineapple',
        id: 10,
        price: 20.0,
        description: 'This is fruit Pineapple',
        photo: 'pineapple.jpg',),
  ];

  @override
  Future<List<Product>> getListProducts() async {
    return _products;
  }

  @override
  Future<Product> getProductById(int id) async {
    return _products[id]; // TODO: <- м.б. получение не по внутреннему id, а по списочному внутреннему !!!
  }

  @override
  Future<int?> addProduct(Product product) async {
    try{
      _products.add(product); // Save New Product to Repository
    } catch(err){
      return null;
    }
    return _products.last.id;
  }

  @override
  Future<String> updProduct(int id, Product product) async {
    try {
      _products[id] = product;
    } catch(err){
      return err.toString();
    }
    return '';
  }

  @override
  Future<String> delProduct(int id) async {
    try {
      _products.remove(_products[id]);
    } catch (err) {
      return err.toString();
    }
    return '';
  }

}