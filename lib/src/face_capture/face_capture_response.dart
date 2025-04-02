part of "../../flutter_face_api.dart";

class FaceCaptureResponse {
  FaceCaptureImage? get image => _image;
  FaceCaptureImage? _image;

  FaceCaptureException? get error => _error;
  FaceCaptureException? _error;

  FaceCaptureResponse._privateConstructor();

  @visibleForTesting
  static FaceCaptureResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceCaptureResponse._privateConstructor();

    result._image = FaceCaptureImage.fromJson(jsonObject["image"]);
    result._error = FaceCaptureException.fromJson(jsonObject["error"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {"image": image?.toJson(), "error": error?.toJson()}.clearNulls();
}
