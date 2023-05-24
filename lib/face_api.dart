import 'dart:async';
import 'package:flutter/services.dart';

// Classes

class FaceCaptureException {
  String? errorCode;
  String? message;

  static FaceCaptureException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceCaptureException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class InitException {
  String? errorCode;
  String? message;

  static InitException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new InitException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class LivenessErrorException {
  String? errorCode;
  LivenessBackendException? underlyingException;
  String? message;

  static LivenessErrorException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessErrorException();

    result.errorCode = jsonObject["errorCode"];
    result.underlyingException =
        LivenessBackendException.fromJson(jsonObject["underlyingException"]);
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (underlyingException != null)
      _result.addAll({"underlyingException": underlyingException});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class LivenessBackendException {
  int? errorCode;
  String? message;

  static LivenessBackendException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessBackendException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class MatchFacesException {
  String? errorCode;
  String? message;

  static MatchFacesException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class FaceCaptureResponse {
  FaceCaptureException? exception;
  Image? image;

  static FaceCaptureResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceCaptureResponse();

    result.exception = FaceCaptureException.fromJson(jsonObject["exception"]);
    result.image = Image.fromJson(jsonObject["image"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (exception != null) _result.addAll({"exception": exception});
    if (image != null) _result.addAll({"image": image});

    return _result;
  }
}

class LivenessResponse {
  String? bitmap;
  String? liveness;
  String? sessionId;
  String? transactionId;
  LivenessErrorException? exception;

  static LivenessResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessResponse();

    result.bitmap = jsonObject["bitmap"];
    result.liveness = jsonObject["liveness"];
    result.sessionId = jsonObject["sessionId"];
    result.transactionId = jsonObject["transactionId"];
    result.exception = LivenessErrorException.fromJson(jsonObject["exception"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (bitmap != null) _result.addAll({"bitmap": bitmap});
    if (liveness != null) _result.addAll({"liveness": liveness});
    if (sessionId != null) _result.addAll({"sessionId": sessionId});
    if (transactionId != null) _result.addAll({"transactionId": transactionId});
    if (exception != null) _result.addAll({"exception": exception});

    return _result;
  }
}

class MatchFacesResponse {
  MatchFacesException? exception;
  List<MatchFacesDetection?> detections = [];
  List<MatchFacesComparedFacesPair?> results = [];

  static MatchFacesResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesResponse();

    result.exception = MatchFacesException.fromJson(jsonObject["exception"]);
    if (jsonObject["detections"] != null)
      for (var item in jsonObject["detections"])
        result.detections.add(MatchFacesDetection.fromJson(item));
    if (jsonObject["results"] != null)
      for (var item in jsonObject["results"])
        result.results.add(MatchFacesComparedFacesPair.fromJson(item));

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (exception != null) _result.addAll({"exception": exception});
    _result.addAll({"detections": detections});
    _result.addAll({"results": results});

    return _result;
  }
}

class Image {
  int? imageType;
  String? bitmap;
  String? tag;
  List<dynamic>? imageData;

  static Image? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Image();

    result.imageType = jsonObject["imageType"];
    result.bitmap = jsonObject["bitmap"];
    result.tag = jsonObject["tag"];
    result.imageData = jsonObject["imageData"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (imageType != null) _result.addAll({"imageType": imageType});
    if (bitmap != null) _result.addAll({"bitmap": bitmap});
    if (tag != null) _result.addAll({"tag": tag});
    if (imageData != null) _result.addAll({"imageData": imageData});

    return _result;
  }
}

class MatchFacesRequest {
  List<MatchFacesImage?> images = [];
  dynamic customMetadata;
  bool? thumbnails;

  static MatchFacesRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesRequest();

    if (jsonObject["images"] != null)
      for (var item in jsonObject["images"])
        result.images.add(MatchFacesImage.fromJson(item));
    result.customMetadata = jsonObject["customMetadata"];
    result.thumbnails = jsonObject["thumbnails"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    _result.addAll({"images": images});
    if (customMetadata != null)
      _result.addAll({"customMetadata": customMetadata});
    if (thumbnails != null) _result.addAll({"thumbnails": thumbnails});

    return _result;
  }
}

class MatchFacesImage {
  int? imageType;
  bool? detectAll;
  String? bitmap;
  String? identifier;

  static MatchFacesImage? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesImage();

    result.imageType = jsonObject["imageType"];
    result.detectAll = jsonObject["detectAll"];
    result.bitmap = jsonObject["bitmap"];
    result.identifier = jsonObject["identifier"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (imageType != null) _result.addAll({"imageType": imageType});
    if (detectAll != null) _result.addAll({"detectAll": detectAll});
    if (bitmap != null) _result.addAll({"bitmap": bitmap});
    if (identifier != null) _result.addAll({"identifier": identifier});

    return _result;
  }
}

class MatchFacesComparedFacesPair {
  MatchFacesComparedFace? first;
  MatchFacesComparedFace? second;
  double? similarity;
  double? score;
  MatchFacesException? exception;

  static MatchFacesComparedFacesPair? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesComparedFacesPair();

    result.first = MatchFacesComparedFace.fromJson(jsonObject["first"]);
    result.second = MatchFacesComparedFace.fromJson(jsonObject["second"]);
    result.similarity = jsonObject["similarity"] == null
        ? null
        : jsonObject["similarity"].toDouble();
    result.score =
        jsonObject["score"] == null ? null : jsonObject["score"].toDouble();
    result.exception = MatchFacesException.fromJson(jsonObject["exception"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (first != null) _result.addAll({"first": first});
    if (second != null) _result.addAll({"second": second});
    if (similarity != null) _result.addAll({"similarity": similarity});
    if (score != null) _result.addAll({"score": score});
    if (exception != null) _result.addAll({"exception": exception});

    return _result;
  }
}

class MatchFacesComparedFace {
  MatchFacesDetectionFace? face;
  MatchFacesImage? image;
  int? faceIndex;
  int? imageIndex;

  static MatchFacesComparedFace? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesComparedFace();

    result.face = MatchFacesDetectionFace.fromJson(jsonObject["face"]);
    result.image = MatchFacesImage.fromJson(jsonObject["image"]);
    result.faceIndex = jsonObject["faceIndex"];
    result.imageIndex = jsonObject["imageIndex"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (face != null) _result.addAll({"face": face});
    if (image != null) _result.addAll({"image": image});
    if (faceIndex != null) _result.addAll({"faceIndex": faceIndex});
    if (imageIndex != null) _result.addAll({"imageIndex": imageIndex});

    return _result;
  }
}

class MatchFacesDetectionFace {
  int? faceIndex;
  List<Point?> landmarks = [];
  Rect? faceRect;
  double? rotationAngle;
  String? thumbnail;

  static MatchFacesDetectionFace? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesDetectionFace();

    result.faceIndex = jsonObject["faceIndex"];
    if (jsonObject["landmarks"] != null)
      for (var item in jsonObject["landmarks"])
        result.landmarks.add(Point.fromJson(item));
    result.faceRect = Rect.fromJson(jsonObject["faceRect"]);
    result.rotationAngle = jsonObject["rotationAngle"] == null
        ? null
        : jsonObject["rotationAngle"].toDouble();
    result.thumbnail = jsonObject["thumbnail"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (faceIndex != null) _result.addAll({"faceIndex": faceIndex});
    _result.addAll({"landmarks": landmarks});
    if (faceRect != null) _result.addAll({"faceRect": faceRect});
    if (rotationAngle != null) _result.addAll({"rotationAngle": rotationAngle});
    if (thumbnail != null) _result.addAll({"thumbnail": thumbnail});

    return _result;
  }
}

class MatchFacesDetection {
  MatchFacesImage? image;
  int? imageIndex;
  List<MatchFacesDetectionFace?> faces = [];
  MatchFacesException? exception;

  static MatchFacesDetection? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesDetection();

    result.image = MatchFacesImage.fromJson(jsonObject["image"]);
    result.imageIndex = jsonObject["imageIndex"];
    if (jsonObject["faces"] != null)
      for (var item in jsonObject["faces"])
        result.faces.add(MatchFacesDetectionFace.fromJson(item));
    result.exception = MatchFacesException.fromJson(jsonObject["exception"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (image != null) _result.addAll({"image": image});
    if (imageIndex != null) _result.addAll({"imageIndex": imageIndex});
    _result.addAll({"faces": faces});
    if (exception != null) _result.addAll({"exception": exception});

    return _result;
  }
}

class Point {
  int? x;
  int? y;

  static Point? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Point();

    result.x = jsonObject["x"];
    result.y = jsonObject["y"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (x != null) _result.addAll({"x": x});
    if (y != null) _result.addAll({"y": y});

    return _result;
  }
}

class Rect {
  int? bottom;
  int? top;
  int? left;
  int? right;

  static Rect? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Rect();

    result.bottom = jsonObject["bottom"];
    result.top = jsonObject["top"];
    result.left = jsonObject["left"];
    result.right = jsonObject["right"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (bottom != null) _result.addAll({"bottom": bottom});
    if (top != null) _result.addAll({"top": top});
    if (left != null) _result.addAll({"left": left});
    if (right != null) _result.addAll({"right": right});

    return _result;
  }
}

class MatchFacesSimilarityThresholdSplit {
  List<MatchFacesComparedFacesPair?> matchedFaces = [];
  List<MatchFacesComparedFacesPair?> unmatchedFaces = [];

  static MatchFacesSimilarityThresholdSplit? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesSimilarityThresholdSplit();

    if (jsonObject["matchedFaces"] != null)
      for (var item in jsonObject["matchedFaces"])
        result.matchedFaces.add(MatchFacesComparedFacesPair.fromJson(item));
    if (jsonObject["unmatchedFaces"] != null)
      for (var item in jsonObject["unmatchedFaces"])
        result.unmatchedFaces.add(MatchFacesComparedFacesPair.fromJson(item));

    return result;
  }

  Map toJson() {
    Map _result = {};

    _result.addAll({"matchedFaces": matchedFaces});
    _result.addAll({"unmatchedFaces": unmatchedFaces});

    return _result;
  }
}

class DetectFacesRequest {
  String? scenario;
  String? image;
  DetectFacesConfiguration? configuration;

  static DetectFacesRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetectFacesRequest();

    result.scenario = jsonObject["scenario"];
    result.image = jsonObject["image"];
    result.configuration =
        DetectFacesConfiguration.fromJson(jsonObject["configuration"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (scenario != null) _result.addAll({"scenario": scenario});
    if (image != null) _result.addAll({"image": image});
    if (configuration != null) _result.addAll({"configuration": configuration});

    return _result;
  }
}

class DetectFacesConfiguration {
  List<String?> attributes = [];
  List<ImageQualityCharacteristic?> customQuality = [];
  OutputImageParams? outputImageParams;
  bool? onlyCentralFace;

  static DetectFacesConfiguration? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetectFacesConfiguration();

    if (jsonObject["attributes"] != null)
      for (var item in jsonObject["attributes"]) result.attributes.add(item);
    if (jsonObject["customQuality"] != null)
      for (var item in jsonObject["customQuality"])
        result.customQuality.add(ImageQualityCharacteristic.fromJson(item));
    result.outputImageParams =
        OutputImageParams.fromJson(jsonObject["outputImageParams"]);
    result.onlyCentralFace = jsonObject["onlyCentralFace"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    _result.addAll({"attributes": attributes});
    _result.addAll({"customQuality": customQuality});
    if (outputImageParams != null)
      _result.addAll({"outputImageParams": outputImageParams});
    if (onlyCentralFace != null)
      _result.addAll({"onlyCentralFace": onlyCentralFace});

    return _result;
  }
}

class OutputImageParams {
  String? backgroundColor;
  OutputImageCrop? crop;

  static OutputImageParams? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new OutputImageParams();

    result.backgroundColor = jsonObject["backgroundColor"];
    result.crop = OutputImageCrop.fromJson(jsonObject["crop"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (backgroundColor != null)
      _result.addAll({"backgroundColor": backgroundColor});
    if (crop != null) _result.addAll({"crop": crop});

    return _result;
  }
}

class OutputImageCrop {
  int? type;
  Size? size;
  String? padColor;
  bool? returnOriginalRect;

  static OutputImageCrop? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new OutputImageCrop();

    result.type = jsonObject["type"];
    result.size = Size.fromJson(jsonObject["size"]);
    result.padColor = jsonObject["padColor"];
    result.returnOriginalRect = jsonObject["returnOriginalRect"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (type != null) _result.addAll({"type": type});
    if (size != null) _result.addAll({"size": size});
    if (padColor != null) _result.addAll({"padColor": padColor});
    if (returnOriginalRect != null)
      _result.addAll({"returnOriginalRect": returnOriginalRect});

    return _result;
  }
}

class ImageQualityCharacteristic {
  String? characteristicName;
  int? imageQualityGroup;
  ImageQualityRange? recommendedRange;
  ImageQualityRange? customRange;

  static ImageQualityCharacteristic? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageQualityCharacteristic();

    result.characteristicName = jsonObject["characteristicName"];
    result.imageQualityGroup = jsonObject["imageQualityGroup"];
    result.recommendedRange =
        ImageQualityRange.fromJson(jsonObject["recommendedRange"]);
    result.customRange = ImageQualityRange.fromJson(jsonObject["customRange"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (characteristicName != null)
      _result.addAll({"characteristicName": characteristicName});
    if (imageQualityGroup != null)
      _result.addAll({"imageQualityGroup": imageQualityGroup});
    if (recommendedRange != null)
      _result.addAll({"recommendedRange": recommendedRange});
    if (customRange != null) _result.addAll({"customRange": customRange});

    return _result;
  }
}

class ImageQualityRange {
  double? min;
  double? max;

  static ImageQualityRange? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageQualityRange();

    result.min =
        jsonObject["min"] == null ? null : jsonObject["min"].toDouble();
    result.max =
        jsonObject["max"] == null ? null : jsonObject["max"].toDouble();

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (min != null) _result.addAll({"min": min});
    if (max != null) _result.addAll({"max": max});

    return _result;
  }
}

class Size {
  int? width;
  int? height;

  static Size? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Size();

    result.width = jsonObject["width"];
    result.height = jsonObject["height"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (width != null) _result.addAll({"width": width});
    if (height != null) _result.addAll({"height": height});

    return _result;
  }
}

class DetectFacesResponse {
  DetectFaceResult? detection;
  String? scenario;
  DetectFacesErrorException? error;
  List<DetectFaceResult?> allDetections = [];

  static DetectFacesResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetectFacesResponse();

    result.detection = DetectFaceResult.fromJson(jsonObject["detection"]);
    result.scenario = jsonObject["scenario"];
    result.error = DetectFacesErrorException.fromJson(jsonObject["error"]);
    if (jsonObject["allDetections"] != null)
      for (var item in jsonObject["allDetections"])
        result.allDetections.add(DetectFaceResult.fromJson(item));

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (detection != null) _result.addAll({"detection": detection});
    if (scenario != null) _result.addAll({"scenario": scenario});
    if (error != null) _result.addAll({"error": error});
    _result.addAll({"allDetections": allDetections});

    return _result;
  }
}

class DetectFacesErrorException {
  String? errorCode;
  DetectFacesBackendException? underlyingException;
  String? message;

  static DetectFacesErrorException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetectFacesErrorException();

    result.errorCode = jsonObject["errorCode"];
    result.underlyingException =
        DetectFacesBackendException.fromJson(jsonObject["underlyingException"]);
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (underlyingException != null)
      _result.addAll({"underlyingException": underlyingException});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class DetectFacesBackendException {
  int? errorCode;
  String? message;

  static DetectFacesBackendException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetectFacesBackendException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class DetectFaceResult {
  List<ImageQualityResult?> quality = [];
  List<DetectFacesAttributeResult?> attributes = [];
  List<Point?> landmarks = [];
  String? crop;
  Rect? faceRect;
  Rect? originalRect;
  bool? isQualityCompliant;

  static DetectFaceResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetectFaceResult();

    if (jsonObject["quality"] != null)
      for (var item in jsonObject["quality"])
        result.quality.add(ImageQualityResult.fromJson(item));
    if (jsonObject["attributes"] != null)
      for (var item in jsonObject["attributes"])
        result.attributes.add(DetectFacesAttributeResult.fromJson(item));
    if (jsonObject["landmarks"] != null)
      for (var item in jsonObject["landmarks"])
        result.landmarks.add(Point.fromJson(item));
    result.crop = jsonObject["crop"];
    result.faceRect = Rect.fromJson(jsonObject["faceRect"]);
    result.originalRect = Rect.fromJson(jsonObject["originalRect"]);
    result.isQualityCompliant = jsonObject["isQualityCompliant"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    _result.addAll({"quality": quality});
    _result.addAll({"attributes": attributes});
    _result.addAll({"landmarks": landmarks});
    if (crop != null) _result.addAll({"crop": crop});
    if (faceRect != null) _result.addAll({"faceRect": faceRect});
    if (originalRect != null) _result.addAll({"originalRect": originalRect});
    if (isQualityCompliant != null)
      _result.addAll({"isQualityCompliant": isQualityCompliant});

    return _result;
  }
}

class ImageQualityResult {
  String? name;
  int? group;
  int? status;
  ImageQualityRange? range;
  double? value;

  static ImageQualityResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageQualityResult();

    result.name = jsonObject["name"];
    result.group = jsonObject["group"];
    result.status = jsonObject["status"];
    result.range = ImageQualityRange.fromJson(jsonObject["range"]);
    result.value =
        jsonObject["value"] == null ? null : jsonObject["value"].toDouble();

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (name != null) _result.addAll({"name": name});
    if (group != null) _result.addAll({"group": group});
    if (status != null) _result.addAll({"status": status});
    if (range != null) _result.addAll({"range": range});
    if (value != null) _result.addAll({"value": value});

    return _result;
  }
}

class DetectFacesAttributeResult {
  String? attribute;
  String? value;
  ImageQualityRange? range;
  double? confidence;

  static DetectFacesAttributeResult? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetectFacesAttributeResult();

    result.attribute = jsonObject["attribute"];
    result.value = jsonObject["value"];
    result.range = ImageQualityRange.fromJson(jsonObject["range"]);
    result.confidence = jsonObject["confidence"] == null
        ? null
        : jsonObject["confidence"].toDouble();

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (attribute != null) _result.addAll({"attribute": attribute});
    if (value != null) _result.addAll({"value": value});
    if (range != null) _result.addAll({"range": range});
    if (confidence != null) _result.addAll({"confidence": confidence});

    return _result;
  }
}

// Enum

class ImageQualityGroupName {
  static const int IMAGE_CHARACTERISTICS = 1;
  static const int HEAD_SIZE_AND_POSITION = 2;
  static const int FACE_QUALITY = 3;
  static const int EYES_CHARACTERISTICS = 4;
  static const int SHADOWS_AND_LIGHTNING = 5;
  static const int POSE_AND_EXPRESSION = 6;
  static const int HEAD_OCCLUSION = 7;
  static const int BACKGROUND = 8;
  static const int UNKNOWN = 9;
}

class DetectFacesErrorCode {
  static const String IMAGE_EMPTY = "IMAGE_EMPTY";
  static const String FR_FACE_NOT_DETECTED = "FR_FACE_NOT_DETECTED";
  static const String FACER_NO_LICENSE = "FACER_NO_LICENSE";
  static const String FACER_IS_NOT_INITIALIZED = "FACER_IS_NOT_INITIALIZED";
  static const String FACER_COMMAND_IS_NOT_SUPPORTED =
      "FACER_COMMAND_IS_NOT_SUPPORTED";
  static const String FACER_COMMAND_PARAMS_READ_ERROR =
      "FACER_COMMAND_PARAMS_READ_ERROR";
  static const String PROCESSING_FAILED = "PROCESSING_FAILED";
  static const String REQUEST_FAILED = "REQUEST_FAILED";
  static const String API_CALL_FAILED = "API_CALL_FAILED";
}

class InitErrorCode {
  static const String IN_PROGRESS_ALREADY = "IN_PROGRESS_ALREADY";
  static const String CONTEXT_IS_NULL = "CONTEXT_IS_NULL";
  static const String MISSING_CORE = "MISSING_CORE";
  static const String INTERNAL_CORE_ERROR = "INTERNAL_CORE_ERROR";
}

class LivenessStatus {
  static const String PASSED = "PASSED";
  static const String UNKNOWN = "UNKNOWN";
}

class CameraErrorCode {
  static const String CAMERA_NOT_AVAILABLE = "CAMERA_NOT_AVAILABLE";
  static const String CAMERA_NO_PERMISSION = "CAMERA_NO_PERMISSION";
}

class LivenessErrorCode {
  static const String CONTEXT_IS_NULL = "CONTEXT_IS_NULL";
  static const String IN_PROGRESS_ALREADY = "IN_PROGRESS_ALREADY";
  static const String ZOOM_NOT_SUPPORTED = "ZOOM_NOT_SUPPORTED";
  static const String NO_LICENSE = "NO_LICENSE";
  static const String CANCELLED = "CANCELLED";
  static const String PROCESSING_TIMEOUT = "PROCESSING_TIMEOUT";
  static const String API_CALL_FAILED = "API_CALL_FAILED";
  static const String PROCESSING_FAILED = "PROCESSING_FAILED";
  static const String NOT_INITIALIZED = "NOT_INITIALIZED";
  static const String CAMERA_NO_PERMISSION = "CAMERA_NO_PERMISSION";
  static const String CAMERA_NOT_AVAILABLE = "CAMERA_NOT_AVAILABLE";
  static const String PROCESSING_FRAME_FAILED = "PROCESSING_FRAME_FAILED";
}

class DetectFacesBackendErrorCode {
  static const int FR_FACE_NOT_DETECTED = 2;
  static const int FACER_NO_LICENSE = 200;
  static const int FACER_IS_NOT_INITIALIZED = 201;
  static const int FACER_COMMAND_IS_NOT_SUPPORTED = 202;
  static const int FACER_COMMAND_PARAMS_READ_ERROR = 203;
  static const int UNDEFINED = -1;
}

class MatchFacesErrorCode {
  static const String IMAGE_EMPTY = "IMAGE_EMPTY";
  static const String FACE_NOT_DETECTED = "FACE_NOT_DETECTED";
  static const String LANDMARKS_NOT_DETECTED = "LANDMARKS_NOT_DETECTED";
  static const String FACE_ALIGNER_FAILED = "FACE_ALIGNER_FAILED";
  static const String DESCRIPTOR_EXTRACTOR_ERROR = "DESCRIPTOR_EXTRACTOR_ERROR";
  static const String NO_LICENSE = "NO_LICENSE";
  static const String IMAGES_COUNT_LIMIT_EXCEEDED =
      "IMAGES_COUNT_LIMIT_EXCEEDED";
  static const String API_CALL_FAILED = "API_CALL_FAILED";
  static const String PROCESSING_FAILED = "PROCESSING_FAILED";
}

class ImageQualityCharacteristicName {
  static const String IMAGE_WIDTH = "ImageWidth";
  static const String IMAGE_HEIGHT = "ImageHeight";
  static const String IMAGE_WIDTH_TO_HEIGHT = "ImageWidthToHeight";
  static const String IMAGE_CHANNELS_NUMBER = "ImageChannelsNumber";
  static const String PADDING_RATIO = "PaddingRatio";
  static const String FACE_MID_POINT_HORIZONTAL_POSITION =
      "FaceMidPointHorizontalPosition";
  static const String FACE_MID_POINT_VERTICAL_POSITION =
      "FaceMidPointVerticalPosition";
  static const String HEAD_WIDTH_RATIO = "HeadWidthRatio";
  static const String HEAD_HEIGHT_RATIO = "HeadHeightRatio";
  static const String EYES_DISTANCE = "EyesDistance";
  static const String YAW = "Yaw";
  static const String PITCH = "Pitch";
  static const String ROLL = "Roll";
  static const String BLUR_LEVEL = "BlurLevel";
  static const String NOISE_LEVEL = "NoiseLevel";
  static const String UNNATURAL_SKIN_TONE = "UnnaturalSkinTone";
  static const String FACE_DYNAMIC_RANGE = "FaceDynamicRange";
  static const String EYE_RIGHT_CLOSED = "EyeRightClosed";
  static const String EYE_LEFT_CLOSED = "EyeLeftClosed";
  static const String EYE_RIGHT_OCCLUDED = "EyeRightOccluded";
  static const String EYE_LEFT_OCCLUDED = "EyeLeftOccluded";
  static const String EYES_RED = "EyesRed";
  static const String EYE_RIGHT_COVERED_WITH_HAIR = "EyeRightCoveredWithHair";
  static const String EYE_LEFT_COVERED_WITH_HAIR = "EyeLeftCoveredWithHair";
  static const String OFF_GAZE = "OffGaze";
  static const String TOO_DARK = "TooDark";
  static const String TOO_LIGHT = "TooLight";
  static const String FACE_GLARE = "FaceGlare";
  static const String SHADOWS_ON_FACE = "ShadowsOnFace";
  static const String SHOULDERS_POSE = "ShouldersPose";
  static const String EXPRESSION_LEVEL = "ExpressionLevel";
  static const String MOUTH_OPEN = "MouthOpen";
  static const String SMILE = "Smile";
  static const String DARK_GLASSES = "DarkGlasses";
  static const String REFLECTION_ON_GLASSES = "ReflectionOnGlasses";
  static const String FRAMES_TOO_HEAVY = "FramesTooHeavy";
  static const String FACE_OCCLUDED = "FaceOccluded";
  static const String HEAD_COVERING = "HeadCovering";
  static const String FOREHEAD_COVERING = "ForeheadCovering";
  static const String STRONG_MAKEUP = "StrongMakeup";
  static const String HEAD_PHONES = "Headphones";
  static const String MEDICAL_MASK = "MedicalMask";
  static const String BACKGROUND_UNIFORMITY = "BackgroundUniformity";
  static const String SHADOWS_ON_BACKGROUND = "ShadowsOnBackground";
  static const String OTHER_FACES = "OtherFaces";
  static const String BACKGROUND_COLOR_MATCH = "BackgroundColorMatch";
  static const String UNKNOWN = "Unknown";
}

class DetectFacesScenario {
  static const String CROP_CENTRAL_FACE = "CropCentralFace";
  static const String CROP_ALL_FACES = "CropAllFaces";
  static const String THUMBNAIL = "Thumbnail";
  static const String ATTRIBUTES_ALL = "AttributesAll";
  static const String QUALITY_FULL = "QualityFull";
  static const String QUALITY_ICAO = "QualityICAO";
  static const String QUALITY_VISA_SCHENGEN = "QualityVisaSchengen";
  static const String QUALITY_VISA_USA = "QualityVisaUSA";
}

class OutputImageCropAspectRatio {
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_3X4 = 0;
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_4X5 = 1;
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_2X3 = 2;
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_1X1 = 3;
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_7X9 = 4;
}

class LivenessSkipStep {
  static const int NONE = 0;
  static const int START_STEP = 1;
  static const int DONE_STEP = 2;
}

class ImageQualityResultStatus {
  static const int IMAGE_QUALITY_RESULT_STATUS_FALSE = 0;
  static const int IMAGE_QUALITY_RESULT_STATUS_TRUE = 1;
  static const int IMAGE_QUALITY_RESULT_STATUS_UNDETERMINED = 2;
}

class ImageType {
  static const int PRINTED = 1;
  static const int RFID = 2;
  static const int LIVE = 3;
  static const int DOCUMENT_WITH_LIVE = 4;
  static const int EXTERNAL = 5;
  static const int GHOST_PORTRAIT = 6;
}

class FaceCaptureErrorCode {
  static const String CANCEL = "CANCEL";
  static const String CAMERA_NOT_AVAILABLE = "CAMERA_NOT_AVAILABLE";
  static const String CAMERA_NO_PERMISSION = "CAMERA_NO_PERMISSION";
  static const String IN_PROGRESS_ALREADY = "IN_PROGRESS_ALREADY";
  static const String CONTEXT_IS_NULL = "CONTEXT_IS_NULL";
  static const String TIMEOUT = "TIMEOUT";
  static const String NOT_INITIALIZED = "NOT_INITIALIZED";
}

class LivenessBackendErrorCode {
  static const int UNDEFINED = -1;
  static const int NO_LICENSE = 200;
  static const int LOW_QUALITY = 231;
  static const int HIGH_ASYMMETRY = 232;
  static const int TRACK_BREAK = 246;
  static const int CLOSED_EYES_DETECTED = 230;
  static const int FACE_OVER_EMOTIONAL = 233;
  static const int SUNGLASSES_DETECTED = 234;
  static const int SMALL_AGE = 235;
  static const int HEADDRESS_DETECTED = 236;
  static const int MEDICINE_MASK_DETECTED = 239;
  static const int OCCLUSION_DETECTED = 240;
  static const int FOREHEAD_GLASSES_DETECTED = 242;
  static const int MOUTH_OPENED = 243;
  static const int ART_MASK_DETECTED = 244;
  static const int NOT_MATCHED = 237;
  static const int IMAGES_COUNT_LIMIT_EXCEEDED = 238;
  static const int ELECTRONIC_DEVICE_DETECTED = 245;
  static const int WRONG_GEO = 247;
  static const int WRONG_OF = 248;
  static const int WRONG_VIEW = 249;
}

class DetectFacesAttribute {
  static const String AGE = "Age";
  static const String EYE_RIGHT = "EyeRight";
  static const String EYE_LEFT = "EyeLeft";
  static const String EMOTION = "Emotion";
  static const String SMILE = "Smile";
  static const String GLASSES = "Glasses";
  static const String HEAD_COVERING = "HeadCovering";
  static const String FOREHEAD_COVERING = "ForeheadCovering";
  static const String MOUTH = "Mouth";
  static const String MEDICAL_MASK = "MedicalMask";
  static const String OCCLUSION = "Occlusion";
  static const String STRONG_MAKEUP = "StrongMakeup";
  static const String HEADPHONES = "Headphones";
}

class FaceSDK {
  static const MethodChannel _channel =
      const MethodChannel('flutter_face_api/method');

  static Future<dynamic> getServiceUrl() async {
    return await _channel.invokeMethod("getServiceUrl", []);
  }

  static Future<dynamic> startLiveness() async {
    return await _channel.invokeMethod("startLiveness", []);
  }

  static Future<dynamic> getFaceSdkVersion() async {
    return await _channel.invokeMethod("getFaceSdkVersion", []);
  }

  static Future<dynamic> presentFaceCaptureActivity() async {
    return await _channel.invokeMethod("presentFaceCaptureActivity", []);
  }

  static Future<dynamic> stopFaceCaptureActivity() async {
    return await _channel.invokeMethod("stopFaceCaptureActivity", []);
  }

  static Future<dynamic> init() async {
    return await _channel.invokeMethod("init", []);
  }

  static Future<dynamic> deinit() async {
    return await _channel.invokeMethod("deinit", []);
  }

  static Future<dynamic> isInitialized() async {
    return await _channel.invokeMethod("isInitialized", []);
  }

  static Future<dynamic> stopLivenessProcessing() async {
    return await _channel.invokeMethod("stopLivenessProcessing", []);
  }

  static Future<dynamic> setRequestHeaders(headers) async {
    return await _channel.invokeMethod("setRequestHeaders", [headers]);
  }

  static Future<dynamic> presentFaceCaptureActivityWithConfig(config) async {
    return await _channel
        .invokeMethod("presentFaceCaptureActivityWithConfig", [config]);
  }

  static Future<dynamic> startLivenessWithConfig(config) async {
    return await _channel.invokeMethod("startLivenessWithConfig", [config]);
  }

  static Future<dynamic> setServiceUrl(url) async {
    return await _channel.invokeMethod("setServiceUrl", [url]);
  }

  static Future<dynamic> matchFaces(request) async {
    return await _channel.invokeMethod("matchFaces", [request]);
  }

  static Future<dynamic> detectFaces(request) async {
    return await _channel.invokeMethod("detectFaces", [request]);
  }

  static Future<dynamic> matchFacesWithConfig(request, config) async {
    return await _channel
        .invokeMethod("matchFacesWithConfig", [request, config]);
  }

  static Future<dynamic> setLanguage(language) async {
    return await _channel.invokeMethod("setLanguage", [language]);
  }

  static Future<dynamic> matchFacesSimilarityThresholdSplit(
      faces, similarity) async {
    return await _channel.invokeMethod(
        "matchFacesSimilarityThresholdSplit", [faces, similarity]);
  }
}
