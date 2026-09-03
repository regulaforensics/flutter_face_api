part of "../../flutter_face_api.dart";

class ErrorResponse {
  int get code => _code;
  late int _code;

  String get message => _message;
  late String _message;

  ErrorResponse._privateConstructor();

  @visibleForTesting
  static ErrorResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = ErrorResponse._privateConstructor();

    result._code = jsonObject["code"];
    result._message = jsonObject["message"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      }.clearNulls();
}
