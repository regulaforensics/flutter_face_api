part of "../../flutter_face_api.dart";

class LivenessNotification {
  LivenessProcessStatus get status => _status;
  late LivenessProcessStatus _status;

  LivenessResponse? get response => _response;
  LivenessResponse? _response;

  LivenessNotification._privateConstructor();

  @visibleForTesting
  static LivenessNotification? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessNotification._privateConstructor();

    result._status = LivenessProcessStatus.getByValue(jsonObject["status"])!;
    result._response = LivenessResponse.fromJson(jsonObject["response"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "status": status.value,
        "response": response?.toJson(),
      }.clearNulls();
}

/// Liveness process statuses.
enum LivenessProcessStatus {
  START(0),
  PREPARING(1),
  NEW_SESSION(2),
  NEXT_STAGE(3),
  SECTOR_CHANGED(4),
  PROGRESS(5),
  LOW_BRIGHTNESS(6),
  FIT_FACE(7),
  MOVE_AWAY(8),
  MOVE_CLOSER(9),
  TURN_HEAD(10),
  PROCESSING(11),
  FAILED(12),
  RETRY(13),
  SUCCESS(14);

  const LivenessProcessStatus(this.value);
  final int value;

  static LivenessProcessStatus? getByValue(int? i) {
    if (i == null) return null;
    return LivenessProcessStatus.values.firstWhere((x) => x.value == i);
  }
}

typedef LivenessNotificationCompletion = void Function(LivenessNotification);
