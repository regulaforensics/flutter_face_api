part of "../../flutter_face_api.dart";

/// Person Database object that represents Group of [Person].
class PersonGroup {
  /// PersonGroup name.
  /// Updatable field.
  late String name;

  String get id => _id;
  late String _id;

  /// A free-form object containing Group extended attributes.
  /// Updatable field.
  dynamic metadata;

  DateTime get createdAt => _createdAt;
  late DateTime _createdAt;

  PersonGroup._privateConstructor();

  @visibleForTesting
  static PersonGroup? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = PersonGroup._privateConstructor();

    result.name = jsonObject["name"];
    result._id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result._createdAt = DateTime.parse(jsonObject["createdAt"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "metadata": metadata,
        "createdAt": createdAt.toString(),
      }.clearNulls();
}
