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

  bool _useBleDevice = false;

  /// Constructor for initialization using a ble device.
  /// Doesn't need a license file, it will be fetched automatically from your ble device.
  ///
  /// Requires [DocumentReader](https://pub.dev/packages/flutter_document_reader_api) to be initialized with ble device.
  InitConfig.withBleDevice() : _license = ByteData(0) {
    _useBleDevice = true;
  }

  InitConfig(
    ByteData license, {
    bool? licenseUpdate,
  })  : _license = license,
        _licenseUpdate = licenseUpdate;

  @visibleForTesting
  static InitConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    var result = InitConfig(
      _dataFromBase64(jsonObject["license"])!,
      licenseUpdate: jsonObject["licenseUpdate"],
    );
    result._useBleDevice = jsonObject["useBleDevice"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "license": _dataToBase64(license),
        "licenseUpdate": licenseUpdate,
        "useBleDevice": _useBleDevice,
      }.clearNulls();
}
