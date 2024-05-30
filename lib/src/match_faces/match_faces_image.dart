part of "../../flutter_face_api.dart";

class MatchFacesImage {
  Uint8List get image => _image;
  Uint8List _image;

  ImageType get imageType => _imageType;
  ImageType _imageType;

  bool get detectAll => _detectAll;
  bool _detectAll;

  String get identifier => _identifier;
  String _identifier;

  MatchFacesImage(
    Uint8List image,
    ImageType imageType, {
    bool? detectAll,
  })  : _image = image,
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
  Map<String, dynamic> toJson() => {
        "image": _bytesToBase64(image),
        "imageType": imageType.value,
        "detectAll": detectAll,
        "identifier": identifier
      }.clearNulls();
}
