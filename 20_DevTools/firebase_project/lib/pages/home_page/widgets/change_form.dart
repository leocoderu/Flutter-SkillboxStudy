// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:dropdown_textfield/dropdown_textfield.dart';

// Import Layers
import 'package:model/model.dart';
import 'package:business_sm/business_sm.dart';

T? getData<T>(List<dynamic> data, String id) => data.where((e) => e.id == id).first;

Future<void> changeForm(BuildContext context, List<Place>? places, List<Currency>? currency, List<Unit>? units, [Product? product]) async {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quanController = TextEditingController();

  DropDownValueModel? getDefValue<T>(List<T>? values, String id) {
    return values != null
        ? DropDownValueModel(
            name: getData<dynamic>(values, id).name,
            value: id,
          )
        : null;
  }

  final SingleValueDropDownController placeController = SingleValueDropDownController(data: product != null ? getDefValue<Place>(places, product.place) : null);
  final SingleValueDropDownController curController   = SingleValueDropDownController(data: product != null ? getDefValue<Currency>(currency, product.currency) : null);
  final SingleValueDropDownController unitController  = SingleValueDropDownController(data: product != null ? getDefValue<Unit>(units, product.unit) : null);

  bool create = true;

  if (product != null) {
    nameController.text = product.name;
    priceController.text = product.price.toString();
    quanController.text = product.quantity.toString();

    create = false;
  }

  void clearForm() {
    nameController.text = '';
    priceController.text = '';
    quanController.text = '';
    Navigator.of(context).pop();
  }

  await showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx){
        return Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropDownTextField(
                    textFieldDecoration: InputDecoration(
                      label: const Text("Select Place"),
                    ),
                    controller: placeController,
                    validator: (value) =>  value == null ? "Required field" : null,
                    dropDownItemCount: 6,
                    dropDownList: (places != null)
                        ? places.map((e) => DropDownValueModel(name: e.name, value: e.id)).toList()
                        :[],
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  RowData<Currency>(caption: 'Price', text:"Currency", textController: priceController, dropDownController: curController, data: currency),
                  RowData<Currency>(caption: 'Quantity', text:"Unit" ,textController: quanController, dropDownController: unitController, data: units),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: create ? const Text('Create') : const Text( 'Update'),
                    onPressed: () async {
                      if(create) {
                        Product _newProd = Product(
                          'None',   // ID will be assign later
                          placeController.dropDownValue!.value,
                          nameController.text,
                          double.parse(priceController.text),
                          curController.dropDownValue!.value,
                          double.parse(quanController.text),
                          unitController.dropDownValue!.value,
                          false,
                          false,
                        );
                        locator.get<ProdController>().addProduct(_newProd);
                      } else {

                        Product _newProd = Product(
                          product!.id,
                          placeController.dropDownValue!.value,
                          nameController.text,
                          double.parse(priceController.text),
                          curController.dropDownValue!.value,
                          double.parse(quanController.text),
                          unitController.dropDownValue!.value,
                          false,
                          false,
                        );
                        locator.get<ProdController>().updProduct(_newProd);
                      }

                      clearForm();
                    },
                  ),
                ],
              ),
           );
      },);
}

class RowData<T> extends StatelessWidget {
  final String caption;
  final String? text;
  final TextEditingController textController;
  final SingleValueDropDownController dropDownController;
  final List<dynamic>? data;

  const RowData({
    super.key,
    required this.caption,
    this.text,
    required this.textController,
    required this.dropDownController,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 5),
            height: 59,
            child: TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              controller: textController,
              decoration: InputDecoration(labelText: caption),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 5),
            height: 59,
            child: DropDownTextField(
              textFieldDecoration: InputDecoration(
                label: Text(text != null ? text! : "Select Item"),
              ),
              controller: dropDownController,
              validator: (value) =>  value == null ? "Required field" : null,
              dropDownItemCount: 6,
              dropDownList: (data != null)
                  ? data!.map<DropDownValueModel>((e) => DropDownValueModel(name: e.name, value: e.id)).toList()
                  :[],
            ),
          ),
        ),
      ],
    );
  }
}

