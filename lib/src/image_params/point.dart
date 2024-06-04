part of "../../flutter_face_api.dart";

/// Point class represents a two number X, Y value.
class Point {
  int get x => _x;
  late int _x;

  int get y => _y;
  late int _y;

  Point._privateConstructor();

  @visibleForTesting
  static Point? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Point._privateConstructor();

    result._x = jsonObject["x"];
    result._y = jsonObject["y"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      }.clearNulls();
}
