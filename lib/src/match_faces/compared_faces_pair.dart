part of "../../flutter_face_api.dart";

/// Represents a result of the [ComparedFace] attempt to compare input images.
class ComparedFacesPair {
  /// The first face in the comparison pair.
  ComparedFace get first => _first;
  late ComparedFace _first;

  /// The second face in the comparison pair.
  ComparedFace get second => _second;
  late ComparedFace _second;

  /// Similarity of the faces pair. Floating point value from 0 to 1.
  double get similarity => _similarity;
  late double _similarity;

  /// The raw value returned by the service without applying any thresholds or comparison rules.
  /// The value shows the degree of similarity of compared faces, the lower - the more similar, and vice versa less similar.
  /// The `score` is used in conjunction with the input image `imageType` to evaluate `similarity`.
  double get score => _score;
  late double _score;

  /// The error describes a failed pair comparison and contains [MatchFacesErrorCode] codes.
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
