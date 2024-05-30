part of "../../flutter_face_api.dart";

class ImageQualityRange {
  double get min => _min;
  double _min;

  double get max => _max;
  double _max;

  ImageQualityRange(double min, double max)
      : _min = min,
        _max = max;

  ImageQualityRange.withValue(double value)
      : _min = value,
        _max = value;

  @visibleForTesting
  static ImageQualityRange? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    return ImageQualityRange(
      _toDouble(jsonObject["min"])!,
      _toDouble(jsonObject["max"])!,
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      }.clearNulls();
}
