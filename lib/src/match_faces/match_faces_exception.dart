part of "../../flutter_face_api.dart";

class MatchFacesException {
  MatchFacesErrorCode get code => _code;
  late MatchFacesErrorCode _code;

  String get message => _message;
  late String _message;

  MatchFacesBackendException? get underlyingError => _underlyingError;
  MatchFacesBackendException? _underlyingError;

  MatchFacesException._privateConstructor();

  @visibleForTesting
  static MatchFacesException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = MatchFacesException._privateConstructor();

    result._code = MatchFacesErrorCode.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";
    result._underlyingError = MatchFacesBackendException.fromJson(
      jsonObject["underlyingError"],
    );

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "code": code.value,
        "message": message,
        "underlyingError": underlyingError?.toJson(),
      }.clearNulls();
}

enum MatchFacesErrorCode {
  IMAGE_EMPTY(0),
  FACE_NOT_DETECTED(1),
  LANDMARKS_NOT_DETECTED(2),
  FACE_ALIGNER_FAILED(3),
  DESCRIPTOR_EXTRACTOR_ERROR(4),
  IMAGES_COUNT_LIMIT_EXCEEDED(5),
  API_CALL_FAILED(6),
  PROCESSING_FAILED(7),
  NO_LICENSE(8);

  const MatchFacesErrorCode(this.value);
  final int value;

  static MatchFacesErrorCode? getByValue(int? i) {
    if (i == null) return null;
    return MatchFacesErrorCode.values.firstWhere((x) => x.value == i);
  }
}
