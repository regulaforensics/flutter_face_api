part of "../../flutter_face_api.dart";

/// An object that represents uploaded image with its settings.
class ImageUpload {
  Uint8List? _imageData;
  String? _imageUrl;

  ImageUpload._privateConstructor();

  /// Creates an object of [ImageUpload] using an image.
  ///
  /// `imageData` - Image base64.
  ImageUpload.withImageData(Uint8List imageData) : _imageData = imageData;

  /// Creates an object of [ImageUpload] using an image url.
  ///
  /// `imageUrl` - Image url.
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
