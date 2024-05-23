part of "../../flutter_face_api.dart";

class ImageUpload {
  Uint8List? _imageData;
  String? _imageUrl;

  ImageUpload._privateConstructor();
  ImageUpload.withImageData(Uint8List imageData) : _imageData = imageData;
  ImageUpload.withImageUrl(String imageUrl) : _imageUrl = imageUrl;

  @visibleForTesting
  static ImageUpload? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ImageUpload._privateConstructor();

    result._imageData = _bytesFromBase64(jsonObject["imageData"]);
    result._imageUrl = jsonObject["imageUrl"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "imageData": _bytesToBase64(_imageData),
        "imageUrl": _imageUrl,
      }.clearNulls();
}
