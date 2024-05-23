part of "../../flutter_face_api.dart";

class LivenessResponse {
  Uint8List? get image => _image;
  Uint8List? _image;

  LivenessStatus get liveness => _liveness;
  late LivenessStatus _liveness;

  String? get tag => _tag;
  String? _tag;

  String? get transactionId => _transactionId;
  String? _transactionId;

  int? get estimatedAge => _estimatedAge;
  int? _estimatedAge;

  LivenessException? get error => _error;
  LivenessException? _error;

  LivenessResponse._privateConstructor();

  @visibleForTesting
  static LivenessResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessResponse._privateConstructor();

    result._image = _bytesFromBase64(jsonObject["image"]);
    result._liveness = LivenessStatus.getByValue(jsonObject["liveness"])!;
    result._tag = jsonObject["tag"];
    result._transactionId = jsonObject["transactionId"];
    result._estimatedAge = jsonObject["estimatedAge"];
    result._error = LivenessException.fromJson(jsonObject["error"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "image": _bytesToBase64(image),
        "liveness": liveness.value,
        "tag": tag,
        "transactionId": transactionId,
        "estimatedAge": estimatedAge,
        "error": error?.toJson(),
      }.clearNulls();
}

enum LivenessStatus {
  PASSED(0),
  UNKNOWN(1);

  const LivenessStatus(this.value);
  final int value;

  static LivenessStatus? getByValue(int? i) {
    if (i == null) return null;
    return LivenessStatus.values.firstWhere((x) => x.value == i);
  }
}
