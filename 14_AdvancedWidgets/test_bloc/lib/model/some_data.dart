// This is Model of Data with include differently data

import 'package:freezed_annotation/freezed_annotation.dart';

part 'some_data.freezed.dart';

@freezed
class SomeData with _$SomeData{
  const factory SomeData({
    required double first,
    required String text,
    required int count,
    required List<String> posts
  }) = _SomeData;
}