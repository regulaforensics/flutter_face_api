part of "../../flutter_face_api.dart";

/// A configuration file for FaceSDK initialization.
/// Allows to initialize using license binary.
/// Also controls initialization time properties such as licenseUpdate.
class InitConfig {
  /// The license binary file.
  ByteData get license => _license;
  ByteData _license;

  /// Enables automatic license update check during [FaceSDK] initialization.
  bool? get licenseUpdate => _licenseUpdate;
  bool? _licenseUpdate;

  InitConfig(
    ByteData license, {
    bool? licenseUpdate,
  })  : _license = license,
        _licenseUpdate = licenseUpdate;

  @visibleForTesting
  static InitConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    return InitConfig(
      _dataFromBase64(jsonObject["license"])!,
      licenseUpdate: jsonObject["licenseUpdate"],
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "license": _dataToBase64(license),
        "licenseUpdate": licenseUpdate,
      }.clearNulls();
}
