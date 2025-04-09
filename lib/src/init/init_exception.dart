part of "../../flutter_face_api.dart";

class InitException {
  InitErrorCode get code => _code;
  late InitErrorCode _code;

  String get message => _message;
  late String _message;

  LicenseException? get underlyingError => _underlyingError;
  LicenseException? _underlyingError;

  InitException._privateConstructor();

  @visibleForTesting
  static InitException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = InitException._privateConstructor();

    result._code = InitErrorCode.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";
    result._underlyingError = LicenseException.fromJson(
      jsonObject["underlyingError"],
    );

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "code": code.value,
        "message": message,
        "underlyingError": underlyingError?.toJson(),
      }.clearNulls();
}

enum InitErrorCode {
  IN_PROGRESS_ALREADY(0),

  MISSING_CORE(1),

  INTERNAL_CORE_ERROR(2),

  BAD_LICENSE(3),

  UNAVAILABLE(4),

  CONTEXT_IS_NULL(100),

  RESOURCE_DAT_ABSENT(101),

  LICENSE_IS_NULL(102);

  const InitErrorCode(this.value);
  final int value;

  static InitErrorCode? getByValue(int? i) {
    if (i == null) return null;
    return InitErrorCode.values.firstWhere((x) => x.value == i);
  }
}
