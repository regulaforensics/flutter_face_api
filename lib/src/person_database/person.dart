part of "../../flutter_face_api.dart";

/// A Person Database object that represents Person.
class Person {
  /// Person name.
  /// Updatable field.
  String? name;

  /// Person update date.
  DateTime? updatedAt;

  /// Array if Group IDs Person belongs to.
  List<String>? groups;

  String? id;

  /// A free-form object containing Person extended attributes.
  /// Updatable field.
  dynamic metadata;

  DateTime? get createdAt => _createdAt;
  DateTime? _createdAt;

  String? externalId;

  DateTime? expireAt;

  int? ttl;

  @visibleForTesting
  static Person? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Person();

    result.name = jsonObject["name"];
    result.updatedAt = DateTime.parse(jsonObject["updatedAt"]);
    result.groups = _stringListFrom((jsonObject["groups"]))!;
    result.id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result._createdAt = DateTime.parse(jsonObject["createdAt"]);
    result.externalId = jsonObject["externalId"];
    result.expireAt = switch (jsonObject['expireAt']) {
      String s => DateTime.parse(s),
      _ => null,
    };
    result.ttl = jsonObject["ttl"];

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
        "externalId": externalId,
        "expireAt": expireAt?.toString(),
        "ttl": ttl,
      }.clearNulls();
}
