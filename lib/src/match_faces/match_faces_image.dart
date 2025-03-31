part of "../../flutter_face_api.dart";

/// This class represents the input image and its attributes for [MatchFacesRequest].
class MatchFacesImage {
  /// The underlying image.
  Uint8List get image => _image;
  Uint8List _image;

  /// The image type.
  /// The imageType influences matching results, therefore this field is required.
  ImageType get imageType => _imageType;
  ImageType _imageType;

  /// Defines whether the comparison and detection should apply for all faces found on the image. Defaults to `false`.
  /// When set to `false`, only the most centered faces are compared and detected.
  /// Otherwise, all the faces are compared and detected.
  bool get detectAll => _detectAll;
  bool _detectAll;

  String get identifier => _identifier;
  String _identifier;

  MatchFacesImage(Uint8List image, ImageType imageType, {bool? detectAll})
    : _image = image,
      _imageType = imageType,
      _detectAll = detectAll ?? false,
      _identifier = "";

  @visibleForTesting
  static MatchFacesImage? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    var result = MatchFacesImage(
      _bytesFromBase64(jsonObject["image"])!,
      ImageType.getByValue(jsonObject["imageType"])!,
      detectAll: jsonObject["detectAll"],
    );
    result._identifier = jsonObject["identifier"];
    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "image": _bytesToBase64(image),
        "imageType": imageType.value,
        "detectAll": detectAll,
        "identifier": identifier,
      }.clearNulls();
}
