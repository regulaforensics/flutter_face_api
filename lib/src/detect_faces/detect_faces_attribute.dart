part of "../../flutter_face_api.dart";

enum DetectFacesAttribute {
  AGE("Age"),
  EYE_RIGHT("EyeRight"),
  EYE_LEFT("EyeLeft"),
  EMOTION("Emotion"),
  SMILE("Smile"),
  GLASSES("Glasses"),
  HEAD_COVERING("HeadCovering"),
  FOREHEAD_COVERING("ForeheadCovering"),
  MOUTH("Mouth"),
  MEDICAL_MASK("MedicalMask"),
  OCCLUSION("Occlusion"),
  STRONG_MAKEUP("StrongMakeup"),
  HEADPHONES("Headphones");

  const DetectFacesAttribute(this.value);
  final String value;

  static DetectFacesAttribute? getByValue(String? i) {
    if (i == null) return null;
    return DetectFacesAttribute.values.firstWhere((x) => x.value == i);
  }
}
