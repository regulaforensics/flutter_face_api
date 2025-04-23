part of "../../flutter_face_api.dart";

class CustomizationColors {
  Color? _onboardingScreenStartButtonBackground;
  set onboardingScreenStartButtonBackground(Color val) {
    _onboardingScreenStartButtonBackground = val;
    _set({"100": _intFromColor(val)});
  }

  Color? _onboardingScreenStartButtonTitle;
  set onboardingScreenStartButtonTitle(Color val) {
    _onboardingScreenStartButtonTitle = val;
    _set({"101": _intFromColor(val)});
  }

  Color? _onboardingScreenBackground;
  set onboardingScreenBackground(Color val) {
    _onboardingScreenBackground = val;
    _set({"102": _intFromColor(val)});
  }

  Color? _onboardingScreenTitleLabelText;
  set onboardingScreenTitleLabelText(Color val) {
    _onboardingScreenTitleLabelText = val;
    _set({"103": _intFromColor(val)});
  }

  Color? _onboardingScreenSubtitleLabelText;
  set onboardingScreenSubtitleLabelText(Color val) {
    _onboardingScreenSubtitleLabelText = val;
    _set({"104": _intFromColor(val)});
  }

  Color? _onboardingScreenMessageLabelsText;
  set onboardingScreenMessageLabelsText(Color val) {
    _onboardingScreenMessageLabelsText = val;
    _set({"105": _intFromColor(val)});
  }

  Color? _cameraScreenStrokeNormal;
  set cameraScreenStrokeNormal(Color val) {
    _cameraScreenStrokeNormal = val;
    _set({"200": _intFromColor(val)});
  }

  Color? _cameraScreenStrokeActive;
  set cameraScreenStrokeActive(Color val) {
    _cameraScreenStrokeActive = val;
    _set({"201": _intFromColor(val)});
  }

  Color? _cameraScreenSectorTarget;
  set cameraScreenSectorTarget(Color val) {
    _cameraScreenSectorTarget = val;
    _set({"202": _intFromColor(val)});
  }

  Color? _cameraScreenSectorActive;
  set cameraScreenSectorActive(Color val) {
    _cameraScreenSectorActive = val;
    _set({"203": _intFromColor(val)});
  }

  Color? _cameraScreenFrontHintLabelBackground;
  set cameraScreenFrontHintLabelBackground(Color val) {
    _cameraScreenFrontHintLabelBackground = val;
    _set({"204": _intFromColor(val)});
  }

  Color? _cameraScreenFrontHintLabelText;
  set cameraScreenFrontHintLabelText(Color val) {
    _cameraScreenFrontHintLabelText = val;
    _set({"205": _intFromColor(val)});
  }

  Color? _cameraScreenBackHintLabelBackground;
  set cameraScreenBackHintLabelBackground(Color val) {
    _cameraScreenBackHintLabelBackground = val;
    _set({"206": _intFromColor(val)});
  }

  Color? _cameraScreenBackHintLabelText;
  set cameraScreenBackHintLabelText(Color val) {
    _cameraScreenBackHintLabelText = val;
    _set({"207": _intFromColor(val)});
  }

  Color? _cameraScreenLightToolbarTint;
  set cameraScreenLightToolbarTint(Color val) {
    _cameraScreenLightToolbarTint = val;
    _set({"208": _intFromColor(val)});
  }

  Color? _cameraScreenDarkToolbarTint;
  set cameraScreenDarkToolbarTint(Color val) {
    _cameraScreenDarkToolbarTint = val;
    _set({"209": _intFromColor(val)});
  }

  Color? _retryScreenBackground;
  set retryScreenBackground(Color val) {
    _retryScreenBackground = val;
    _set({"300": _intFromColor(val)});
  }

  Color? _retryScreenRetryButtonBackground;
  set retryScreenRetryButtonBackground(Color val) {
    _retryScreenRetryButtonBackground = val;
    _set({"301": _intFromColor(val)});
  }

  Color? _retryScreenRetryButtonTitle;
  set retryScreenRetryButtonTitle(Color val) {
    _retryScreenRetryButtonTitle = val;
    _set({"302": _intFromColor(val)});
  }

  Color? _retryScreenTitleLabelText;
  set retryScreenTitleLabelText(Color val) {
    _retryScreenTitleLabelText = val;
    _set({"303": _intFromColor(val)});
  }

  Color? _retryScreenSubtitleLabelText;
  set retryScreenSubtitleLabelText(Color val) {
    _retryScreenSubtitleLabelText = val;
    _set({"304": _intFromColor(val)});
  }

  Color? _retryScreenHintLabelsText;
  set retryScreenHintLabelsText(Color val) {
    _retryScreenHintLabelsText = val;
    _set({"305": _intFromColor(val)});
  }

  Color? _processingScreenBackground;
  set processingScreenBackground(Color val) {
    _processingScreenBackground = val;
    _set({"400": _intFromColor(val)});
  }

  Color? _processingScreenProgress;
  set processingScreenProgress(Color val) {
    _processingScreenProgress = val;
    _set({"401": _intFromColor(val)});
  }

  Color? _processingScreenTitleLabel;
  set processingScreenTitleLabel(Color val) {
    _processingScreenTitleLabel = val;
    _set({"402": _intFromColor(val)});
  }

  Color? _successScreenBackground;
  set successScreenBackground(Color val) {
    _successScreenBackground = val;
    _set({"500": _intFromColor(val)});
  }

  /// Allows you to deserialize object.
  static CustomizationColors fromJson(jsonObject) {
    var result = CustomizationColors();
    result.testSetters = {};

    result._onboardingScreenStartButtonBackground =
        _intToColor(jsonObject["100"])!;
    result._onboardingScreenStartButtonTitle = _intToColor(jsonObject["101"])!;
    result._onboardingScreenBackground = _intToColor(jsonObject["102"])!;
    result._onboardingScreenTitleLabelText = _intToColor(jsonObject["103"])!;
    result._onboardingScreenSubtitleLabelText = _intToColor(jsonObject["104"])!;
    result._onboardingScreenMessageLabelsText = _intToColor(jsonObject["105"])!;
    result._cameraScreenStrokeNormal = _intToColor(jsonObject["200"])!;
    result._cameraScreenStrokeActive = _intToColor(jsonObject["201"])!;
    result._cameraScreenSectorTarget = _intToColor(jsonObject["202"])!;
    result._cameraScreenSectorActive = _intToColor(jsonObject["203"])!;
    result._cameraScreenFrontHintLabelBackground =
        _intToColor(jsonObject["204"])!;
    result._cameraScreenFrontHintLabelText = _intToColor(jsonObject["205"])!;
    result._cameraScreenBackHintLabelBackground =
        _intToColor(jsonObject["206"])!;
    result._cameraScreenBackHintLabelText = _intToColor(jsonObject["207"])!;
    result._cameraScreenLightToolbarTint = _intToColor(jsonObject["208"])!;
    result._cameraScreenDarkToolbarTint = _intToColor(jsonObject["209"])!;
    result._retryScreenBackground = _intToColor(jsonObject["300"])!;
    result._retryScreenRetryButtonBackground = _intToColor(jsonObject["301"])!;
    result._retryScreenRetryButtonTitle = _intToColor(jsonObject["302"])!;
    result._retryScreenTitleLabelText = _intToColor(jsonObject["303"])!;
    result._retryScreenSubtitleLabelText = _intToColor(jsonObject["304"])!;
    result._retryScreenHintLabelsText = _intToColor(jsonObject["305"])!;
    result._processingScreenBackground = _intToColor(jsonObject["400"])!;
    result._processingScreenProgress = _intToColor(jsonObject["401"])!;
    result._processingScreenTitleLabel = _intToColor(jsonObject["402"])!;
    result._successScreenBackground = _intToColor(jsonObject["500"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "100": _intFromColor(_onboardingScreenStartButtonBackground),
        "101": _intFromColor(_onboardingScreenStartButtonTitle),
        "102": _intFromColor(_onboardingScreenBackground),
        "103": _intFromColor(_onboardingScreenTitleLabelText),
        "104": _intFromColor(_onboardingScreenSubtitleLabelText),
        "105": _intFromColor(_onboardingScreenMessageLabelsText),
        "200": _intFromColor(_cameraScreenStrokeNormal),
        "201": _intFromColor(_cameraScreenStrokeActive),
        "202": _intFromColor(_cameraScreenSectorTarget),
        "203": _intFromColor(_cameraScreenSectorActive),
        "204": _intFromColor(_cameraScreenFrontHintLabelBackground),
        "205": _intFromColor(_cameraScreenFrontHintLabelText),
        "206": _intFromColor(_cameraScreenBackHintLabelBackground),
        "207": _intFromColor(_cameraScreenBackHintLabelText),
        "208": _intFromColor(_cameraScreenLightToolbarTint),
        "209": _intFromColor(_cameraScreenDarkToolbarTint),
        "300": _intFromColor(_retryScreenBackground),
        "301": _intFromColor(_retryScreenRetryButtonBackground),
        "302": _intFromColor(_retryScreenRetryButtonTitle),
        "303": _intFromColor(_retryScreenTitleLabelText),
        "304": _intFromColor(_retryScreenSubtitleLabelText),
        "305": _intFromColor(_retryScreenHintLabelsText),
        "400": _intFromColor(_processingScreenBackground),
        "401": _intFromColor(_processingScreenProgress),
        "402": _intFromColor(_processingScreenTitleLabel),
        "500": _intFromColor(_successScreenBackground),
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"colors": json};
    var parent = FaceSDK.instance.customization;
    if (identical(this, parent.colors)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
