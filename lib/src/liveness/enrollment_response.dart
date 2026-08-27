part of "../../flutter_face_api.dart";

class EnrollmentResponse {
  String? get personId => _personId;
  String? _personId;

  String? get externalId => _externalId;
  String? _externalId;

  ErrorResponse? get error => _error;
  ErrorResponse? _error;

  EnrollmentResponse._privateConstructor();

  @visibleForTesting
  static EnrollmentResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new EnrollmentResponse._privateConstructor();

    result._personId = jsonObject["personId"];
    result._externalId = jsonObject["externalId"];
    result._error = ErrorResponse.fromJson(jsonObject["error"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "personId": personId,
        "externalId": externalId,
        "error": error?.toJson(),
      }.clearNulls();
}
