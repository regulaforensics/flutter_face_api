part of "../../flutter_face_api.dart";

/// A Person Database object that represents Person.
class Person {
  /// Person name.
  /// Updatable field.
  late String name;

  /// Person update date.
  DateTime get updatedAt => _updatedAt;
  late DateTime _updatedAt;

  /// Array if Group IDs Person belongs to.
  List<String> get groups => _groups;
  late List<String> _groups;

  String get id => _id;
  late String _id;

  /// A free-form object containing Person extended attributes.
  /// Updatable field.
  dynamic metadata;

  DateTime get createdAt => _createdAt;
  late DateTime _createdAt;

  Person._privateConstructor();

  @visibleForTesting
  static Person? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = Person._privateConstructor();

    result.name = jsonObject["name"];
    result._updatedAt = DateTime.parse(jsonObject["updatedAt"]);
    result._groups = jsonObject["groups"];
    result._id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result._createdAt = DateTime.parse(jsonObject["createdAt"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "name": name,
        "updatedAt": updatedAt.toString(),
        "groups": groups,
        "id": id,
        "metadata": metadata,
        "createdAt": createdAt.toString(),
      }.clearNulls();
}
