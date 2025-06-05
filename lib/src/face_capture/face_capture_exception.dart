part of "../../flutter_face_api.dart";

class FaceCaptureException {
  FaceCaptureErrorCode get code => _code;
  late FaceCaptureErrorCode _code;

  String get message => _message;
  late String _message;

  FaceCaptureException._privateConstructor();

  @visibleForTesting
  static FaceCaptureException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = FaceCaptureException._privateConstructor();

    result._code = FaceCaptureErrorCode.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "code": code.value,
        "message": message,
      }.clearNulls();
}

enum FaceCaptureErrorCode {
  CANCEL(0),
  TIMEOUT(1),
  NOT_INITIALIZED(2),
  SESSION_START_FAILED(3),
  CAMERA_NOT_AVAILABLE(4),
  CAMERA_NO_PERMISSION(5),
  IN_PROGRESS_ALREADY(6),
  CONTEXT_IS_NULL(7);

  const FaceCaptureErrorCode(this.value);
  final int value;

  static FaceCaptureErrorCode? getByValue(int? i) {
    if (i == null) return null;
    if (i >= 600) i = i - 600;
    return FaceCaptureErrorCode.values.firstWhere((x) => x.value == i);
  }
}
