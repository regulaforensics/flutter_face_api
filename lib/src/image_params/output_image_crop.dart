part of "../../flutter_face_api.dart";

class OutputImageCrop {
  OutputImageCropAspectRatio get type => _type;
  OutputImageCropAspectRatio _type;

  Size? get size => _size;
  Size? _size;

  Color? get padColor => _padColor;
  Color? _padColor;

  bool get returnOriginalRect => _returnOriginalRect;
  bool _returnOriginalRect;

  OutputImageCrop(
    OutputImageCropAspectRatio type, {
    Size? size,
    Color? padColor,
    bool? returnOriginalRect,
  })  : _type = type,
        _size = size,
        _padColor = padColor,
        _returnOriginalRect = returnOriginalRect ?? false;

  @visibleForTesting
  static OutputImageCrop? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return OutputImageCrop(
        OutputImageCropAspectRatio.getByValue(jsonObject["type"])!,
        size: Size.fromJson(jsonObject["size"]),
        padColor: _intToColor(jsonObject["padColor"]),
        returnOriginalRect: jsonObject["returnOriginalRect"]);
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "type": type.value,
        "size": size?.toJson(),
        "padColor": _intFromColor(padColor),
        "returnOriginalRect": returnOriginalRect,
      }.clearNulls();
}

enum OutputImageCropAspectRatio {
  RATIO_3X4(0),
  RATIO_4X5(1),
  RATIO_2X3(2),
  RATIO_1X1(3),
  RATIO_7X9(4);

  const OutputImageCropAspectRatio(this.value);
  final int value;

  static OutputImageCropAspectRatio? getByValue(int? i) {
    if (i == null) return null;
    return OutputImageCropAspectRatio.values.firstWhere((x) => x.value == i);
  }
}
