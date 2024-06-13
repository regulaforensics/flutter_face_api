part of "../../flutter_face_api.dart";

/// Image Quality characteristic group
class ImageQualityGroup {
  /// The Image characteristics group includes width, height, width to height proportions,
  /// the image RGB channels number, and padding ratio.
  static _Image image = _Image._privateConstructor();

  /// The Head size and position group includes the position of the "middle point"
  /// relative to the width and height of the image, the head width to the image
  /// width and height ratio, inter-eye distance, yaw, pitch, roll.
  static _HeadSizeAndPosition headSizeAndPosition =
      _HeadSizeAndPosition._privateConstructor();

  /// The Face image quality group includes blur and noise levels, unnatural skin tone,
  /// and face dynamic range checks.
  static _FaceImage faceImage = _FaceImage._privateConstructor();

  /// The Eyes characteristics group checks eyes closure, occlusion, hair coverage,
  /// red eye effect, and whether a person is looking directly at the camera.
  static _Eyes eyes = _Eyes._privateConstructor();

  /// The Shadows and lightning characteristics group checks whether a photo
  /// is too dark or overexposed, if there are glares or shadows on the face.
  static _ShadowsAndLightning shadowsAndLightning =
      _ShadowsAndLightning._privateConstructor();

  /// The Pose and expression characteristics group checks the shoulders pose,
  /// face expression, whether there is an open mouth or smile.
  static _PoseAndExpression poseAndExpression =
      _PoseAndExpression._privateConstructor();

  /// The Head occlusion group includes checks of glasses, face occlusion, and head coverage.
  static _HeadOcclusion headOcclusion = _HeadOcclusion._privateConstructor();

  /// The Background characteristics group checks the background uniformity,
  /// shadows on background, and other faces presence on the picture.
  static _Background background = _Background._privateConstructor();
}

class _Image {
  _Image._privateConstructor();

  /// The image width, pixels.
  /// Doesn't have recommended value.
  ImageQualityCharacteristic imageWidth(ImageQualityRange range) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.IMAGE_WIDTH,
      recommended: range,
    );
  }

  /// The image height, pixels.
  /// Doesn't have recommended value.
  ImageQualityCharacteristic imageHeight(ImageQualityRange range) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.IMAGE_HEIGHT,
      recommended: range,
    );
  }

  /// The image width to height proportion.
  /// Doesn't have recommended value.
  ImageQualityCharacteristic imageWidthToHeight(ImageQualityRange range) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.IMAGE_WIDTH_TO_HEIGHT,
      recommended: range,
    );
  }

  /// The image RGB channels number.
  /// Doesn't have recommended value.
  /// `channelsNumber` 3 is for RGB images.
  ImageQualityCharacteristic imageChannelsNumber(int channelsNumber) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.IMAGE_CHANNELS_NUMBER,
      recommended: ImageQualityRange.withValue(channelsNumber.toDouble()),
    );
  }

  /// The percentage of the area of the image that was "padded" during alignment.
  /// The characteristic is needed to determine if the head goes beyond the image.
  /// The range is from 0 to 1 where 0 is 0% of the image is "padded".
  /// Doesn't have recommended value.
  ImageQualityCharacteristic paddingRatio(ImageQualityRange range) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.PADDING_RATIO,
      recommended: range,
    );
  }

  /// Whether the face in the image is a photo, not a drawing, sculpture, cartoon, etc.
  /// If the returned value is out of the recommended range, the image is not a photo.
  /// The range is from 0 to 1 where 0 means the image is a photo.
  ImageQualityCharacteristic artFace() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.ART_FACE,
    );
  }

  /// All Group characteristics with default (recommended) values.
  /// Doesn't include characteristics without default values.
  List<ImageQualityCharacteristic> allRecommended() {
    return [artFace()];
  }
}

class _HeadSizeAndPosition {
  _HeadSizeAndPosition._privateConstructor();

  /// The position of the "middle point" (the middle of the line connecting the eye centers)
  /// relative to the width of the image.
  /// The range is from 0 to 1 where range [0.5, 0.5] is for "middle point" strictly in the center .
  ImageQualityCharacteristic faceMidPointHorizontalPosition() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_MID_POINT_HORIZONTAL_POSITION,
    );
  }

  /// The position of the "middle point" (the middle of the line connecting the eye centers)
  /// relative to the height of the image.
  /// The range is from 0 to 1 where range [0.5, 0.5] is for "middle point" strictly in the center .
  ImageQualityCharacteristic faceMidPointVerticalPosition() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_MID_POINT_VERTICAL_POSITION,
    );
  }

  /// The head width to the image width ratio.
  /// The range is from 0 to 1.
  ImageQualityCharacteristic headWidthRatio() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.HEAD_WIDTH_RATIO,
    );
  }

  /// The head height to the image height ratio.
  /// The range is from 0 to 1.
  ImageQualityCharacteristic headHeightRatio() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.HEAD_HEIGHT_RATIO,
    );
  }

  /// Inter-eye distance — the length of the line connecting the eye centers of the left and right eye, pixels.
  ImageQualityCharacteristic eyesDistance() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYES_DISTANCE,
    );
  }

  /// The yaw of the head, degrees.
  /// The range is from -90 to 90. Range value [0, 0] for strictly stright head position.
  ImageQualityCharacteristic yaw() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.YAW,
    );
  }

  /// The pitch of the head, degrees.
  /// The range is from -90 to 90. Range value [0, 0] for strictly stright head position.
  ImageQualityCharacteristic pitch() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.PITCH,
    );
  }

  /// The roll of the head, degrees.
  /// The range is from -90 to 90. Range value [0, 0] for strictly stright head position.
  ImageQualityCharacteristic roll() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.ROLL,
    );
  }

  /// All Group characteristics with default (recommended) values.
  /// Doesn't include characteristics without default values.
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

  /// The blur level.
  /// The range is from 0 to 1 where 0 is the absence of blur effect
  ImageQualityCharacteristic blurLevel() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.BLUR_LEVEL,
    );
  }

  /// The noise level.
  /// The range is from 0 to 1 where 0 is minimal noise level.
  ImageQualityCharacteristic noiseLevel() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.NOISE_LEVEL,
    );
  }

  /// The true-colour representation of the skin colour.
  /// The range is from 0 to 1.
  ImageQualityCharacteristic unnaturalSkinTone() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.UNNATURAL_SKIN_TONE,
    );
  }

  /// The range of tonal difference between the lightest light and darkest dark of an image, bits.
  ImageQualityCharacteristic faceDynamicRange() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_DYNAMIC_RANGE,
    );
  }

  /// All Group characteristics with default (recommended) values.
  /// Doesn't include characteristics without default values.
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

  /// Whether the right eye is closed.
  /// The range is from 0 to 1 where 1 is the eye is fully closed.
  ImageQualityCharacteristic eyeRightClosed() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_RIGHT_CLOSED,
    );
  }

  /// Whether the left eye is closed.
  /// The range is from 0 to 1 where 1 is the eye is fully closed.
  ImageQualityCharacteristic eyeLeftClosed() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_LEFT_CLOSED,
    );
  }

  /// Whether the right eye is occluded.
  /// The range is from 0 to 1 where 1 is the eye is fully occluded.
  ImageQualityCharacteristic eyeRightOccluded() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_RIGHT_OCCLUDED,
    );
  }

  /// Whether the left eye is occluded.
  /// The range is from 0 to 1 where 1 is the eye is fully occluded.
  ImageQualityCharacteristic eyeLeftOccluded() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_LEFT_OCCLUDED,
    );
  }

  /// Whether there is the red-eye effect.
  /// The range is from 0 to 1 where 0 is the absence of  red-eye effect.
  ImageQualityCharacteristic eyesRed() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYES_RED,
    );
  }

  /// Whether the right eye is covered with hair.
  /// The range is from 0 to 1 where 1 is 100% of the eye is covered by hair.
  ImageQualityCharacteristic eyeRightCoveredWithHair() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_RIGHT_COVERED_WITH_HAIR,
    );
  }

  /// Whether the left eye is covered with hair.
  /// The range is from 0 to 1 where 1 is 100% of the eye is covered by hair.
  ImageQualityCharacteristic eyeLeftCoveredWithHair() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EYE_LEFT_COVERED_WITH_HAIR,
    );
  }

  /// Whether the person is not looking directly at the camera.
  /// The range is from 0 to 1 where 0 is for absolutely direct look.
  ImageQualityCharacteristic offGaze() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.OFF_GAZE,
    );
  }

  /// All Group characteristics with default (recommended) values.
  /// Doesn't include characteristics without default values.
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

  /// Whether the photo is too dark.
  /// The range is from 0 to 1.
  ImageQualityCharacteristic tooDark() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.TOO_DARK,
    );
  }

  /// Whether the photo is overexposed.
  /// The range is from 0 to 1.
  ImageQualityCharacteristic tooLight() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.TOO_LIGHT,
    );
  }

  /// Whether there is glare on the face.
  /// The range is from 0 to 1 where 0 is the absence of glare.
  ImageQualityCharacteristic faceGlare() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_GLARE,
    );
  }

  /// Whether there are shadows on the face.
  /// The range is from 0 to 1 where 0 is the absence of shadows on the face.
  ImageQualityCharacteristic shadowsOnFace() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.SHADOWS_ON_FACE,
    );
  }

  /// All Group characteristics with default (recommended) values.
  /// Doesn't include characteristics without default values.
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

  /// Checks the symmetry of the shoulders.
  /// The range is from 0 to 1 where 1 is for absolutely symmetrical shoulders.
  ImageQualityCharacteristic shouldersPose() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.SHOULDERS_POSE,
    );
  }

  /// Checks the presence of any emotional facial expression.
  /// The range is from 0 to 1 where 0 is for absolutely non-emotional expression.
  ImageQualityCharacteristic expressionLevel() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.EXPRESSION_LEVEL,
    );
  }

  /// Whether the mouth is open.
  /// The range is from 0 to 1 where 0 is closed mouth.
  ImageQualityCharacteristic mouthOpen() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.MOUTH_OPEN,
    );
  }

  /// Whether the person smiles.
  /// The range is from 0 to 1 where 0 is smile absence.
  ImageQualityCharacteristic smile() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.SMILE,
    );
  }

  /// All Group characteristics with default (recommended) values.
  /// Doesn't include characteristics without default values.
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

  /// Whether the person wears dark glasses.
  /// The range is from 0 to 1 where 0 is dark glasses absence.
  ImageQualityCharacteristic darkGlasses() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.DARK_GLASSES,
    );
  }

  /// Whether there are reflections on glasses.
  /// The range is from 0 to 1 where 0 is reflections absence.
  /// In the current release, always succeeds. Will be developed in the coming releases.
  ImageQualityCharacteristic reflectionOnGlasses() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.REFLECTION_ON_GLASSES,
    );
  }

  /// Whether the glasses frames do not obscure eye details and the irises of both eyes are visible.
  /// The range is from 0 to 20 where 0 the absence of frames (glasses).
  ImageQualityCharacteristic framesTooHeavy() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FRAMES_TOO_HEAVY,
    );
  }

  /// Whether the face is visible and not occluded.
  /// The range is from 0 to 1 where 0 is face occlusion absence.
  ImageQualityCharacteristic faceOccluded() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FACE_OCCLUDED,
    );
  }

  /// Whether there is any head coverage other than religious headwear.
  /// The range is from 0 to 1.
  ImageQualityCharacteristic headCovering() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.HEAD_COVERING,
    );
  }

  /// Whether the forehead is covered.
  /// The range is from 0 to 1.
  ImageQualityCharacteristic foreheadCovering() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.FOREHEAD_COVERING,
    );
  }

  /// Whether the makeup is too strong.
  /// In the current release, always succeeds. Will be developed in the coming releases.
  /// The range is from 0 to 1.
  ImageQualityCharacteristic strongMakeup() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.STRONG_MAKEUP,
    );
  }

  /// Whether the person is wearing headphones.
  /// /// The range is from 0 to 1 where 0 is headphones absence.
  ImageQualityCharacteristic headphones() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.HEAD_PHONES,
    );
  }

  /// Whether the person is wearing a medical mask.
  /// The range is from 0 to 1 where 0 is medical mask absence.
  ImageQualityCharacteristic medicalMask() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.MEDICAL_MASK,
    );
  }

  /// All Group characteristics with default (recommended) values.
  /// Doesn't include characteristics without default values.
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

  /// Checks uniformity of the portrait background.
  /// The range is from 0 to 1 where 1 is absolute background uniformity.
  ImageQualityCharacteristic backgroundUniformity() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.BACKGROUND_UNIFORMITY,
    );
  }

  /// Whether there are shadows on the portrait background.
  /// The range is from 0 to 1 where 1 is the absence of shadows on the portrait background.
  ImageQualityCharacteristic shadowsOnBackground() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.SHADOWS_ON_BACKGROUND,
    );
  }

  /// The number of faces on the photo.
  /// The range starts from 1.
  ImageQualityCharacteristic otherFaces() {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.OTHER_FACES,
    );
  }

  /// Whether the background color matches default background color.
  /// Default color is white (RGB(255,255,255) or hex #FFFFFF)
  /// The range is from 0 to 1 where 1 is full background color match.
  ImageQualityCharacteristic backgroundColorMatch({Color? color}) {
    return ImageQualityCharacteristic._create(
      ImageQualityCharacteristicName.BACKGROUND_COLOR_MATCH,
      color: color,
    );
  }

  /// Whether the background color matches the required color.
  /// The range is from 0 to 1 where 1 is full background color match.
  List<ImageQualityCharacteristic> allRecommended() {
    return [
      backgroundUniformity(),
      shadowsOnBackground(),
      otherFaces(),
      backgroundColorMatch(),
    ];
  }
}
