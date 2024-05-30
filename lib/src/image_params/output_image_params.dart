part of "../../flutter_face_api.dart";

class OutputImageParams {
  OutputImageCrop? get crop => _crop;
  OutputImageCrop? _crop;

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
