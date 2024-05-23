part of "../../flutter_face_api.dart";

enum DetectFacesScenario {
  CROP_CENTRAL_FACE("CropCentralFace"),
  CROP_ALL_FACES("CropAllFaces"),
  THUMBNAIL("Thumbnail"),
  ATTRIBUTES_ALL("AttributesAll"),
  QUALITY_FULL("QualityFull"),
  QUALITY_ICAO("QualityICAO"),
  QUALITY_VISA_SCHENGEN("QualityVisaSchengen"),
  QUALITY_VISA_USA("QualityVisaUSA");

  const DetectFacesScenario(this.value);
  final String value;

  static DetectFacesScenario? getByValue(String? i) {
    if (i == null) return null;
    return DetectFacesScenario.values.firstWhere((x) => x.value == i);
  }
}
