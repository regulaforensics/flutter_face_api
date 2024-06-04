part of "../../flutter_face_api.dart";

/// A PersonData object that represents Image linked with a Person.
class PersonImage {
  /// Image s3 path.
  String get path => _path;
  late String _path;

  /// Full URL for Image.
  String get url => _url;
  late String _url;

  /// The original media type of the uploaded image.
  /// PersonDatabase applies default content-type if it isn't specified during upload.
  String get contentType => _contentType;
  late String _contentType;

  String get id => _id;
  late String _id;

  dynamic get metadata => _metadata;
  dynamic _metadata;

  DateTime get createdAt => _createdAt;
  late DateTime _createdAt;

  PersonImage._privateConstructor();

  @visibleForTesting
  static PersonImage? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = PersonImage._privateConstructor();

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
        "path": path,
        "url": url,
        "contentType": contentType,
        "id": id,
        "metadata": metadata,
        "createdAt": createdAt.toString(),
      }.clearNulls();
}
