part of "../../flutter_face_api.dart";

class SearchPersonDetection {
  List<Point> get landmarks => _landmarks;
  List<Point> _landmarks = [];

  Rect get rect => _rect;
  late Rect _rect;

  Uint8List? get crop => _crop;
  Uint8List? _crop;

  double get rotationAngle => _rotationAngle;
  late double _rotationAngle;

  SearchPersonDetection._privateConstructor();

  @visibleForTesting
  static SearchPersonDetection? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = SearchPersonDetection._privateConstructor();

    for (var item in jsonObject["landmarks"]) {
      result._landmarks.add(Point.fromJson(item)!);
    }
    result._rect = Rect.fromJson(jsonObject["rect"])!;
    result._crop = _bytesFromBase64(jsonObject["crop"]);
    result._rotationAngle = _toDouble(jsonObject["rotationAngle"])!;

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "landmarks": landmarks.map((e) => e.toJson()),
        "rect": rect.toJson(),
        "crop": _bytesToBase64(crop),
        "rotationAngle": rotationAngle,
      }.clearNulls();
}
