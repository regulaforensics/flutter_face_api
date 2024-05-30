part of "../../flutter_face_api.dart";

class ComparedFacesPair {
  ComparedFace get first => _first;
  late ComparedFace _first;

  ComparedFace get second => _second;
  late ComparedFace _second;

  double get similarity => _similarity;
  late double _similarity;

  double get score => _score;
  late double _score;

  MatchFacesException? get error => _error;
  MatchFacesException? _error;

  ComparedFacesPair._privateConstructor();

  @visibleForTesting
  static ComparedFacesPair? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ComparedFacesPair._privateConstructor();

    result._first = ComparedFace.fromJson(jsonObject["first"])!;
    result._second = ComparedFace.fromJson(jsonObject["second"])!;
    result._similarity = _toDouble(jsonObject["similarity"])!;
    result._score = _toDouble(jsonObject["score"])!;
    result._error = MatchFacesException.fromJson(jsonObject["error"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "first": first.toJson(),
        "second": second.toJson(),
        "similarity": similarity,
        "score": score,
        "error": error?.toJson(),
      }.clearNulls();
}
