part of "../../flutter_face_api.dart";

class VerifyMatchResponse {
  bool get passed => _passed;
  bool _passed;

  double get similarity => _similarity;
  double _similarity;

  VerifyMatchResponse._privateConstructor()
      : _passed = false,
        _similarity = 0;

  @visibleForTesting
  static VerifyMatchResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new VerifyMatchResponse._privateConstructor();

    result._passed = jsonObject["passed"];
    result._similarity = _toDouble(jsonObject["similarity"])!;

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "passed": passed,
        "similarity": similarity,
      }.clearNulls();
}
