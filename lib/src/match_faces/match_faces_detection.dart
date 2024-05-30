part of "../../flutter_face_api.dart";

class MatchFacesDetection {
  int get imageIndex => _imageIndex;
  late int _imageIndex;

  MatchFacesImage get image => _image;
  late MatchFacesImage _image;

  List<MatchFacesDetectionFace> get faces => _faces;
  List<MatchFacesDetectionFace> _faces = [];

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
