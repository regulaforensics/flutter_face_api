part of "../../flutter_face_api.dart";

class CustomizationImages {
  ByteData? _onboardingScreenCloseButton;
  set onboardingScreenCloseButton(ByteData val) {
    _onboardingScreenCloseButton = val;
    _set({"100": _dataToBase64(val)});
  }

  ByteData? _onboardingScreenIllumination;
  set onboardingScreenIllumination(ByteData val) {
    _onboardingScreenIllumination = val;
    _set({"101": _dataToBase64(val)});
  }

  ByteData? _onboardingScreenAccessories;
  set onboardingScreenAccessories(ByteData val) {
    _onboardingScreenAccessories = val;
    _set({"102": _dataToBase64(val)});
  }

  ByteData? _onboardingScreenCameraLevel;
  set onboardingScreenCameraLevel(ByteData val) {
    _onboardingScreenCameraLevel = val;
    _set({"103": _dataToBase64(val)});
  }

  ByteData? _cameraScreenCloseButton;
  set cameraScreenCloseButton(ByteData val) {
    _cameraScreenCloseButton = val;
    _set({"200": _dataToBase64(val)});
  }

  ByteData? _cameraScreenLightOnButton;
  set cameraScreenLightOnButton(ByteData val) {
    _cameraScreenLightOnButton = val;
    _set({"201": _dataToBase64(val)});
  }

  ByteData? _cameraScreenLightOffButton;
  set cameraScreenLightOffButton(ByteData val) {
    _cameraScreenLightOffButton = val;
    _set({"202": _dataToBase64(val)});
  }

  ByteData? _cameraScreenSwitchButton;
  set cameraScreenSwitchButton(ByteData val) {
    _cameraScreenSwitchButton = val;
    _set({"203": _dataToBase64(val)});
  }

  ByteData? _retryScreenCloseButton;
  set retryScreenCloseButton(ByteData val) {
    _retryScreenCloseButton = val;
    _set({"300": _dataToBase64(val)});
  }

  ByteData? _retryScreenHintEnvironment;
  set retryScreenHintEnvironment(ByteData val) {
    _retryScreenHintEnvironment = val;
    _set({"301": _dataToBase64(val)});
  }

  ByteData? _retryScreenHintSubject;
  set retryScreenHintSubject(ByteData val) {
    _retryScreenHintSubject = val;
    _set({"302": _dataToBase64(val)});
  }

  ByteData? _processingScreenCloseButton;
  set processingScreenCloseButton(ByteData val) {
    _processingScreenCloseButton = val;
    _set({"400": _dataToBase64(val)});
  }

  ByteData? _successScreenImage;
  set successScreenImage(ByteData val) {
    _successScreenImage = val;
    _set({"500": _dataToBase64(val)});
  }

  /// Allows you to deserialize object.
  static CustomizationImages fromJson(jsonObject) {
    var result = CustomizationImages();
    result.testSetters = {};

    result._onboardingScreenCloseButton = _dataFromBase64(jsonObject["100"])!;
    result._onboardingScreenIllumination = _dataFromBase64(jsonObject["101"])!;
    result._onboardingScreenAccessories = _dataFromBase64(jsonObject["102"])!;
    result._onboardingScreenCameraLevel = _dataFromBase64(jsonObject["103"])!;
    result._cameraScreenCloseButton = _dataFromBase64(jsonObject["200"])!;
    result._cameraScreenLightOnButton = _dataFromBase64(jsonObject["201"])!;
    result._cameraScreenLightOffButton = _dataFromBase64(jsonObject["202"])!;
    result._cameraScreenSwitchButton = _dataFromBase64(jsonObject["203"])!;
    result._retryScreenCloseButton = _dataFromBase64(jsonObject["300"])!;
    result._retryScreenHintEnvironment = _dataFromBase64(jsonObject["301"])!;
    result._retryScreenHintSubject = _dataFromBase64(jsonObject["302"])!;
    result._processingScreenCloseButton = _dataFromBase64(jsonObject["400"])!;
    result._successScreenImage = _dataFromBase64(jsonObject["500"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "100": _dataToBase64(_onboardingScreenCloseButton),
        "101": _dataToBase64(_onboardingScreenIllumination),
        "102": _dataToBase64(_onboardingScreenAccessories),
        "103": _dataToBase64(_onboardingScreenCameraLevel),
        "200": _dataToBase64(_cameraScreenCloseButton),
        "201": _dataToBase64(_cameraScreenLightOnButton),
        "202": _dataToBase64(_cameraScreenLightOffButton),
        "203": _dataToBase64(_cameraScreenSwitchButton),
        "300": _dataToBase64(_retryScreenCloseButton),
        "301": _dataToBase64(_retryScreenHintEnvironment),
        "302": _dataToBase64(_retryScreenHintSubject),
        "400": _dataToBase64(_processingScreenCloseButton),
        "500": _dataToBase64(_successScreenImage),
      }.clearNulls();

  void _set(Map<String, dynamic> json, {Customization? directParent}) {
    var parentJson = {"images": json};
    var parent = FaceSDK.instance.customization;
    if (identical(this, parent.images)) parent._set(parentJson);
    directParent?.testSetters.addAll(parentJson);
    testSetters.addAll(json);
  }

  void _apply(Customization parent) => _set(toJson(), directParent: parent);

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}
