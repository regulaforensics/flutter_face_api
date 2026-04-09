part of "../../flutter_face_api.dart";

class CustomizationImages {
  ByteData? _onboardingScreenCloseButton;
  set onboardingScreenCloseButton(ByteData val) {
    _onboardingScreenCloseButton = val;
    _set({"onboardingScreenCloseButton": _dataToBase64(val)});
  }

  ByteData? _onboardingScreenIllumination;
  set onboardingScreenIllumination(ByteData val) {
    _onboardingScreenIllumination = val;
    _set({"onboardingScreenIllumination": _dataToBase64(val)});
  }

  ByteData? _onboardingScreenAccessories;
  set onboardingScreenAccessories(ByteData val) {
    _onboardingScreenAccessories = val;
    _set({"onboardingScreenAccessories": _dataToBase64(val)});
  }

  ByteData? _onboardingScreenCameraLevel;
  set onboardingScreenCameraLevel(ByteData val) {
    _onboardingScreenCameraLevel = val;
    _set({"onboardingScreenCameraLevel": _dataToBase64(val)});
  }

  ByteData? _cameraScreenCloseButton;
  set cameraScreenCloseButton(ByteData val) {
    _cameraScreenCloseButton = val;
    _set({"cameraScreenCloseButton": _dataToBase64(val)});
  }

  ByteData? _cameraScreenLightOnButton;
  set cameraScreenLightOnButton(ByteData val) {
    _cameraScreenLightOnButton = val;
    _set({"cameraScreenLightOnButton": _dataToBase64(val)});
  }

  ByteData? _cameraScreenLightOffButton;
  set cameraScreenLightOffButton(ByteData val) {
    _cameraScreenLightOffButton = val;
    _set({"cameraScreenLightOffButton": _dataToBase64(val)});
  }

  ByteData? _cameraScreenSwitchButton;
  set cameraScreenSwitchButton(ByteData val) {
    _cameraScreenSwitchButton = val;
    _set({"cameraScreenSwitchButton": _dataToBase64(val)});
  }

  ByteData? _retryScreenCloseButton;
  set retryScreenCloseButton(ByteData val) {
    _retryScreenCloseButton = val;
    _set({"retryScreenCloseButton": _dataToBase64(val)});
  }

  ByteData? _retryScreenHintEnvironment;
  set retryScreenHintEnvironment(ByteData val) {
    _retryScreenHintEnvironment = val;
    _set({"retryScreenHintEnvironment": _dataToBase64(val)});
  }

  ByteData? _retryScreenHintSubject;
  set retryScreenHintSubject(ByteData val) {
    _retryScreenHintSubject = val;
    _set({"retryScreenHintSubject": _dataToBase64(val)});
  }

  ByteData? _retryScreenHintGeo;
  set retryScreenHintGeo(ByteData val) {
    _retryScreenHintGeo = val;
    _set({"retryScreenHintGeo": _dataToBase64(val)});
  }

  ByteData? _processingScreenCloseButton;
  set processingScreenCloseButton(ByteData val) {
    _processingScreenCloseButton = val;
    _set({"processingScreenCloseButton": _dataToBase64(val)});
  }

  ByteData? _successScreenImage;
  set successScreenImage(ByteData val) {
    _successScreenImage = val;
    _set({"successScreenImage": _dataToBase64(val)});
  }

  /// Allows you to deserialize object.
  static CustomizationImages fromJson(jsonObject) {
    var result = CustomizationImages();
    result.testSetters = {};

    result._onboardingScreenCloseButton =
        _dataFromBase64(jsonObject["onboardingScreenCloseButton"])!;
    result._onboardingScreenIllumination =
        _dataFromBase64(jsonObject["onboardingScreenIllumination"])!;
    result._onboardingScreenAccessories =
        _dataFromBase64(jsonObject["onboardingScreenAccessories"])!;
    result._onboardingScreenCameraLevel =
        _dataFromBase64(jsonObject["onboardingScreenCameraLevel"])!;
    result._cameraScreenCloseButton =
        _dataFromBase64(jsonObject["cameraScreenCloseButton"])!;
    result._cameraScreenLightOnButton =
        _dataFromBase64(jsonObject["cameraScreenLightOnButton"])!;
    result._cameraScreenLightOffButton =
        _dataFromBase64(jsonObject["cameraScreenLightOffButton"])!;
    result._cameraScreenSwitchButton =
        _dataFromBase64(jsonObject["cameraScreenSwitchButton"])!;
    result._retryScreenCloseButton =
        _dataFromBase64(jsonObject["retryScreenCloseButton"])!;
    result._retryScreenHintEnvironment =
        _dataFromBase64(jsonObject["retryScreenHintEnvironment"])!;
    result._retryScreenHintSubject =
        _dataFromBase64(jsonObject["retryScreenHintSubject"])!;
    result._retryScreenHintGeo =
        _dataFromBase64(jsonObject["retryScreenHintGeo"])!;
    result._processingScreenCloseButton =
        _dataFromBase64(jsonObject["processingScreenCloseButton"])!;
    result._successScreenImage =
        _dataFromBase64(jsonObject["successScreenImage"])!;

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "onboardingScreenCloseButton":
            _dataToBase64(_onboardingScreenCloseButton),
        "onboardingScreenIllumination":
            _dataToBase64(_onboardingScreenIllumination),
        "onboardingScreenAccessories":
            _dataToBase64(_onboardingScreenAccessories),
        "onboardingScreenCameraLevel":
            _dataToBase64(_onboardingScreenCameraLevel),
        "cameraScreenCloseButton": _dataToBase64(_cameraScreenCloseButton),
        "cameraScreenLightOnButton": _dataToBase64(_cameraScreenLightOnButton),
        "cameraScreenLightOffButton":
            _dataToBase64(_cameraScreenLightOffButton),
        "cameraScreenSwitchButton": _dataToBase64(_cameraScreenSwitchButton),
        "retryScreenCloseButton": _dataToBase64(_retryScreenCloseButton),
        "retryScreenHintEnvironment":
            _dataToBase64(_retryScreenHintEnvironment),
        "retryScreenHintSubject": _dataToBase64(_retryScreenHintSubject),
        "retryScreenHintGeo": _dataToBase64(_retryScreenHintGeo),
        "processingScreenCloseButton":
            _dataToBase64(_processingScreenCloseButton),
        "successScreenImage": _dataToBase64(_successScreenImage),
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
