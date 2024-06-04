part of "../../flutter_face_api.dart";

class DetectFacesException {
  DetectFacesErrorCode get code => _code;
  late DetectFacesErrorCode _code;

  String get message => _message;
  late String _message;

  DetectFacesBackendException? get underlyingError => _underlyingError;
  DetectFacesBackendException? _underlyingError;

  DetectFacesException._privateConstructor();

  @visibleForTesting
  static DetectFacesException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DetectFacesException._privateConstructor();

    result._code = DetectFacesErrorCode.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";
    result._underlyingError =
        DetectFacesBackendException.fromJson(jsonObject["underlyingError"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "code": code.value,
        "message": message,
        "underlyingError": underlyingError?.toJson(),
      }.clearNulls();
}

/// Error codes for the RFSDetectFacesResponse errors.
enum DetectFacesErrorCode {
  IMAGE_EMPTY(0),
  FR_FACE_NOT_DETECTED(1),
  FACER_NO_LICENSE(2),
  FACER_IS_NOT_INITIALIZED(3),
  FACER_COMMAND_IS_NOT_SUPPORTED(4),
  FACER_COMMAND_PARAMS_READ_ERROR(5),
  PROCESSING_FAILED(6),
  REQUEST_FAILED(7),
  API_CALL_FAILED(8);

  const DetectFacesErrorCode(this.value);
  final int value;

  static DetectFacesErrorCode? getByValue(int? i) {
    if (i == null) return null;
    return DetectFacesErrorCode.values.firstWhere((x) => x.value == i);
  }
}
