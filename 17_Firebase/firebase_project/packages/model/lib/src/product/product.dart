// Model of Product
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

const _kPlace = 'place';       // BaseTable  Place:     Market/Shop/Supermarket
const _kName = 'name';         // String     Name:      Apple/Oil/Milk
const _kPrice = 'price';       // Double     Price:     170,65p / 220,50p. / 98,00p.
const _kCurrency = 'currency'; // BaseTable  Currency:  Forint / Euro / Grivna / Ruble / USD / Shekel
const _kQuantity = 'quantity'; // Double     Quantity:  1,4
const _kUnit = 'unit';         // BaseTable  Unit:      kd / pic. / l.
const _kBought = 'bought';     // bool       Bought:    true / false      // maybe Докупить / ...
const _kHide = 'hide';         // bool       Hide List: true / flase      // Hide or not, т.е. перенесено на экран Куплено или Нет

@freezed
class Product with _$Product{
  const factory Product(
      @JsonKey(name: 'id') int id,
      @JsonKey(name: _kPlace) int place,
      @JsonKey(name: _kName) String name,
      @JsonKey(name: _kPrice) double price,
      @JsonKey(name: _kCurrency) int currency,
      @JsonKey(name: _kQuantity) double quantity,
      @JsonKey(name: _kUnit) int unit,
      @JsonKey(name: _kBought) bool bought,
      @JsonKey(name: _kHide) bool hide,
  ) = _Product;

  factory Product.fromJson(Map<String, Object?> json) => _$ProductFromJson(json);

  Map<String, Object?> toJson() => {
    'id': id,
    _kPlace: place,
    _kName: name,
    _kPrice: price,
    _kCurrency: currency,
    _kQuantity: quantity,
    _kUnit: unit,
    _kBought: bought,
    _kHide: hide,
  };
}