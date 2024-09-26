part of "../../flutter_face_api.dart";

class DetectFacesBackendException {
  DetectFacesBackendErrorCode get code => _code;
  late DetectFacesBackendErrorCode _code;

  String get message => _message;
  late String _message;

  DetectFacesBackendException._privateConstructor();

  @visibleForTesting
  static DetectFacesBackendException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DetectFacesBackendException._privateConstructor();

    result._code = DetectFacesBackendErrorCode.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "code": code.value,
        "message": message,
      }.clearNulls();
}

enum DetectFacesBackendErrorCode {
  FR_FACE_NOT_DETECTED(2),
  FACER_NO_LICENSE(200),
  FACER_IS_NOT_INITIALIZED(201),
  FACER_COMMAND_IS_NOT_SUPPORTED(202),
  FACER_COMMAND_PARAMS_READ_ERROR(203),
  UNDEFINED(-1);

  const DetectFacesBackendErrorCode(this.value);
  final int value;

  static DetectFacesBackendErrorCode? getByValue(int? i) {
    if (i == null) return null;
    try {
      return DetectFacesBackendErrorCode.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return DetectFacesBackendErrorCode.UNDEFINED;
    }
  }
}
