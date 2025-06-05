part of "../../flutter_face_api.dart";

class ComparedFacesSplit {
  List<ComparedFacesPair> get matchedFaces => _matchedFaces;
  List<ComparedFacesPair> _matchedFaces = [];

  List<ComparedFacesPair> get unmatchedFaces => _unmatchedFaces;
  List<ComparedFacesPair> _unmatchedFaces = [];

  ComparedFacesSplit._privateConstructor();

  @visibleForTesting
  static ComparedFacesSplit? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ComparedFacesSplit._privateConstructor();

    for (var item in jsonObject["matchedFaces"]) {
      result._matchedFaces.add(ComparedFacesPair.fromJson(item)!);
    }
    for (var item in jsonObject["unmatchedFaces"]) {
      result._unmatchedFaces.add(ComparedFacesPair.fromJson(item)!);
    }

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "matchedFaces": matchedFaces.map((e) => e.toJson()).toList(),
        "unmatchedFaces": unmatchedFaces.map((e) => e.toJson()).toList(),
      }.clearNulls();
}
