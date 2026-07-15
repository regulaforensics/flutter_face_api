// part of "../../flutter_face_api.dart";

// class VerificationResponse {
//   bool get passed => _passed;
//   bool _passed;

//   VerifyMatchResponse? get match => _match;
//   VerifyMatchResponse? _match;

//   ErrorResponse? get error => _error;
//   ErrorResponse? _error;

//   VerificationResponse._privateConstructor() : _passed = false;

//   @visibleForTesting
//   static VerificationResponse? fromJson(jsonObject) {
//     if (jsonObject == null) return null;
//     var result = new VerificationResponse._privateConstructor();

//     result._passed = jsonObject["passed"];
//     result._match = VerifyMatchResponse.fromJson(jsonObject["match"]);
//     result._error = ErrorResponse.fromJson(jsonObject["error"]);

//     return result;
//   }

//   @visibleForTesting
//   Map<String, dynamic> toJson() => {
//         "passed": passed,
//         "match": match?.toJson(),
//         "error": error?.toJson(),
//       }.clearNulls();
// }
