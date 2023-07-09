// Import Flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter_slidable/flutter_slidable.dart';

// Import Layers
import 'package:model/model.dart';
import 'package:business_sm/business_sm.dart';

// Import Widgets
import 'package:firebase_project/pages/home_page/widgets/change_form.dart';

// call this widget: ItemList(product: e)

// TODO: Сдвиг Влево,  отображаются значки Доп. действия, (Карандаш -> Редактирование, земШар -> поиск в Инете по названию)
// TODO: Сдвиг Вправо, перенести его на страницу "Куплено"
// TODO: Быстрый Tap,  Поставить/Убрать пометку Куплено
// TODO: Долгий Tap,   Редактирование

class ItemList extends StatelessWidget {
  final CollectionReference<Product> collection;
  final QueryDocumentSnapshot<Product> product;
  final List<Place>? places;
  final List<Currency>? currency;
  final List<Unit>? units;

  const ItemList({
    super.key,
    required this.product,
    required this.collection,
    required this.places,
    required this.currency,
    required this.units,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setBought(collection, product, !product.get('bought'));
      },
      onLongPress: () {changeForm(context, collection, places, currency, units, product);},
      child: Slidable(
          key: const ValueKey(0),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.001,
            dismissible: DismissiblePane(onDismissed: () {swipeListItem(context);}),
            children: [],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.25,
            children: [
              IconButton(
                onPressed: () => changeForm(context, collection, places, currency, units, product),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => searchInet(context),
                icon: Icon(Icons.public),
              ),
            ],
          ),

          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: ListTile(
              title: Text(product.get('name')),
              subtitle: Text("${product.get('price').toString()}"),
              trailing: product.get('bought')
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            ),
          ),
        ),
    );
  }
}

void swipeListItem(BuildContext context){
  // ignore: avoid_print
  print("Swipe to another List");
}

Future<void> setBought(CollectionReference<Product> collection, QueryDocumentSnapshot<Product> product, bool value) async =>
    locator.get<ProdController>().setBought(collection, product, value);

void searchInet(BuildContext context){
  // ignore: avoid_print
  print("Search this product from Internet");
}
