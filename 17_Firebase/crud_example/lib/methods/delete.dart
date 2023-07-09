import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> delete(BuildContext context, CollectionReference products, String productId) async {
  await products.doc(productId).delete()
      .then((value) => ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You have successfully deleted a product'))
  ));
}