part of "../../flutter_face_api.dart";

class ComparedFace {
  int get imageIndex => _imageIndex;
  late int _imageIndex;

  MatchFacesImage get image => _image;
  late MatchFacesImage _image;

  int? get faceIndex => _faceIndex;
  int? _faceIndex;

  MatchFacesDetectionFace? get face => _face;
  MatchFacesDetectionFace? _face;

  ComparedFace._privateConstructor();

  @visibleForTesting
  static ComparedFace? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ComparedFace._privateConstructor();

    result._imageIndex = jsonObject["imageIndex"];
    result._image = MatchFacesImage.fromJson(jsonObject["image"])!;
    result._faceIndex = jsonObject["faceIndex"];
    result._face = MatchFacesDetectionFace.fromJson(jsonObject["face"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "imageIndex": imageIndex,
        "image": image.toJson(),
        "faceIndex": faceIndex,
        "face": face?.toJson(),
      }.clearNulls();
}
