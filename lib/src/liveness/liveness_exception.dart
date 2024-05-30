part of "../../flutter_face_api.dart";

class LivenessException {
  LivenessErrorCode get code => _code;
  late LivenessErrorCode _code;

  String get message => _message;
  late String _message;

  LivenessBackendException? get underlyingError => _underlyingError;
  LivenessBackendException? _underlyingError;

  LivenessException._privateConstructor();

  @visibleForTesting
  static LivenessException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = LivenessException._privateConstructor();

    result._code = LivenessErrorCode.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";
    result._underlyingError =
        LivenessBackendException.fromJson(jsonObject["underlyingError"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "code": code.value,
        "message": message,
        "underlyingError": underlyingError?.toJson(),
      }.clearNulls();
}

enum LivenessErrorCode {
  NOT_INITIALIZED(0),

  NO_LICENSE(1),

  API_CALL_FAILED(2),

  SESSION_START_FAILED(3),

  CANCELLED(4),

  PROCESSING_TIMEOUT(5),

  PROCESSING_FAILED(6),

  PROCESSING_FRAME_FAILED(7),

  APPLICATION_INACTIVE(8),

  CONTEXT_IS_NULL(9),

  IN_PROGRESS_ALREADY(10),

  ZOOM_NOT_SUPPORTED(11),

  CAMERA_NO_PERMISSION(12),

  CAMERA_NOT_AVAILABLE(13);

  const LivenessErrorCode(this.value);
  final int value;

  static LivenessErrorCode? getByValue(int? i) {
    if (i == null) return null;
    return LivenessErrorCode.values.firstWhere((x) => x.value == i);
  }
}
