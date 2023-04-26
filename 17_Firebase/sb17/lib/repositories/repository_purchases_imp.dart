// Dart imports:
import 'dart:async';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:app_firebase_shop/consts/keys.dart';
import 'package:app_firebase_shop/models/api_purchase/api_purchase.dart';
import 'package:app_firebase_shop/repositories/repository_purchases.dart';

class RepositoryPurchasesImp extends RepositoryPurchases {
  RepositoryPurchasesImp();

  late final Stream<List<ApiPurchase>> stream =
      _getStream().asBroadcastStream();

  Stream<List<ApiPurchase>> _getStream() =>
      _purchases.snapshots().map((query) => query.docs
          .map((doc) => ApiPurchase(
                id: doc.id,
                label: doc.data().label,
                isBought: doc.data().isBought,
              ))
          .toList());

  final CollectionReference<ApiPurchase> _purchases = FirebaseFirestore.instance
      .collection(keyCollectionPurchases)
      .withConverter<ApiPurchase>(
        fromFirestore: (doc, _) => ApiPurchase.fromJson(doc.data()!),
        toFirestore: (purchase, _) => purchase.toJson(),
      );

  @override
  Stream<List<ApiPurchase>> get data => _getStream();

  @override
  Future<void> switchIsBought(ApiPurchase purchase) async {
    await _purchases
        .doc(purchase.id)
        .update(purchase.copyWith(isBought: !purchase.isBought).toJson());
  }
}
