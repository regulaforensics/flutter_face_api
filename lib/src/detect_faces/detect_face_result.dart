part of "../../flutter_face_api.dart";

class DetectFaceResult {
  List<ImageQualityResult>? get quality => _quality;
  List<ImageQualityResult>? _quality;

  List<DetectFacesAttributeResult>? get attributes => _attributes;
  List<DetectFacesAttributeResult>? _attributes;

  Uint8List? get crop => _crop;
  Uint8List? _crop;

  Rect? get faceRect => _faceRect;
  Rect? _faceRect;

  Rect? get originalRect => _originalRect;
  Rect? _originalRect;

  List<Point>? get landmarks => _landmarks;
  List<Point>? _landmarks;

  bool get isQualityCompliant => _isQualityCompliant;
  late bool _isQualityCompliant;

  DetectFaceResult._privateConstructor();

  @visibleForTesting
  static DetectFaceResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DetectFaceResult._privateConstructor();

    if (jsonObject["quality"] != null) {
      result._quality = [];
      for (var item in jsonObject["quality"]) {
        result._quality!.add(ImageQualityResult.fromJson(item)!);
      }
    }
    if (jsonObject["attributes"] != null) {
      result._attributes = [];
      for (var item in jsonObject["attributes"]) {
        result._attributes!.add(DetectFacesAttributeResult.fromJson(item)!);
      }
    }
    result._crop = _bytesFromBase64(jsonObject["crop"]);
    if (jsonObject["landmarks"] != null) {
      result._landmarks = [];
      for (var item in jsonObject["landmarks"]) {
        result._landmarks!.add(Point.fromJson(item)!);
      }
    }
    result._faceRect = Rect.fromJson(jsonObject["faceRect"]);
    result._originalRect = Rect.fromJson(jsonObject["originalRect"]);
    result._isQualityCompliant = jsonObject["isQualityCompliant"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "quality": quality?.map((e) => e.toJson()).toList(),
        "crop": _bytesToBase64(crop),
        "attributes": attributes?.map((e) => e.toJson()).toList(),
        "landmarks": landmarks?.map((e) => e.toJson()).toList(),
        "faceRect": faceRect?.toJson(),
        "originalRect": originalRect?.toJson(),
        "isQualityCompliant": isQualityCompliant,
      }.clearNulls();
}
