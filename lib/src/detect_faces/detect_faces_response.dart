part of "../../flutter_face_api.dart";

class DetectFacesResponse {
  DetectFaceResult? get detection => _detection;
  DetectFaceResult? _detection;

  List<DetectFaceResult>? get allDetections => _allDetections;
  List<DetectFaceResult>? _allDetections;

  DetectFacesScenario? get scenario => _scenario;
  DetectFacesScenario? _scenario;

  DetectFacesException? get error => _error;
  DetectFacesException? _error;

  DetectFacesResponse._privateConstructor();

  @visibleForTesting
  static DetectFacesResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DetectFacesResponse._privateConstructor();

    result._detection = DetectFaceResult.fromJson(jsonObject["detection"]);
    if (jsonObject["allDetections"] != null) {
      result._allDetections = [];
      for (var item in jsonObject["allDetections"]) {
        result._allDetections!.add(DetectFaceResult.fromJson(item)!);
      }
    }
    result._scenario = DetectFacesScenario.getByValue(jsonObject["scenario"]);
    result._error = DetectFacesException.fromJson(jsonObject["error"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "detection": detection?.toJson(),
        "allDetections": allDetections?.map((e) => e.toJson()).toList(),
        "scenario": scenario?.value,
        "error": error?.toJson(),
      }.clearNulls();
}
