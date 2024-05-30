part of "../../flutter_face_api.dart";

class LicenseException {
  LicensingResultCode get code => _code;
  late LicensingResultCode _code;

  String get message => _message;
  late String _message;

  LicenseException._privateConstructor();

  @visibleForTesting
  static LicenseException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = LicenseException._privateConstructor();

    result._code = LicensingResultCode.getByValue(jsonObject["code"])!;
    result._message = jsonObject["message"] ?? "";

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "code": code.value,
        "message": message,
      }.clearNulls();
}

enum LicensingResultCode {
  OK(0),
  LICENSE_CORRUPTED(1),
  INVALID_DATE(2),
  INVALID_VERSION(3),
  INVALID_DEVICE_ID(4),
  INVALID_SYSTEM_OR_APP_ID(5),
  NO_CAPABILITIES(6),
  NO_AUTHENTICITY(7),
  LICENSE_ABSENT(8),
  NO_INTERNET(9),
  NO_DATABASE(10),
  DATABASE_INCORRECT(11);

  const LicensingResultCode(this.value);
  final int value;

  static LicensingResultCode? getByValue(int? i) {
    if (i == null) return null;
    return LicensingResultCode.values.firstWhere((x) => x.value == i);
  }
}
