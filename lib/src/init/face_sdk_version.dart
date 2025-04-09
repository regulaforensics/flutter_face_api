part of "../../flutter_face_api.dart";

class FaceSDKVersion {
  /// Version of the API module.
  String? get api => _api;
  String? _api;

  /// Version of the CORE module.
  String? get core => _core;
  String? _core;

  /// CORE module variant.
  String? get coreMode => _coreMode;
  String? _coreMode;

  FaceSDKVersion._privateConstructor();

  @visibleForTesting
  static FaceSDKVersion? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = FaceSDKVersion._privateConstructor();

    result._api = jsonObject["api"];
    result._core = jsonObject["core"];
    result._coreMode = jsonObject["coreMode"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {"api": api, "core": core, "coreMode": coreMode}.clearNulls();
}
