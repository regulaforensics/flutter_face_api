part of "../../flutter_face_api.dart";

class ImageQualityResult {
  ImageQualityGroupName get group => _group;
  late ImageQualityGroupName _group;

  ImageQualityCharacteristicName get name => _name;
  late ImageQualityCharacteristicName _name;

  ImageQualityResultStatus get status => _status;
  late ImageQualityResultStatus _status;

  double get value => _value;
  late double _value;

  ImageQualityRange get range => _range;
  late ImageQualityRange _range;

  ImageQualityResult._privateConstructor();

  @visibleForTesting
  static ImageQualityResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ImageQualityResult._privateConstructor();

    result._group = ImageQualityGroupName.getByValue(jsonObject["group"])!;
    result._name =
        ImageQualityCharacteristicName.getByValue(jsonObject["name"])!;
    result._status = ImageQualityResultStatus.getByValue(jsonObject["status"])!;
    result._value = _toDouble(jsonObject["value"])!;
    result._range = ImageQualityRange.fromJson(jsonObject["range"])!;

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "group": group.value,
        "name": name.value,
        "status": status.value,
        "value": value,
        "range": range.toJson(),
      }.clearNulls();
}

enum ImageQualityGroupName {
  IMAGE_CHARACTERISTICS(1),
  HEAD_SIZE_AND_POSITION(2),
  FACE_QUALITY(3),
  EYES_CHARACTERISTICS(4),
  SHADOWS_AND_LIGHTNING(5),
  POSE_AND_EXPRESSION(6),
  HEAD_OCCLUSION(7),
  BACKGROUND(8),
  UNKNOWN(9);

  const ImageQualityGroupName(this.value);
  final int value;

  static ImageQualityGroupName? getByValue(int? i) {
    if (i == null) return null;
    return ImageQualityGroupName.values.firstWhere((x) => x.value == i);
  }
}

enum ImageQualityResultStatus {
  FALSE(0),
  TRUE(1),
  UNDETERMINED(2);

  const ImageQualityResultStatus(this.value);
  final int value;

  static ImageQualityResultStatus? getByValue(int? i) {
    if (i == null) return null;
    return ImageQualityResultStatus.values.firstWhere((x) => x.value == i);
  }
}
