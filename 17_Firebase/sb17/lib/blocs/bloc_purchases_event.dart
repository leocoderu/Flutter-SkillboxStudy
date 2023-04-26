// Project imports:
import 'package:app_firebase_shop/models/api_purchase/api_purchase.dart';

abstract class BlocPurchasesEvent {}

class BlocPurchasesEventInit extends BlocPurchasesEvent {}

class BlocPurchasesEventSwitch extends BlocPurchasesEvent {
  final ApiPurchase purchase;

  BlocPurchasesEventSwitch(this.purchase);
}
