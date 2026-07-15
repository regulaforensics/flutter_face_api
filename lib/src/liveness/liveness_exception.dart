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
  /// FaceSDK Core is not initialized.
  NOT_INITIALIZED(0),

  /// There is no valid license on the service.
  NO_LICENSE(1),

  /// Liveness API call failed due to networking error or backend internal error.
  API_CALL_FAILED(2),

  /// Failed when Core could not start new session.
  SESSION_START_FAILED(3),

  /// User cancelled liveness processing.
  CANCELLED(4),

  /// Processing finished by timeout.
  PROCESSING_TIMEOUT(5),

  /// Processing failed.
  PROCESSING_FAILED(6),

  /// Failed when Core cannot recognize frame.
  PROCESSING_FRAME_FAILED(7),

  /// Client application did enter the background, liveness process interrupted.
  APPLICATION_INACTIVE(8),

  /// Processing finished by bad face quality.
  BAD_FACE_QUALITY(9),

  /// Processing finished by bad frame size.
  BAD_FRAME_SIZE(10),

  /// Device has no available camera.
  CAMERA_NOT_AVAILABLE(11),

  /// Application does not have camera permission.
  CAMERA_NO_PERMISSION(12),

  /// Application context is null.
  ///
  /// Android only.
  CONTEXT_IS_NULL(13),

  /// Liveness process already in progress.
  ///
  /// Android only.
  IN_PROGRESS_ALREADY(14),

  /// The camera on the current device doesn't support zoom change.
  ///
  /// Android only.
  ZOOM_NOT_SUPPORTED(15);

  const LivenessErrorCode(this.value);
  final int value;

  static LivenessErrorCode? getByValue(int? i) {
    if (i == null) return null;
    return LivenessErrorCode.values.firstWhere((x) => x.value == i);
  }
}
