// Model of Currency
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

const _pName = 'name';         // String     Name of Currency like: CNY / USD / RUB
const _pSymbol = 'symbol';     // String     Symbol of Currency like: $

@freezed
class Currency with _$Currency{

  const factory Currency(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: _pName) String name,
    @JsonKey(name: _pSymbol) String symbol,
  ) = _Currency;

  factory Currency.fromJson(Map<String, Object?> json) => _$CurrencyFromJson(json);

  Map<String, Object?> toJson() => {
    'id': id,
    _pName: name,
    _pSymbol: symbol,
  };
}