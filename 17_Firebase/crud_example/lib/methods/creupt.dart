import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> creupt(BuildContext context, CollectionReference products, [DocumentSnapshot? documentSnapshot]) async {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  bool create = true;

  if (documentSnapshot != null) {
    nameController.text = documentSnapshot['name'];
    priceController.text = documentSnapshot['price'].toString();
    create = false;
  }

  void clearForm() {
    nameController.text = '';
    priceController.text = '';
    Navigator.of(context).pop();
  }

  await showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: create ? const Text('Create') : const Text( 'Update'),
                onPressed: () async {
                  final String name = nameController.text;
                  final double? price = double.tryParse(priceController.text);
                  if (price != null) {
                    create
                        ? await (products.add({"name": name, "price": price}).then((value) => clearForm()))
                        : await products.doc(documentSnapshot!.id)
                        .update({"name": name, "price": price}).then((value) => clearForm());
                  }
                },
              )
            ],
          ),
        );
      });
}