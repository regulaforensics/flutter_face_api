part of "../../flutter_face_api.dart";

class FaceCaptureImage {
  Uint8List get image => _image;
  late Uint8List _image;

  ImageType get imageType => _imageType;
  late ImageType _imageType;

  String? get tag => _tag;
  String? _tag;

  FaceCaptureImage._privateConstructor();

  @visibleForTesting
  static FaceCaptureImage? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = FaceCaptureImage._privateConstructor();

    result._image = _bytesFromBase64(jsonObject["image"])!;
    result._imageType = ImageType.getByValue(jsonObject["imageType"])!;
    result._tag = jsonObject["tag"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "image": _bytesToBase64(image),
        "imageType": imageType.value,
        "tag": tag
      }.clearNulls();
}

/// The image type of [FaceCaptureImage] influences matching results and provides the information about the source of the image.
enum ImageType {
  /// The image contains a printed portrait of a person.
  PRINTED(1),

  /// The image contains a portrait of a person and is taken from the RFID chip.
  RFID(2),

  /// The image is taken from the camera.
  LIVE(3),

  /// The image contains a document with a portrait of a person.
  DOCUMENT_WITH_LIVE(4),

  /// The image from an unknown source.
  EXTERNAL(5),

  /// The image is a ghost portrait.
  GHOST_PORTRAIT(6),

  /// The image from a barcode.
  BARCODE(7);

  const ImageType(this.value);
  final int value;

  static ImageType? getByValue(int? i) {
    if (i == null) return null;
    return ImageType.values.firstWhere((x) => x.value == i);
  }
}
