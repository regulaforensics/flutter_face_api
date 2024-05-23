part of "../../flutter_face_api.dart";

class MatchFacesDetectionFace {
  int get faceIndex => _faceIndex;
  late int _faceIndex;

  List<Point> get landmarks => _landmarks;
  late List<Point> _landmarks;

  Rect get faceRect => _faceRect;
  late Rect _faceRect;

  double? get rotationAngle => _rotationAngle;
  double? _rotationAngle;

  Rect? get originalRect => _originalRect;
  Rect? _originalRect;

  Uint8List? get crop => _crop;
  Uint8List? _crop;

  MatchFacesDetectionFace._privateConstructor();

  @visibleForTesting
  static MatchFacesDetectionFace? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = MatchFacesDetectionFace._privateConstructor();

    List<Point> landmarks = [];
    for (var item in jsonObject["landmarks"]) {
      landmarks.add(Point.fromJson(item)!);
    }

    result._faceIndex = jsonObject["faceIndex"];
    result._landmarks = landmarks;
    result._faceRect = Rect.fromJson(jsonObject["faceRect"])!;
    result._rotationAngle = _toDouble(jsonObject["rotationAngle"]);
    result._originalRect = Rect.fromJson(jsonObject["originalRect"]);
    result._crop = _bytesFromBase64(jsonObject["crop"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "faceIndex": faceIndex,
        "landmarks": landmarks.map((e) => e.toJson()).toList(),
        "faceRect": faceRect.toJson(),
        "rotationAngle": rotationAngle,
        "originalRect": originalRect?.toJson(),
        "crop": _bytesToBase64(crop),
      }.clearNulls();
}
