import 'dart:typed_data';

class UploadImage {
  final String name;
  final String path;
  final Uint8List? byteImage;

  UploadImage({required this.name, required this.path, this.byteImage});
}
