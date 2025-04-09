part of "../../flutter_face_api.dart";

class LivenessBackendException {
  LivenessBackendErrorCode get code => _code;
  late LivenessBackendErrorCode _code;

  String get message => _message;
  late String _message;

  LivenessBackendException._privateConstructor();

  @visibleForTesting
  static LivenessBackendException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = LivenessBackendException._privateConstructor();

    result._code = LivenessBackendErrorCode.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {"code": code.value, "message": message}.clearNulls();
}

enum LivenessBackendErrorCode {
  UNDEFINED(-1),
  NO_LICENSE(200),
  NOT_INITIALIZED(201),
  COMMAND_IS_NOT_SUPPORTED(202),
  PARAMS_READ_ERROR(203),
  LOW_QUALITY(231),
  TRACK_BREAK(246),
  CLOSED_EYES_DETECTED(230),
  HIGH_ASYMMETRY(232),
  FACE_OVER_EMOTIONAL(233),
  SUNGLASSES_DETECTED(234),
  SMALL_AGE(235),
  HEADDRESS_DETECTED(236),
  MEDICINE_MASK_DETECTED(239),
  OCCLUSION_DETECTED(240),
  FOREHEAD_GLASSES_DETECTED(242),
  MOUTH_OPENED(243),
  ART_MASK_DETECTED(244),
  NOT_MATCHED(237),
  IMAGES_COUNT_LIMIT_EXCEEDED(238),
  ELECTRONIC_DEVICE_DETECTED(245),
  WRONG_GEO(247),
  WRONG_OF(248),
  WRONG_VIEW(249);

  const LivenessBackendErrorCode(this.value);
  final int value;

  static LivenessBackendErrorCode? getByValue(int? i) {
    if (i == null) return null;
    return LivenessBackendErrorCode.values.firstWhere((x) => x.value == i);
  }
}
