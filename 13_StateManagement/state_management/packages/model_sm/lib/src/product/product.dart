// Model of Product
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product{
  const factory Product({
      required String name,
      required double price,
      String? description,
      String? photo,
  }) = _Product;
}