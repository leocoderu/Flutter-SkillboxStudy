import 'package:model_sm/model_sm.dart';

abstract class ProductsRepository{
  const ProductsRepository();

  //CRUD
  Future<List<Product>> getListProducts();            // Получить весь список продуктов, возвращает список продуктов
  Future<Product> getProductById(int id);             // Получить Продукт по его идентификатору, возвращает Продукт
  Future<int?> addProduct(Product product);           // Добавить Продукт в репозиторий, возвращает его id
  Future<String> updProduct(int id, Product product); // Обновить информацию о Продукте, возвращает результат операции
  Future<String> delProduct(int id);                  // Удалить Продукт из репозитория, возвращает результат операции
}