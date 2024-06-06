part of "../../flutter_face_api.dart";

/// [MatchFacesDetectionFace] represents face detection information as a part of [MatchFacesResponse].
class MatchFacesDetectionFace {
  /// The index of the face detection object in the array of detections.
  int get faceIndex => _faceIndex;
  late int _faceIndex;

  /// Main coordinates of the detected face (eyes, nose, lips, ears and etc.).
  List<Point> get landmarks => _landmarks;
  late List<Point> _landmarks;

  /// Rectangular area of the detected face in the original image.
  Rect get faceRect => _faceRect;
  late Rect _faceRect;

  /// Rotation is measured counterclockwise in degrees, with zero indicating
  /// that a line drawn between the eyes is horizontal relative to the image orientation.
  double? get rotationAngle => _rotationAngle;
  double? _rotationAngle;

  /// Coordinates of the rectangle with the face on the original image prepared for the face crop.
  /// Requires [OutputImageCrop.returnOriginalRect] is set.
  /// Returns `CGRectZero` if [OutputImageCrop.returnOriginalRect] isn't set.
  Rect? get originalRect => _originalRect;
  Rect? _originalRect;

  /// Base64 image of the aligned and cropped portrait.
  /// Returned if [MatchFacesRequest.outputImageParams] is set or predefined scenario is used.
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
