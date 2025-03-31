part of "../../flutter_face_api.dart";

/// Crop settings for [OutputImageParams].
class OutputImageCrop {
  /// The aspect ratio according to which alignment is performed.
  OutputImageCropAspectRatio get type => _type;
  OutputImageCropAspectRatio _type;

  /// The resize value to process.
  /// If the value doesn't match AspectRatio `type` proportion or minimum size, an adjustment is applied.
  /// Use [OutputImageCropAspectRatio] to check you size matches AspectRatio `type` proportions and minimum size.
  Size? get size => _size;
  Size? _size;

  /// When an image is aligned by `type`, its original size may be insufficient, and in this case it needs to be supplemented, "padded".
  /// padColor sets the value for the color that will be used for such a supplement.
  Color? get padColor => _padColor;
  Color? _padColor;

  /// If set, the coordinates of the rectangle with the face in the original image prepared for the face crop
  /// are returned in the [DetectFaceResult.originalRect] field.
  /// Default is `false`.
  bool get returnOriginalRect => _returnOriginalRect;
  bool _returnOriginalRect;

  OutputImageCrop(
    OutputImageCropAspectRatio type, {
    Size? size,
    Color? padColor,
    bool? returnOriginalRect,
  }) : _type = type,
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
      returnOriginalRect: jsonObject["returnOriginalRect"],
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "type": type.value,
        "size": size?.toJson(),
        "padColor": _intFromColor(padColor),
        "returnOriginalRect": returnOriginalRect,
      }.clearNulls();
}

/// The AspectRatio according to which alignment is performed
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
