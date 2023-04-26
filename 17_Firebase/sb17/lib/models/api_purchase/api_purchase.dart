// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_purchase.freezed.dart';
part 'api_purchase.g.dart';

@freezed
class ApiPurchase with _$ApiPurchase {
  const factory ApiPurchase({
    required String id,
    required String label,
    required bool isBought,
  }) = _ApiPurchase;

  factory ApiPurchase.fromJson(Map<String, dynamic> json) =>
      _$ApiPurchaseFromJson(json);
}
