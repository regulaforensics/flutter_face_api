part of "../../flutter_face_api.dart";

/// `PersonDatabase` represents Regula Database layer and is the entry point for Person Database operations.
class PersonDatabase {
  PersonDatabase._privateConstructor();

  Future<(Person?, String?)> createPerson(
    String name, {
    List<String> groupIds = const [],
    dynamic metadata,
  }) async {
    var response = await _bridge.invokeMethod("createPerson", [
      name,
      groupIds,
      metadata,
    ]);
    return _itemResponseFromJson(response, Person.fromJson);
  }

  Future<(bool, String?)> updatePerson(Person person) async {
    var response = await _bridge.invokeMethod(
      "updatePerson",
      [person.toJson()],
    );
    return _successResponseFromJson(response);
  }

  Future<(bool, String?)> deletePerson(String personId) async {
    var response = await _bridge.invokeMethod("deletePerson", [personId]);
    return _successResponseFromJson(response);
  }

  Future<(Person?, String?)> getPerson(String personId) async {
    var response = await _bridge.invokeMethod("getPerson", [personId]);
    return _itemResponseFromJson(response, Person.fromJson);
  }

  Future<(PersonImage?, String?)> addPersonImage(
    String personId,
    ImageUpload image,
  ) async {
    var response = await _bridge.invokeMethod("addPersonImage", [
      personId,
      image.toJson(),
    ]);
    return _itemResponseFromJson(response, PersonImage.fromJson);
  }

  Future<(bool, String?)> deletePersonImage(
    String personId,
    String imageId,
  ) async {
    var response = await _bridge.invokeMethod("deletePersonImage", [
      personId,
      imageId,
    ]);
    return _successResponseFromJson(response);
  }

  Future<(PersonImage?, String?)> getPersonImage(
    String personId,
    String imageId,
  ) async {
    var response = await _bridge.invokeMethod("getPersonImage", [
      personId,
      imageId,
    ]);
    return _itemResponseFromJson(response, PersonImage.fromJson);
  }

  Future<(PageableItemList<PersonImage>, String?)> getPersonImages(
    String personId,
  ) async {
    var response = await _bridge.invokeMethod("getPersonImages", [personId]);
    return _listResponseFromJson(response, PersonImage.fromJson);
  }

  Future<(PageableItemList<PersonImage>, String?)> getPersonImagesForPage(
    String personId,
    int page,
    int size,
  ) async {
    var response = await _bridge.invokeMethod("getPersonImagesForPage", [
      personId,
      page,
      size,
    ]);
    return _listResponseFromJson(response, PersonImage.fromJson);
  }

  Future<(PersonGroup?, String?)> createGroup(
    String name, {
    dynamic metadata,
  }) async {
    var response = await _bridge.invokeMethod("createGroup", [
      name,
      metadata,
    ]);
    return _itemResponseFromJson(response, PersonGroup.fromJson);
  }

  Future<(bool, String?)> updateGroup(PersonGroup group) async {
    var response = await _bridge.invokeMethod(
      "updateGroup",
      [group.toJson()],
    );
    return _successResponseFromJson(response);
  }

  Future<(bool, String?)> editPersonsInGroup(
    String groupId,
    EditGroupPersonsRequest request,
  ) async {
    var response = await _bridge.invokeMethod("editPersonsInGroup", [
      groupId,
      request.toJson(),
    ]);
    return _successResponseFromJson(response);
  }

  Future<(bool, String?)> deleteGroup(String groupId) async {
    var response = await _bridge.invokeMethod("deleteGroup", [groupId]);
    return _successResponseFromJson(response);
  }

  Future<(PersonGroup?, String?)> getGroup(String groupId) async {
    var response = await _bridge.invokeMethod("getGroup", [groupId]);
    return _itemResponseFromJson(response, PersonGroup.fromJson);
  }

  Future<(PageableItemList<PersonGroup>, String?)> getGroups() async {
    var response = await _bridge.invokeMethod("getGroups", []);
    return _listResponseFromJson(response, PersonGroup.fromJson);
  }

  Future<(PageableItemList<PersonGroup>, String?)> getGroupsForPage(
    int page,
    int size,
  ) async {
    var response = await _bridge.invokeMethod("getGroupsForPage", [
      page,
      size,
    ]);
    return _listResponseFromJson(response, PersonGroup.fromJson);
  }

  Future<(PageableItemList<PersonGroup>, String?)> getPersonGroups(
    String personId,
  ) async {
    var response = await _bridge.invokeMethod("getPersonGroups", [personId]);
    return _listResponseFromJson(response, PersonGroup.fromJson);
  }

  Future<(PageableItemList<PersonGroup>, String?)> getPersonGroupsForPage(
    String personId,
    int page,
    int size,
  ) async {
    var response = await _bridge.invokeMethod("getPersonGroupsForPage", [
      personId,
      page,
      size,
    ]);
    return _listResponseFromJson(response, PersonGroup.fromJson);
  }

  Future<(PageableItemList<Person>, String?)> getPersonsInGroup(
    String groupId,
  ) async {
    var response = await _bridge.invokeMethod("getPersonsInGroup", [groupId]);
    return _listResponseFromJson(response, Person.fromJson);
  }

  Future<(PageableItemList<Person>, String?)> getPersonsInGroupForPage(
    String groupId,
    int page,
    int size,
  ) async {
    var response = await _bridge.invokeMethod("getPersonsInGroupForPage", [
      groupId,
      page,
      size,
    ]);
    return _listResponseFromJson(response, Person.fromJson);
  }

  Future<(SearchPerson, String?)> searchPerson(
    SearchPersonRequest request,
  ) async {
    var response = await _bridge.invokeMethod(
      "searchPerson",
      [request.toJson()],
    );
    return _itemResponseFromJson(response, SearchPerson.fromJson);
  }

  (bool, String?) _successResponseFromJson(String jsonString) {
    var jsonObject = _decode(jsonString);
    var data = jsonObject["data"];
    var error = jsonObject["error"];
    bool success = data ?? false;
    return (success, error);
  }

  (T, String?) _itemResponseFromJson<T>(
    String jsonString,
    T Function(dynamic) fromJSON,
  ) {
    var jsonObject = _decode(jsonString);
    var data = fromJSON(jsonObject["data"])!;
    var error = jsonObject["error"];
    return (data, error);
  }

  (PageableItemList<T>, String?) _listResponseFromJson<T>(
    String jsonString,
    T? Function(dynamic) fromJSON,
  ) {
    var jsonObject = _decode(jsonString);
    var data = PageableItemList.fromJson(jsonObject["data"], fromJSON)!;
    var error = jsonObject["error"];
    return (data, error);
  }
}
