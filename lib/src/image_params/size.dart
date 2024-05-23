part of "../../flutter_face_api.dart";

class Size {
  int get width => _width;
  int _width;

  int get height => _height;
  int _height;

  Size(int width, int height)
      : _width = width,
        _height = height;

  @visibleForTesting
  static Size? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return new Size(jsonObject["width"], jsonObject["height"]);
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
      }.clearNulls();
}
