part of "../../flutter_face_api.dart";

/// Configuration for the Liveness processing.
/// The configuration provides convenient properties to change the behavior and the appearance of the Liveness UI module.
class LivenessConfig {
  /// Defines, whether the logo is visible on the bottom of Liveness UI screens. Defaults to `true`.
  bool copyright;

  /// Defines, whether the camera's toolbar switch camera button is available on the Liveness UI. Defaults to `false`.
  /// When set to `true` the CameraToolbarView will contain a button to change current `cameraPosition`.
  /// Only for livenessType = [LivenessType.PASSIVE].
  bool cameraSwitchEnabled;

  bool closeButtonEnabled;

  /// Defines, whether the camera's toolbar torch button is available on the Liveness UI. Defaults to `true`.
  /// When set to `false` the CameraToolbarView won't contain a button to toggle camera's flashlight.
  /// Only for livenessType = [LivenessType.PASSIVE].
  bool torchButtonEnabled;

  /// Enables vibration during Liveness processing. Defaults to `true`.
  bool vibrateOnSteps;

  /// Android only.
  int? cameraPositionAndroid;

  /// IOS only.
  CameraPosition cameraPositionIOS;

  /// Android only.
  List<ScreenOrientation> screenOrientation;

  /// Defines whether the liveness request sends a location of a device. Defaults to `true`.
  /// When set to `true` the liveness request to web service will contain the `location`
  /// object within the json `metadata` object.
  /// The location is used only when permissions are granted and the location is available.
  bool locationTrackingEnabled;

  /// The number of attempts to pass the Liveness before completing with error. Defaults to `0`.
  /// When set to `0`  the Liveness will always ask to retry on error.
  int attemptsCount;

  /// Defines whether the liveness recording video of processing.
  /// Defaults to [RecordingProcess.ASYNCHRONOUS_UPLOAD].
  RecordingProcess recordingProcess;

  /// Defines whether the liveness processing type. Defaults to [LivenessType.ACTIVE].
  LivenessType livenessType;

  /// Defines tag that can be used in Liveness processing. Defaults to `null`.
  String? tag;

  /// Defines which steps of the user interface can be omitted. See [LivenessSkipStep] enum for details.
  List<LivenessSkipStep> skipStep;

  dynamic metadata;

  LivenessConfig({
    bool copyright = true,
    bool cameraSwitchEnabled = false,
    bool closeButtonEnabled = true,
    bool torchButtonEnabled = true,
    bool vibrateOnSteps = true,
    int? cameraPositionAndroid,
    CameraPosition cameraPositionIOS = CameraPosition.FRONT,
    List<ScreenOrientation> screenOrientation = const [
      ScreenOrientation.PORTRAIT
    ],
    bool locationTrackingEnabled = true,
    int attemptsCount = 0,
    RecordingProcess recordingProcess = RecordingProcess.ASYNCHRONOUS_UPLOAD,
    LivenessType livenessType = LivenessType.ACTIVE,
    String? tag,
    List<LivenessSkipStep> skipStep = const [],
    dynamic metadata,
  })  : copyright = copyright,
        cameraSwitchEnabled = cameraSwitchEnabled,
        closeButtonEnabled = closeButtonEnabled,
        torchButtonEnabled = torchButtonEnabled,
        vibrateOnSteps = vibrateOnSteps,
        cameraPositionAndroid = cameraPositionAndroid,
        cameraPositionIOS = cameraPositionIOS,
        screenOrientation = screenOrientation,
        locationTrackingEnabled = locationTrackingEnabled,
        attemptsCount = attemptsCount,
        recordingProcess = recordingProcess,
        livenessType = livenessType,
        tag = tag,
        skipStep = skipStep,
        metadata = metadata;

  @visibleForTesting
  static LivenessConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = LivenessConfig();

    result.copyright = jsonObject["copyright"];
    result.cameraSwitchEnabled = jsonObject["cameraSwitchEnabled"];
    result.closeButtonEnabled = jsonObject["closeButtonEnabled"];
    result.torchButtonEnabled = jsonObject["torchButtonEnabled"];
    result.vibrateOnSteps = jsonObject["vibrateOnSteps"];
    result.cameraPositionAndroid = jsonObject["cameraPositionAndroid"];
    result.cameraPositionIOS =
        CameraPosition.getByValue(jsonObject["cameraPositionIOS"])!;
    result.screenOrientation =
        ScreenOrientation.fromIntList(jsonObject["screenOrientation"])!;
    result.locationTrackingEnabled = jsonObject["locationTrackingEnabled"];
    result.attemptsCount = jsonObject["attemptsCount"];
    result.recordingProcess =
        RecordingProcess.getByValue(jsonObject["recordingProcess"])!;
    result.livenessType = LivenessType.getByValue(jsonObject["livenessType"])!;
    result.tag = jsonObject["tag"];
    result.skipStep =
        LivenessSkipStep.fromIntList(jsonObject["screenOrientation"])!;
    result.metadata = jsonObject["metadata"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "cameraSwitchEnabled": cameraSwitchEnabled,
        "closeButtonEnabled": closeButtonEnabled,
        "torchButtonEnabled": torchButtonEnabled,
        "vibrateOnSteps": vibrateOnSteps,
        "cameraPositionAndroid": cameraPositionAndroid,
        "cameraPositionIOS": cameraPositionIOS.value,
        "screenOrientation": screenOrientation.map((e) => e.value).toList(),
        "locationTrackingEnabled": locationTrackingEnabled,
        "attemptsCount": attemptsCount,
        "recordingProcess": recordingProcess.value,
        "livenessType": livenessType.value,
        "tag": tag,
        "skipStep": skipStep.map((e) => e.value).toList(),
        "metadata": metadata,
      }.clearNulls();
}

enum RecordingProcess {
  ASYNCHRONOUS_UPLOAD(0),

  SYNCHRONOUS_UPLOAD(1),

  NOT_UPLOAD(2);

  const RecordingProcess(this.value);
  final int value;

  static RecordingProcess? getByValue(int? i) {
    if (i == null) return null;
    return RecordingProcess.values.firstWhere((x) => x.value == i);
  }
}

enum LivenessType {
  ACTIVE(0),

  PASSIVE(1);

  const LivenessType(this.value);
  final int value;

  static LivenessType? getByValue(int? i) {
    if (i == null) return null;
    return LivenessType.values.firstWhere((x) => x.value == i);
  }
}

enum LivenessSkipStep {
  ONBOARDING_STEP(0),

  SUCCESS_STEP(1);

  const LivenessSkipStep(this.value);
  final int value;

  static LivenessSkipStep? getByValue(int? i) {
    if (i == null) return null;
    return LivenessSkipStep.values.firstWhere((x) => x.value == i);
  }

  static List<LivenessSkipStep>? fromIntList(List<dynamic>? input) {
    if (input == null) return null;
    List<LivenessSkipStep> list = [];
    for (int item in input) {
      list.addSafe(getByValue(item));
    }
    return list;
  }
}
