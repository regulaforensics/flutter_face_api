part of "../../flutter_face_api.dart";

/// The response from the [MatchFacesRequest].
class MatchFacesResponse {
  /// Face comparison results with score and similarity values.
  List<ComparedFacesPair> get results => _results;
  List<ComparedFacesPair> _results = [];

  /// Face detection results for each given image.
  List<MatchFacesDetection> get detections => _detections;
  List<MatchFacesDetection> _detections = [];

  String? get tag => _tag;
  String? _tag;

  /// The error describes a failed match faces request and contains [MatchFacesErrorCode] codes.
  MatchFacesException? get error => _error;
  MatchFacesException? _error;

  MatchFacesResponse._privateConstructor();

  @visibleForTesting
  static MatchFacesResponse? fromJson(jsonObject) {
    var result = MatchFacesResponse._privateConstructor();

    for (var item in jsonObject["results"]) {
      result._results.add(ComparedFacesPair.fromJson(item)!);
    }
    for (var item in jsonObject["detections"]) {
      result._detections.add(MatchFacesDetection.fromJson(item)!);
    }
    result._tag = jsonObject["tag"];
    result._error = MatchFacesException.fromJson(jsonObject["error"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "results": results.map((e) => e.toJson()).toList(),
        "detections": detections.map((e) => e.toJson()).toList(),
        "tag": tag,
        "error": error?.toJson(),
      }.clearNulls();
}
