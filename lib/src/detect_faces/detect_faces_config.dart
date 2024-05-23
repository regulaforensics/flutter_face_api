part of "../../flutter_face_api.dart";

class DetectFacesConfig {
  List<DetectFacesAttribute>? attributes;

  List<ImageQualityCharacteristic>? customQuality;

  OutputImageParams? outputImageParams;

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
