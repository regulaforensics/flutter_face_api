part of "../../flutter_face_api.dart";

class MatchFacesBackendException {
  int get code => _code;
  late int _code;

  String get message => _message;
  late String _message;

  MatchFacesBackendException._privateConstructor();

  @visibleForTesting
  static MatchFacesBackendException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = MatchFacesBackendException._privateConstructor();

    result._code = jsonObject["code"];
    result._message = jsonObject["message"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {"code": code, "message": message}.clearNulls();
}
