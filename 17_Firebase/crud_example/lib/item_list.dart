import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:crud_example/methods/creupt.dart';
import 'package:crud_example/methods/delete.dart';

class ItemList extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  final CollectionReference products;

  const ItemList({super.key, required this.documentSnapshot, required this.products});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(widget.documentSnapshot['name']),
        subtitle: Text(widget.documentSnapshot['price'].toString()),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => creupt(context, widget.products, widget.documentSnapshot)
              ),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => delete(context, widget.products, widget.documentSnapshot.id)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
