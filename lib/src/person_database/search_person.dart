part of "../../flutter_face_api.dart";

/// A Person Database object that represents th result of Person search.
class SearchPerson extends Person {
  /// Array of images where the Person is found.
  List<SearchPersonImage> get images => _images;
  List<SearchPersonImage> _images = [];

  /// Detection data relative to the search input image.
  SearchPersonDetection? get detection => _detection;
  SearchPersonDetection? _detection;

  SearchPerson._privateConstructor() : super._privateConstructor();

  @visibleForTesting
  static SearchPerson fromJson(jsonObject) {
    var result = SearchPerson._privateConstructor();

    if (jsonObject["images"] != null) {
      for (var item in jsonObject["images"]) {
        result._images.add(SearchPersonImage.fromJson(item)!);
      }
    }
    result._detection = SearchPersonDetection.fromJson(jsonObject["detection"]);
    result.name = result.name = jsonObject["name"];
    result._updatedAt = DateTime.parse(jsonObject["updatedAt"]);
    result._groups = jsonObject["groups"];
    result._id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result._createdAt = DateTime.parse(jsonObject["createdAt"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "images": images.map((e) => e.toJson()),
        "detection": detection?.toJson(),
        "name": name,
        "updatedAt": updatedAt.toString(),
        "groups": groups,
        "id": id,
        "metadata": metadata,
        "createdAt": createdAt.toString(),
      }.clearNulls();
}
