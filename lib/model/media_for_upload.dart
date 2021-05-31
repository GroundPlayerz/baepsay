import 'dart:typed_data';

class MediaForUpload {
  String type; //video, image, thumbnail
  int contentOrder;
  Uint8List media;

  MediaForUpload({
    required this.media,
    required this.type,
    required this.contentOrder,
  });
}
