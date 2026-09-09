part of "../../flutter_face_api.dart";

class VerificationMatchResponse {
  bool get verified => _verified;
  bool _verified;

  double get similarity => _similarity;
  double _similarity;

  VerificationMatchResponse._privateConstructor()
      : _verified = false,
        _similarity = 0;

  @visibleForTesting
  static VerificationMatchResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new VerificationMatchResponse._privateConstructor();

    result._verified = jsonObject["verified"];
    result._similarity = _toDouble(jsonObject["similarity"])!;

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "verified": verified,
        "similarity": similarity,
      }.clearNulls();
}
