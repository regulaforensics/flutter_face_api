part of "../../flutter_face_api.dart";

class Rect {
  int get left => _left;
  late int _left;

  int get top => _top;
  late int _top;

  int get right => _right;
  late int _right;

  int get bottom => _bottom;
  late int _bottom;

  Rect._privateConstructor();

  @visibleForTesting
  static Rect? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Rect._privateConstructor();

    result._left = jsonObject["left"];
    result._top = jsonObject["top"];
    result._right = jsonObject["right"];
    result._bottom = jsonObject["bottom"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {"left": left, "top": top, "right": right, "bottom": bottom}.clearNulls();
}
