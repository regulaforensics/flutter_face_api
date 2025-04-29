part of "../../flutter_face_api.dart";

class FaceCaptureConfig {
  bool copyright;

  bool cameraSwitchEnabled;

  bool closeButtonEnabled;

  bool torchButtonEnabled;

  bool vibrateOnSteps;

  /// Enables 'remove occlusion' animation & hint.
  bool detectOcclusion;

  /// Enables global face hint animation.
  bool showFaceAnimation;

  /// Android only.
  int? cameraPositionAndroid;

  /// IOS only.
  CameraPosition cameraPositionIOS;

  /// Allows you to specify an orientation of the camera view controller.
  List<ScreenOrientation> screenOrientation;

  double? timeout;

  double? holdStillDuration;

  FaceCaptureConfig({
    bool copyright = true,
    bool cameraSwitchEnabled = false,
    bool closeButtonEnabled = true,
    bool torchButtonEnabled = true,
    bool vibrateOnSteps = true,
    bool detectOcclusion = true,
    bool showFaceAnimation = true,
    int? cameraPositionAndroid,
    CameraPosition cameraPositionIOS = CameraPosition.FRONT,
    List<ScreenOrientation> screenOrientation = const [
      ScreenOrientation.PORTRAIT
    ],
    double? timeout,
    double? holdStillDuration,
  })  : copyright = copyright,
        cameraSwitchEnabled = cameraSwitchEnabled,
        closeButtonEnabled = closeButtonEnabled,
        torchButtonEnabled = torchButtonEnabled,
        vibrateOnSteps = vibrateOnSteps,
        detectOcclusion = detectOcclusion,
        showFaceAnimation = showFaceAnimation,
        cameraPositionAndroid = cameraPositionAndroid,
        cameraPositionIOS = cameraPositionIOS,
        screenOrientation = screenOrientation,
        timeout = timeout,
        holdStillDuration = holdStillDuration;

  @visibleForTesting
  static FaceCaptureConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = FaceCaptureConfig();

    result.copyright = jsonObject["copyright"];
    result.cameraSwitchEnabled = jsonObject["cameraSwitchEnabled"];
    result.closeButtonEnabled = jsonObject["closeButtonEnabled"];
    result.torchButtonEnabled = jsonObject["torchButtonEnabled"];
    result.vibrateOnSteps = jsonObject["vibrateOnSteps"];
    result.detectOcclusion = jsonObject["detectOcclusion"];
    result.showFaceAnimation = jsonObject["showFaceAnimation"];
    result.cameraPositionAndroid = jsonObject["cameraPositionAndroid"];
    result.cameraPositionIOS =
        CameraPosition.getByValue(jsonObject["cameraPositionIOS"])!;
    result.screenOrientation =
        ScreenOrientation.fromIntList(jsonObject["screenOrientation"])!;
    result.timeout = _toDouble(jsonObject["timeout"]);
    result.holdStillDuration = _toDouble(jsonObject["holdStillDuration"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "cameraSwitchEnabled": cameraSwitchEnabled,
        "closeButtonEnabled": closeButtonEnabled,
        "torchButtonEnabled": torchButtonEnabled,
        "vibrateOnSteps": vibrateOnSteps,
        "detectOcclusion": detectOcclusion,
        "showFaceAnimation": showFaceAnimation,
        "cameraPositionAndroid": cameraPositionAndroid,
        "cameraPositionIOS": cameraPositionIOS.value,
        "screenOrientation": screenOrientation.map((e) => e.value).toList(),
        "timeout": timeout,
        "holdStillDuration": holdStillDuration,
      }.clearNulls();
}
