// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiPurchase _$$_ApiPurchaseFromJson(Map<String, dynamic> json) =>
    _$_ApiPurchase(
      id: json['id'] as String,
      label: json['label'] as String,
      isBought: json['isBought'] as bool,
    );

Map<String, dynamic> _$$_ApiPurchaseToJson(_$_ApiPurchase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'isBought': instance.isBought,
    };
