part of "../../flutter_face_api.dart";

enum ImageQualityCharacteristicName {
  IMAGE_WIDTH("ImageWidth"),
  IMAGE_HEIGHT("ImageHeight"),
  IMAGE_WIDTH_TO_HEIGHT("ImageWidthToHeight"),
  IMAGE_CHANNELS_NUMBER("ImageChannelsNumber"),
  ART_FACE("ArtFace"),
  PADDING_RATIO("PaddingRatio"),
  FACE_MID_POINT_HORIZONTAL_POSITION("FaceMidPointHorizontalPosition"),
  FACE_MID_POINT_VERTICAL_POSITION("FaceMidPointVerticalPosition"),
  HEAD_WIDTH_RATIO("HeadWidthRatio"),
  HEAD_HEIGHT_RATIO("HeadHeightRatio"),
  EYES_DISTANCE("EyesDistance"),
  YAW("Yaw"),
  PITCH("Pitch"),
  ROLL("Roll"),
  BLUR_LEVEL("BlurLevel"),
  NOISE_LEVEL("NoiseLevel"),
  UNNATURAL_SKIN_TONE("UnnaturalSkinTone"),
  FACE_DYNAMIC_RANGE("FaceDynamicRange"),
  EYE_RIGHT_CLOSED("EyeRightClosed"),
  EYE_LEFT_CLOSED("EyeLeftClosed"),
  EYE_RIGHT_OCCLUDED("EyeRightOccluded"),
  EYE_LEFT_OCCLUDED("EyeLeftOccluded"),
  EYES_RED("EyesRed"),
  EYE_RIGHT_COVERED_WITH_HAIR("EyeRightCoveredWithHair"),
  EYE_LEFT_COVERED_WITH_HAIR("EyeLeftCoveredWithHair"),
  OFF_GAZE("OffGaze"),
  TOO_DARK("TooDark"),
  TOO_LIGHT("TooLight"),
  FACE_GLARE("FaceGlare"),
  SHADOWS_ON_FACE("ShadowsOnFace"),
  SHOULDERS_POSE("ShouldersPose"),
  EXPRESSION_LEVEL("ExpressionLevel"),
  MOUTH_OPEN("MouthOpen"),
  SMILE("Smile"),
  DARK_GLASSES("DarkGlasses"),
  REFLECTION_ON_GLASSES("ReflectionOnGlasses"),
  FRAMES_TOO_HEAVY("FramesTooHeavy"),
  FACE_OCCLUDED("FaceOccluded"),
  HEAD_COVERING("HeadCovering"),
  FOREHEAD_COVERING("ForeheadCovering"),
  STRONG_MAKEUP("StrongMakeup"),
  HEAD_PHONES("Headphones"),
  MEDICAL_MASK("MedicalMask"),
  BACKGROUND_UNIFORMITY("BackgroundUniformity"),
  SHADOWS_ON_BACKGROUND("ShadowsOnBackground"),
  OTHER_FACES("OtherFaces"),
  BACKGROUND_COLOR_MATCH("BackgroundColorMatch"),
  UNKNOWN("Unknown"),
  IMAGE_CHARACTERISTIC_ALL_RECOMMENDED("ImageCharacteristic"),
  HEAD_SIZE_AND_POSITION_ALL_RECOMMENDED("HeadSizeAndPosition"),
  FACE_IMAGE_QUALITY_ALL_RECOMMENDED("FaceImageQuality"),
  EYES_CHARACTERISTICS_ALL_RECOMMENDED("EyesCharacteristics"),
  SHADOW_AND_LIGHTING_ALL_RECOMMENDED("ShadowsAndLightning"),
  POSE_AND_EXPRESSION_ALL_RECOMMENDED("PoseAndExpression"),
  HEAD_OCCLUSION_ALL_RECOMMENDED("HeadOcclusion"),
  QUALITY_BACKGROUND_ALL_RECOMMENDED("QualityBackground");

  const ImageQualityCharacteristicName(this.value);
  final String value;

  static ImageQualityCharacteristicName? getByValue(String? i) {
    if (i == null) return null;
    return ImageQualityCharacteristicName.values
        .firstWhere((x) => x.value == i);
  }
}
