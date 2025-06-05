part of "../../flutter_face_api.dart";

/// Represents detection results on an input image as a part of [MatchFacesResponse].
class MatchFacesDetection {
  /// The index to the input image in the input array provided to the request.
  int get imageIndex => _imageIndex;
  late int _imageIndex;

  /// The input image used for comparison operation.
  MatchFacesImage get image => _image;
  late MatchFacesImage _image;

  /// The array of faces detected on the image.
  List<MatchFacesDetectionFace> get faces => _faces;
  List<MatchFacesDetectionFace> _faces = [];

  /// The error describes a failed face detection and contains [MatchFacesErrorCode] codes.
  MatchFacesException? get error => _error;
  MatchFacesException? _error;

  MatchFacesDetection._privateConstructor();

  @visibleForTesting
  static MatchFacesDetection? fromJson(jsonObject) {
    var result = MatchFacesDetection._privateConstructor();

    result._image = MatchFacesImage.fromJson(jsonObject["image"])!;
    result._imageIndex = jsonObject["imageIndex"];
    for (var item in jsonObject["faces"]) {
      result.faces.add(MatchFacesDetectionFace.fromJson(item)!);
    }
    result._error = MatchFacesException.fromJson(jsonObject["error"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "imageIndex": imageIndex,
        "image": image.toJson(),
        "faces": faces.map((e) => e.toJson()).toList(),
        "error": error?.toJson(),
      }.clearNulls();
}
