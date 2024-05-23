part of "../../flutter_face_api.dart";

class SearchPersonImage extends PersonImage {
  double get similarity => _similarity;
  late double _similarity;

  double get distance => _distance;
  late double _distance;

  SearchPersonImage._privateConstructor() : super._privateConstructor();

  @visibleForTesting
  static SearchPersonImage? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = SearchPersonImage._privateConstructor();

    result._similarity = _toDouble(jsonObject["similarity"])!;
    result._distance = _toDouble(jsonObject["distance"])!;
    result._path = jsonObject["path"];
    result._url = jsonObject["url"];
    result._contentType = jsonObject["contentType"];
    result._id = jsonObject["id"];
    result._metadata = jsonObject["metadata"];
    result._createdAt = DateTime.parse(jsonObject["createdAt"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "similarity": similarity,
        "distance": distance,
        "path": path,
        "url": url,
        "contentType": contentType,
        "id": id,
        "metadata": metadata,
        "createdAt": createdAt.toString(),
      }.clearNulls();
}
