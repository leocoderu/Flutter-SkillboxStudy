// Model of Product
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

@freezed
class ProductData with _$ProductData{
  const factory ProductData({
    required double degrees,
    required double cloudy,
  }) = _ProductData;
}