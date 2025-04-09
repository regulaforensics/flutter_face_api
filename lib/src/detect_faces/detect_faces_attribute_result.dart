part of "../../flutter_face_api.dart";

class DetectFacesAttributeResult {
  DetectFacesAttribute get attribute => _attribute;
  late DetectFacesAttribute _attribute;

  double? get confidence => _confidence;
  double? _confidence;

  String? get value => _value;
  String? _value;

  ImageQualityRange? get range => _range;
  ImageQualityRange? _range;

  DetectFacesAttributeResult._privateConstructor();

  @visibleForTesting
  static DetectFacesAttributeResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DetectFacesAttributeResult._privateConstructor();

    result._attribute =
        DetectFacesAttribute.getByValue(jsonObject["attribute"])!;
    result._confidence = _toDouble(jsonObject["confidence"]);
    result._value = jsonObject["value"];
    result._range = ImageQualityRange.fromJson(jsonObject["range"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "attribute": attribute.value,
        "confidence": confidence,
        "value": value,
        "range": range?.toJson(),
      }.clearNulls();
}
