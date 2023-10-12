
abstract class GalleryEvent {}

// Action for Add Image state
class AddImage extends GalleryEvent {
  final String img;
  AddImage({required this.img});
}

// Action for Add Image state
class AddImages extends GalleryEvent {
  final List<String> images;
  AddImages({required this.images});
}

// Action for change Count state
class ChangeCount extends GalleryEvent {
  final int cnt;
  ChangeCount({required this.cnt});
}

