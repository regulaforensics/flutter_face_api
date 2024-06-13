part of "../../flutter_face_api.dart";

/// Custom configuration for [DetectFacesRequest].
class DetectFacesConfig {
  /// Current array for the face image detection attributes.
  List<DetectFacesAttribute>? attributes;

  /// Current array for the face image quality assessment rules.
  List<ImageQualityCharacteristic>? customQuality;

  /// If set the uploaded image is processed according to the indicated settings.
  OutputImageParams? outputImageParams;

  /// Whether to process only the central face on the image or all the faces.
  /// If set to `true`, the SDK detects and processes only one—the most central face in the image.
  /// If set to `false`, the SDK processes all faces in the image.
  /// Default is `false`.
  bool onlyCentralFace;

  DetectFacesConfig({
    List<DetectFacesAttribute>? attributes,
    List<ImageQualityCharacteristic>? customQuality,
    OutputImageParams? outputImageParams,
    bool onlyCentralFace = false,
  })  : attributes = attributes,
        customQuality = customQuality,
        outputImageParams = outputImageParams,
        onlyCentralFace = onlyCentralFace;

  @visibleForTesting
  static DetectFacesConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DetectFacesConfig();

    if (jsonObject["attributes"] != null) {
      result.attributes = [];
      for (var item in jsonObject["attributes"]) {
        result.attributes!.add(DetectFacesAttribute.getByValue(item)!);
      }
    }
    if (jsonObject["customQuality"] != null) {
      result.customQuality = [];
      for (var item in jsonObject["customQuality"]) {
        result.customQuality!.add(ImageQualityCharacteristic.fromJson(item)!);
      }
    }
    result.outputImageParams =
        OutputImageParams.fromJson(jsonObject["outputImageParams"]);
    result.onlyCentralFace = jsonObject["onlyCentralFace"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "attributes": attributes?.map((e) => e.value).toList(),
        "customQuality": customQuality?.map((e) => e.toJson()).toList(),
        "outputImageParams": outputImageParams?.toJson(),
        "onlyCentralFace": onlyCentralFace,
      }.clearNulls();
}
