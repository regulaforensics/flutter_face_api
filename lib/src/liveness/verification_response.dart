part of "../../flutter_face_api.dart";

class VerificationResponse {
  bool get verified => _verified;
  bool _verified;

  Person? get person => _person;
  Person? _person;

  VerificationMatchResponse? get match => _match;
  VerificationMatchResponse? _match;

  VerificationResponse._privateConstructor() : _verified = false;

  @visibleForTesting
  static VerificationResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new VerificationResponse._privateConstructor();

    result._verified = jsonObject["verified"];
    result._person = Person.fromJson(jsonObject["person"]);
    result._match = VerificationMatchResponse.fromJson(jsonObject["match"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "verified": verified,
        "person": person?.toJson(),
        "match": match?.toJson(),
      }.clearNulls();
}
