// Import Flutter
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
  final Product product;
  final List<Place>? places;
  final List<Currency>? currency;
  final List<Unit>? units;

  const ItemList({
    super.key,
    required this.product,
    required this.places,
    required this.currency,
    required this.units,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setBought(product, !product.bought);
      },
      onLongPress: () {
        changeForm(context, places, currency, units, product);
      },
      child: Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.001,
            dismissible: DismissiblePane(onDismissed: () {swipeListItem(product, !product.hide);}),
            children: [],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.25,
            children: [
              IconButton(
                onPressed: () => changeForm(context, places, currency, units, product),
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
              title: Text(product.name),
              subtitle: Text("${product.price.toString()}"),
              trailing: product.bought
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            ),
          ),
        ),
    );
  }
}

Future<void> swipeListItem(Product product, bool value) async => locator.get<ProdController>().setHide(product, value);

Future<void> setBought(Product product, bool value) async => locator.get<ProdController>().setBought(product, value);

void searchInet(BuildContext context){
  // ignore: avoid_print
  print("Search this product from Internet");
}
