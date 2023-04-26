// Project imports:
import 'package:app_firebase_shop/models/api_purchase/api_purchase.dart';

abstract class RepositoryPurchases {
  const RepositoryPurchases();

  Stream<List<ApiPurchase>> get data;

  Future<void> switchIsBought(ApiPurchase purchase);
}
