import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_model.freezed.dart';

@freezed
class GalleryModel with _$GalleryModel{
  const factory GalleryModel({
    required List<String> images,
    required int count,
  }) = _GalleryModel;
}