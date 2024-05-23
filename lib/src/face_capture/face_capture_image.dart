part of "../../flutter_face_api.dart";

class FaceCaptureImage {
  Uint8List get image => _image;
  Uint8List _image;

  ImageType get imageType => _imageType;
  ImageType _imageType;

  String? get tag => _tag;
  String? _tag;

  FaceCaptureImage(
    Uint8List image,
    ImageType imageType, {
    String? tag,
  })  : _image = image,
        _imageType = imageType,
        _tag = tag;

  @visibleForTesting
  static FaceCaptureImage? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    return FaceCaptureImage(
      _bytesFromBase64(jsonObject["image"])!,
      ImageType.getByValue(jsonObject["imageType"])!,
      tag: jsonObject["tag"],
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "image": _bytesToBase64(image),
        "imageType": imageType.value,
        "tag": tag
      }.clearNulls();
}

enum ImageType {
  PRINTED(1),
  RFID(2),
  LIVE(3),
  DOCUMENT_WITH_LIVE(4),
  EXTERNAL(5),
  GHOST_PORTRAIT(6),
  BARCODE(7);

  const ImageType(this.value);
  final int value;

  static ImageType? getByValue(int? i) {
    if (i == null) return null;
    return ImageType.values.firstWhere((x) => x.value == i);
  }
}
