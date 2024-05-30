part of "../../flutter_face_api.dart";

class ImageQualityGroup {
  static _Image image = _Image._privateConstructor();

  static _HeadSizeAndPosition headSizeAndPosition =
      _HeadSizeAndPosition._privateConstructor();

  static _FaceImage faceImage = _FaceImage._privateConstructor();

  static _Eyes eyes = _Eyes._privateConstructor();

  static _ShadowsAndLightning shadowsAndLightning =
      _ShadowsAndLightning._privateConstructor();

  static _PoseAndExpression poseAndExpression =
      _PoseAndExpression._privateConstructor();

  static _HeadOcclusion headOcclusion = _HeadOcclusion._privateConstructor();

  static _Background background = _Background._privateConstructor();
}

class _Image {
  _Image._privateConstructor();

  ImageQualityCharacteristic imageWidth(ImageQualityRange range) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.IMAGE_WIDTH,
      recommended: range,
    );
  }

  ImageQualityCharacteristic imageHeight(ImageQualityRange range) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.IMAGE_HEIGHT,
      recommended: range,
    );
  }

  ImageQualityCharacteristic imageWidthToHeight(ImageQualityRange range) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.IMAGE_WIDTH_TO_HEIGHT,
      recommended: range,
    );
  }

  ImageQualityCharacteristic imageChannelsNumber(int channelsNumber) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.IMAGE_CHANNELS_NUMBER,
      recommended: ImageQualityRange.withValue(channelsNumber.toDouble()),
    );
  }

  ImageQualityCharacteristic paddingRatio(ImageQualityRange range) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.PADDING_RATIO,
      recommended: range,
    );
  }

  ImageQualityCharacteristic artFace() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.ART_FACE,
    );
  }

  List<ImageQualityCharacteristic> allRecommended() {
    return [artFace()];
  }
}

class _HeadSizeAndPosition {
  _HeadSizeAndPosition._privateConstructor();

  ImageQualityCharacteristic faceMidPointHorizontalPosition() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_MID_POINT_HORIZONTAL_POSITION,
    );
  }

  ImageQualityCharacteristic faceMidPointVerticalPosition() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_MID_POINT_VERTICAL_POSITION,
    );
  }

  ImageQualityCharacteristic headWidthRatio() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.HEAD_WIDTH_RATIO,
    );
  }

  ImageQualityCharacteristic headHeightRatio() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.HEAD_HEIGHT_RATIO,
    );
  }

  ImageQualityCharacteristic eyesDistance() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYES_DISTANCE,
    );
  }

  ImageQualityCharacteristic yaw() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.YAW,
    );
  }

  ImageQualityCharacteristic pitch() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.PITCH,
    );
  }

  ImageQualityCharacteristic roll() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.ROLL,
    );
  }

  List<ImageQualityCharacteristic> allRecommended() {
    return [
      faceMidPointHorizontalPosition(),
      faceMidPointVerticalPosition(),
      headHeightRatio(),
      headWidthRatio(),
      eyesDistance(),
      yaw(),
      pitch(),
      roll(),
    ];
  }
}

class _FaceImage {
  _FaceImage._privateConstructor();

  ImageQualityCharacteristic blurLevel() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.BLUR_LEVEL,
    );
  }

  ImageQualityCharacteristic noiseLevel() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.NOISE_LEVEL,
    );
  }

  ImageQualityCharacteristic unnaturalSkinTone() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.UNNATURAL_SKIN_TONE,
    );
  }

  ImageQualityCharacteristic faceDynamicRange() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_DYNAMIC_RANGE,
    );
  }

  List<ImageQualityCharacteristic> allRecommended() {
    return [
      blurLevel(),
      noiseLevel(),
      unnaturalSkinTone(),
      faceDynamicRange(),
    ];
  }
}

class _Eyes {
  _Eyes._privateConstructor();

  ImageQualityCharacteristic eyeRightClosed() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_RIGHT_CLOSED,
    );
  }

  ImageQualityCharacteristic eyeLeftClosed() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_LEFT_CLOSED,
    );
  }

  ImageQualityCharacteristic eyeRightOccluded() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_RIGHT_OCCLUDED,
    );
  }

  ImageQualityCharacteristic eyeLeftOccluded() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_LEFT_OCCLUDED,
    );
  }

  ImageQualityCharacteristic eyesRed() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYES_RED,
    );
  }

  ImageQualityCharacteristic eyeRightCoveredWithHair() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_RIGHT_COVERED_WITH_HAIR,
    );
  }

  ImageQualityCharacteristic eyeLeftCoveredWithHair() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_LEFT_COVERED_WITH_HAIR,
    );
  }

  ImageQualityCharacteristic offGaze() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.OFF_GAZE,
    );
  }

  List<ImageQualityCharacteristic> allRecommended() {
    return [
      eyeRightClosed(),
      eyeLeftClosed(),
      eyeRightOccluded(),
      eyeLeftOccluded(),
      eyesRed(),
      eyeRightCoveredWithHair(),
      eyeLeftCoveredWithHair(),
      offGaze(),
    ];
  }
}

class _ShadowsAndLightning {
  _ShadowsAndLightning._privateConstructor();

  ImageQualityCharacteristic tooDark() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.TOO_DARK,
    );
  }

  ImageQualityCharacteristic tooLight() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.TOO_LIGHT,
    );
  }

  ImageQualityCharacteristic faceGlare() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_GLARE,
    );
  }

  ImageQualityCharacteristic shadowsOnFace() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.SHADOWS_ON_FACE,
    );
  }

  List<ImageQualityCharacteristic> allRecommended() {
    return [
      tooDark(),
      tooLight(),
      faceGlare(),
      shadowsOnFace(),
    ];
  }
}

class _PoseAndExpression {
  _PoseAndExpression._privateConstructor();

  ImageQualityCharacteristic shouldersPose() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.SHOULDERS_POSE,
    );
  }

  ImageQualityCharacteristic expressionLevel() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EXPRESSION_LEVEL,
    );
  }

  ImageQualityCharacteristic mouthOpen() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.MOUTH_OPEN,
    );
  }

  ImageQualityCharacteristic smile() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.SMILE,
    );
  }

  List<ImageQualityCharacteristic> allRecommended() {
    return [
      shouldersPose(),
      expressionLevel(),
      mouthOpen(),
      smile(),
    ];
  }
}

class _HeadOcclusion {
  _HeadOcclusion._privateConstructor();

  ImageQualityCharacteristic darkGlasses() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.DARK_GLASSES,
    );
  }

  ImageQualityCharacteristic reflectionOnGlasses() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.REFLECTION_ON_GLASSES,
    );
  }

  ImageQualityCharacteristic framesTooHeavy() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FRAMES_TOO_HEAVY,
    );
  }

  ImageQualityCharacteristic faceOccluded() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_OCCLUDED,
    );
  }

  ImageQualityCharacteristic headCovering() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.HEAD_COVERING,
    );
  }

  ImageQualityCharacteristic foreheadCovering() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FOREHEAD_COVERING,
    );
  }

  ImageQualityCharacteristic strongMakeup() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.STRONG_MAKEUP,
    );
  }

  ImageQualityCharacteristic headphones() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.HEAD_PHONES,
    );
  }

  ImageQualityCharacteristic medicalMask() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.MEDICAL_MASK,
    );
  }

  List<ImageQualityCharacteristic> allRecommended() {
    return [
      darkGlasses(),
      reflectionOnGlasses(),
      framesTooHeavy(),
      faceOccluded(),
      headCovering(),
      foreheadCovering(),
      strongMakeup(),
      headphones(),
      medicalMask(),
    ];
  }
}

class _Background {
  _Background._privateConstructor();

  ImageQualityCharacteristic backgroundUniformity() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.BACKGROUND_UNIFORMITY,
    );
  }

  ImageQualityCharacteristic shadowsOnBackground() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.SHADOWS_ON_BACKGROUND,
    );
  }

  ImageQualityCharacteristic otherFaces() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.OTHER_FACES,
    );
  }

  ImageQualityCharacteristic backgroundColorMatch({Color? color}) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.BACKGROUND_COLOR_MATCH,
      color: color,
    );
  }

  List<ImageQualityCharacteristic> allRecommended() {
    return [
      backgroundUniformity(),
      shadowsOnBackground(),
      otherFaces(),
      backgroundColorMatch(),
    ];
  }
}
