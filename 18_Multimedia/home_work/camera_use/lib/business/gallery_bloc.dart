import 'package:camera_use/model/gallery_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera_use/business/gallery_bloc_actions.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryModel> {
  GalleryBloc() : super(const GalleryModel(images: [], count: 0)) {
    on<ChangeCount>((event, emit) => emit(state.copyWith(count: event.cnt)));
    on<AddImage>((event, emit) {
      List<String> tmpImg = [...state.images];
      tmpImg.add(event.img);
      emit(state.copyWith(images: tmpImg));
    });
  }
}
