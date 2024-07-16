part of "../../flutter_face_api.dart";

/// Image Quality parameter to include in [DetectFacesConfig] as [DetectFacesConfig.customQuality].
class ImageQualityCharacteristic {
  ImageQualityCharacteristicName _characteristicName;
  ImageQualityRange? _recommendedRange;
  ImageQualityRange? _customRange;
  Color? _color;

  ImageQualityCharacteristic._create(
    ImageQualityCharacteristicName name, {
    ImageQualityRange? recommended,
    ImageQualityRange? custom,
    Color? color,
  })  : _characteristicName = name,
        _recommendedRange = recommended,
        _customRange = custom,
        _color = color;

  ImageQualityCharacteristic withCustomRange(double min, double max) {
    _customRange = ImageQualityRange(min, max);
    return this;
  }

  ImageQualityCharacteristic withCustomValue(double value) {
    _customRange = ImageQualityRange.withValue(value);
    return this;
  }

  @visibleForTesting
  static ImageQualityCharacteristic? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.getByValue(
          jsonObject["characteristicName"])!,
      recommended: ImageQualityRange.fromJson(jsonObject["recommendedRange"]),
      custom: ImageQualityRange.fromJson(jsonObject["customRange"]),
      color: _intToColor(jsonObject["color"]),
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "characteristicName": _characteristicName.value,
        "recommendedRange": _recommendedRange?.toJson(),
        "customRange": _customRange?.toJson(),
        "color": _intFromColor(_color),
      }.clearNulls();
}
