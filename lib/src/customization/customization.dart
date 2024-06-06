part of "../../flutter_face_api.dart";

/// Params that relate to the camera view controller customization and etc.
class Customization {
  CustomizationColors get colors => _colors;
  CustomizationColors _colors = CustomizationColors();
  set colors(CustomizationColors val) {
    (_colors = val)._apply(this);
  }

  CustomizationFonts get fonts => _fonts;
  CustomizationFonts _fonts = CustomizationFonts();
  set fonts(CustomizationFonts val) {
    (_fonts = val)._apply(this);
  }

  CustomizationImages get images => _images;
  CustomizationImages _images = CustomizationImages();
  set images(CustomizationImages val) {
    (_images = val)._apply(this);
  }

  Map<String, dynamic>? get uiCustomizationLayer => _uiCustomizationLayer;
  Map<String, dynamic>? _uiCustomizationLayer;
  set uiCustomizationLayer(Map<String, dynamic>? val) {
    _uiCustomizationLayer = val;
    _set({"uiCustomizationLayer": val});
  }

  /// Set onClick listener for buttons from [uiCustomizationLayer].
  set onCustomButtonTapped(CustomButtonTappedCompletion completion) =>
      _setCustomButtonTappedCompletion(completion);

  /// Allows you to deserialize object.
  static Customization fromJson(jsonObject) {
    var result = Customization();
    result.testSetters = {};

    result.colors = CustomizationColors.fromJson(jsonObject["colors"]);
    result.fonts = CustomizationFonts.fromJson(jsonObject["fonts"]);
    result.images = CustomizationImages.fromJson(jsonObject["images"]);
    result._uiCustomizationLayer = jsonObject["uiCustomizationLayer"];

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() => {
        "colors": colors.toJson(),
        "fonts": fonts.toJson(),
        "images": images.toJson(),
        "uiCustomizationLayer": uiCustomizationLayer
      }.clearNulls();

  void _set(Map<String, dynamic> json) {
    if (identical(this, FaceSDK.instance.customization)) {
      _bridge.invokeMethod("setCustomization", [json]);
    }
    testSetters.addAll(json);
  }

  void _apply() => _set(toJson());

  @visibleForTesting
  Map<String, dynamic> testSetters = {};
}

/// Callback for receiving signal, when a custom button,
/// configured in `FaceSDK.uiCustomizationLayer`, is pressed.
///
/// [tag] button id, indication which button was pressed.
typedef CustomButtonTappedCompletion = void Function(int tag);
