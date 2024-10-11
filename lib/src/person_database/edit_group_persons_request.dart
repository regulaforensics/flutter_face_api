part of "../../flutter_face_api.dart";

class EditGroupPersonsRequest {
  List<String>? _personIdsToAdd;
  List<String>? _personIdsToRemove;

  EditGroupPersonsRequest(
    List<String>? personIdsToAdd,
    List<String>? personIdsToRemove,
  )   : _personIdsToAdd = personIdsToAdd,
        _personIdsToRemove = personIdsToRemove;

  @visibleForTesting
  static EditGroupPersonsRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return EditGroupPersonsRequest(
      _stringListFrom(jsonObject["personIdsToAdd"]),
      _stringListFrom(jsonObject["personIdsToRemove"]),
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "personIdsToAdd": _personIdsToAdd,
        "personIdsToRemove": _personIdsToRemove,
      }.clearNulls();
}
