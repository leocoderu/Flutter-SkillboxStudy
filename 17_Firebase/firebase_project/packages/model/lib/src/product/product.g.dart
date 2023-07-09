// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      json['id'] as int,
      json['place'] as int,
      json['name'] as String,
      (json['price'] as num).toDouble(),
      json['currency'] as int,
      (json['quantity'] as num).toDouble(),
      json['unit'] as int,
      json['bought'] as bool,
      json['hide'] as bool,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'place': instance.place,
      'name': instance.name,
      'price': instance.price,
      'currency': instance.currency,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'bought': instance.bought,
      'hide': instance.hide,
    };
