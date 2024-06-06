part of "../../flutter_face_api.dart";

/// Set of parameter for image processing.
class OutputImageParams {
  /// If set, the Base64 of an aligned and cropped portrait is returned in the crop field.
  /// Alignment is performed according to type.
  /// If a head on the original image is tilted, for the returned portrait it is aligned in a straight vertical line.
  ///
  /// If there are more than one face in the photo, all the faces will be detected and processed, and separate portraits for each face will be returned.
  /// So, if there were five people in the photo, you'll get five processed portraits.
  OutputImageCrop? get crop => _crop;
  OutputImageCrop? _crop;

  /// If set, the background color is replaced.
  /// The silhouette of a person is cut out and the background is filled with this color.
  Color? get backgroundColor => _backgroundColor;
  Color? _backgroundColor;

  OutputImageParams({
    OutputImageCrop? crop,
    Color? backgroundColor,
  })  : _crop = crop,
        _backgroundColor = backgroundColor;

  @visibleForTesting
  static OutputImageParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = OutputImageParams();

    result._crop = OutputImageCrop.fromJson(jsonObject["crop"]);
    result._backgroundColor = _intToColor(jsonObject["backgroundColor"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "crop": crop?.toJson(),
        "backgroundColor": _intFromColor(backgroundColor),
      }.clearNulls();
}
