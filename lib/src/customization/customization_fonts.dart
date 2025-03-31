part of "../../flutter_face_api.dart";

class CustomizationFonts {
  Font? _onboardingScreenStartButton;
  set onboardingScreenStartButton(Font? val) {
    _onboardingScreenStartButton = val;
    _set({"100": val?.toJson()});
  }

  Font? _onboardingScreenTitleLabel;
  set onboardingScreenTitleLabel(Font? val) {
    _onboardingScreenTitleLabel = val;
    _set({"101": val?.toJson()});
  }

  Font? _onboardingScreenSubtitleLabel;
  set onboardingScreenSubtitleLabel(Font? val) {
    _onboardingScreenSubtitleLabel = val;
    _set({"102": val?.toJson()});
  }

  Font? _onboardingScreenMessageLabels;
  set onboardingScreenMessageLabels(Font? val) {
    _onboardingScreenMessageLabels = val;
    _set({"103": val?.toJson()});
  }

  Font? _cameraScreenHintLabel;
  set cameraScreenHintLabel(Font? val) {
    _cameraScreenHintLabel = val;
    _set({"200": val?.toJson()});
  }

  Font? _retryScreenRetryButton;
  set retryScreenRetryButton(Font? val) {
    _retryScreenRetryButton = val;
    _set({"300": val?.toJson()});
  }

  Font? _retryScreenTitleLabel;
  set retryScreenTitleLabel(Font? val) {
    _retryScreenTitleLabel = val;
    _set({"301": val?.toJson()});
  }

  Font? _retryScreenSubtitleLabel;
  set retryScreenSubtitleLabel(Font? val) {
    _retryScreenSubtitleLabel = val;
    _set({"302": val?.toJson()});
  }

  Font? _retryScreenHintLabels;
  set retryScreenHintLabels(Font? val) {
    _retryScreenHintLabels = val;
    _set({"303": val?.toJson()});
  }

  Font? _processingScreenLabel;
  set processingScreenLabel(Font? val) {
    _processingScreenLabel = val;
    _set({"400": val?.toJson()});
  }

  /// Allows you to deserialize object.
  static CustomizationFonts fromJson(jsonObject) {
    var result = CustomizationFonts();
    result.testSetters = {};

    result._onboardingScreenStartButton = Font.fromJson(jsonObject["100"]);
    result._onboardingScreenTitleLabel = Font.fromJson(jsonObject["101"]);
    result._onboardingScreenSubtitleLabel = Font.fromJson(jsonObject["102"]);
    result._onboardingScreenMessageLabels = Font.fromJson(jsonObject["103"]);
    result._cameraScreenHintLabel = Font.fromJson(jsonObject["200"]);
    result._retryScreenRetryButton = Font.fromJson(jsonObject["300"]);
    result._retryScreenTitleLabel = Font.fromJson(jsonObject["301"]);
    result._retryScreenSubtitleLabel = Font.fromJson(jsonObject["302"]);
    result._retryScreenHintLabels = Font.fromJson(jsonObject["303"]);
    result._processingScreenLabel = Font.fromJson(jsonObject["400"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {
        "100": _onboardingScreenStartButton?.toJson(),
        "101": _onboardingScreenTitleLabel?.toJson(),
        "102": _onboardingScreenSubtitleLabel?.toJson(),
        "103": _onboardingScreenMessageLabels?.toJson(),
        "200": _cameraScreenHintLabel?.toJson(),
        "300": _retryScreenRetryButton?.toJson(),
        "301": _retryScreenTitleLabel?.toJson(),
        "302": _retryScreenSubtitleLabel?.toJson(),
        "303": _retryScreenHintLabels?.toJson(),
        "400": _processingScreenLabel?.toJson(),
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"fonts": json};
    var parent = FaceSDK.instance.customization;
    if (identical(this, parent.fonts)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
