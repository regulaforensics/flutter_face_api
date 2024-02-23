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
  LicenseException? underlyingException;
  String? message;

  static InitException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new InitException();

    result.errorCode = jsonObject["errorCode"];
    result.underlyingException =
        LicenseException.fromJson(jsonObject["underlyingException"]);
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (underlyingException != null)
      _result.addAll({"underlyingException": underlyingException!.toJson()});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class LicenseException {
  int? errorCode;
  String? message;

  static LicenseException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LicenseException();

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
      _result.addAll({"underlyingException": underlyingException!.toJson()});
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
  String? detailedErrorMessage;

  static MatchFacesException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];
    result.detailedErrorMessage = jsonObject["detailedErrorMessage"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});
    if (detailedErrorMessage != null)
      _result.addAll({"detailedErrorMessage": detailedErrorMessage});

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

    if (exception != null) _result.addAll({"exception": exception!.toJson()});
    if (image != null) _result.addAll({"image": image!.toJson()});

    return _result;
  }
}

class LivenessResponse {
  String? bitmap;
  String? liveness;
  String? tag;
  String? transactionId;
  int? estimatedAge;
  LivenessErrorException? exception;

  static LivenessResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessResponse();

    result.bitmap = jsonObject["bitmap"];
    result.liveness = jsonObject["liveness"];
    result.tag = jsonObject["tag"];
    result.transactionId = jsonObject["transactionId"];
    result.estimatedAge = jsonObject["estimatedAge"];
    result.exception = LivenessErrorException.fromJson(jsonObject["exception"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (bitmap != null) _result.addAll({"bitmap": bitmap});
    if (liveness != null) _result.addAll({"liveness": liveness});
    if (tag != null) _result.addAll({"tag": tag});
    if (transactionId != null) _result.addAll({"transactionId": transactionId});
    if (estimatedAge != null) _result.addAll({"estimatedAge": estimatedAge});
    if (exception != null) _result.addAll({"exception": exception!.toJson()});

    return _result;
  }
}

class MatchFacesResponse {
  String? tag;
  MatchFacesException? exception;
  List<MatchFacesDetection?> detections = [];
  List<MatchFacesComparedFacesPair?> results = [];

  static MatchFacesResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesResponse();

    result.tag = jsonObject["tag"];
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

    if (tag != null) _result.addAll({"tag": tag});
    if (exception != null) _result.addAll({"exception": exception!.toJson()});
    if (!detections.isEmpty) {
      var list = [];
      for (var item in detections) list.add(item!.toJson());
      _result.addAll({"detections": list});
    }
    if (!results.isEmpty) {
      var list = [];
      for (var item in results) list.add(item!.toJson());
      _result.addAll({"results": list});
    }

    return _result;
  }
}

class Image {
  int? imageType;
  String? bitmap;
  String? tag;
  String? imageData;

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
  String? tag;
  OutputImageParams? outputImageParams;

  static MatchFacesRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesRequest();

    if (jsonObject["images"] != null)
      for (var item in jsonObject["images"])
        result.images.add(MatchFacesImage.fromJson(item));
    result.customMetadata = jsonObject["customMetadata"];
    result.tag = jsonObject["tag"];
    result.outputImageParams =
        OutputImageParams.fromJson(jsonObject["outputImageParams"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (!images.isEmpty) {
      var list = [];
      for (var item in images) list.add(item!.toJson());
      _result.addAll({"images": list});
    }
    if (customMetadata != null)
      _result.addAll({"customMetadata": customMetadata});
    if (tag != null) _result.addAll({"tag": tag});
    if (outputImageParams != null)
      _result.addAll({"outputImageParams": outputImageParams!.toJson()});

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

    if (first != null) _result.addAll({"first": first!.toJson()});
    if (second != null) _result.addAll({"second": second!.toJson()});
    if (similarity != null) _result.addAll({"similarity": similarity});
    if (score != null) _result.addAll({"score": score});
    if (exception != null) _result.addAll({"exception": exception!.toJson()});

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

    if (face != null) _result.addAll({"face": face!.toJson()});
    if (image != null) _result.addAll({"image": image!.toJson()});
    if (faceIndex != null) _result.addAll({"faceIndex": faceIndex});
    if (imageIndex != null) _result.addAll({"imageIndex": imageIndex});

    return _result;
  }
}

class MatchFacesDetectionFace {
  int? faceIndex;
  double? rotationAngle;
  List<Point?> landmarks = [];
  Rect? faceRect;
  Rect? originalRect;
  String? crop;

  static MatchFacesDetectionFace? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesDetectionFace();

    result.faceIndex = jsonObject["faceIndex"];
    result.rotationAngle = jsonObject["rotationAngle"] == null
        ? null
        : jsonObject["rotationAngle"].toDouble();
    if (jsonObject["landmarks"] != null)
      for (var item in jsonObject["landmarks"])
        result.landmarks.add(Point.fromJson(item));
    result.faceRect = Rect.fromJson(jsonObject["faceRect"]);
    result.originalRect = Rect.fromJson(jsonObject["originalRect"]);
    result.crop = jsonObject["crop"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (faceIndex != null) _result.addAll({"faceIndex": faceIndex});
    if (rotationAngle != null) _result.addAll({"rotationAngle": rotationAngle});
    if (!landmarks.isEmpty) {
      var list = [];
      for (var item in landmarks) list.add(item!.toJson());
      _result.addAll({"landmarks": list});
    }
    if (faceRect != null) _result.addAll({"faceRect": faceRect!.toJson()});
    if (originalRect != null)
      _result.addAll({"originalRect": originalRect!.toJson()});
    if (crop != null) _result.addAll({"crop": crop});

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

    if (image != null) _result.addAll({"image": image!.toJson()});
    if (imageIndex != null) _result.addAll({"imageIndex": imageIndex});
    if (!faces.isEmpty) {
      var list = [];
      for (var item in faces) list.add(item!.toJson());
      _result.addAll({"faces": list});
    }
    if (exception != null) _result.addAll({"exception": exception!.toJson()});

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

    if (!matchedFaces.isEmpty) {
      var list = [];
      for (var item in matchedFaces) list.add(item!.toJson());
      _result.addAll({"matchedFaces": list});
    }
    if (!unmatchedFaces.isEmpty) {
      var list = [];
      for (var item in unmatchedFaces) list.add(item!.toJson());
      _result.addAll({"unmatchedFaces": list});
    }

    return _result;
  }
}

class DetectFacesRequest {
  String? tag;
  String? scenario;
  String? image;
  DetectFacesConfiguration? configuration;

  static DetectFacesRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new DetectFacesRequest();

    result.tag = jsonObject["tag"];
    result.scenario = jsonObject["scenario"];
    result.image = jsonObject["image"];
    result.configuration =
        DetectFacesConfiguration.fromJson(jsonObject["configuration"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (tag != null) _result.addAll({"tag": tag});
    if (scenario != null) _result.addAll({"scenario": scenario});
    if (image != null) _result.addAll({"image": image});
    if (configuration != null)
      _result.addAll({"configuration": configuration!.toJson()});

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
    if (!customQuality.isEmpty) {
      var list = [];
      for (var item in customQuality) list.add(item!.toJson());
      _result.addAll({"customQuality": list});
    }
    if (outputImageParams != null)
      _result.addAll({"outputImageParams": outputImageParams!.toJson()});
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
    if (crop != null) _result.addAll({"crop": crop!.toJson()});

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
    if (size != null) _result.addAll({"size": size!.toJson()});
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
      _result.addAll({"recommendedRange": recommendedRange!.toJson()});
    if (customRange != null)
      _result.addAll({"customRange": customRange!.toJson()});

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

    if (detection != null) _result.addAll({"detection": detection!.toJson()});
    if (scenario != null) _result.addAll({"scenario": scenario});
    if (error != null) _result.addAll({"error": error!.toJson()});
    if (!allDetections.isEmpty) {
      var list = [];
      for (var item in allDetections) list.add(item!.toJson());
      _result.addAll({"allDetections": list});
    }

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
      _result.addAll({"underlyingException": underlyingException!.toJson()});
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

    if (!quality.isEmpty) {
      var list = [];
      for (var item in quality) list.add(item!.toJson());
      _result.addAll({"quality": list});
    }
    if (!attributes.isEmpty) {
      var list = [];
      for (var item in attributes) list.add(item!.toJson());
      _result.addAll({"attributes": list});
    }
    if (!landmarks.isEmpty) {
      var list = [];
      for (var item in landmarks) list.add(item!.toJson());
      _result.addAll({"landmarks": list});
    }
    if (crop != null) _result.addAll({"crop": crop});
    if (faceRect != null) _result.addAll({"faceRect": faceRect!.toJson()});
    if (originalRect != null)
      _result.addAll({"originalRect": originalRect!.toJson()});
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
    if (range != null) _result.addAll({"range": range!.toJson()});
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
    if (range != null) _result.addAll({"range": range!.toJson()});
    if (confidence != null) _result.addAll({"confidence": confidence});

    return _result;
  }
}

class Font {
  String? name;
  int? style;
  int? size;

  static Font? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Font();

    result.name = jsonObject["name"];
    result.style = jsonObject["style"];
    result.size = jsonObject["size"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (name != null) _result.addAll({"name": name});
    if (style != null) _result.addAll({"style": style});
    if (size != null) _result.addAll({"size": size});

    return _result;
  }
}

class Person {
  String? name;
  List<String?> groups = [];
  String? updatedAt;
  String? id;
  dynamic metadata;
  String? createdAt;

  static Person? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Person();

    result.name = jsonObject["name"];
    if (jsonObject["groups"] != null)
      for (var item in jsonObject["groups"]) result.groups.add(item);
    result.updatedAt = jsonObject["updatedAt"];
    result.id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result.createdAt = jsonObject["createdAt"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (name != null) _result.addAll({"name": name});
    _result.addAll({"groups": groups});
    if (updatedAt != null) _result.addAll({"updatedAt": updatedAt});
    if (id != null) _result.addAll({"id": id});
    if (metadata != null) _result.addAll({"metadata": metadata});
    if (createdAt != null) _result.addAll({"createdAt": createdAt});

    return _result;
  }
}

class PersonGroup {
  String? name;
  String? id;
  dynamic metadata;
  String? createdAt;

  static PersonGroup? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PersonGroup();

    result.name = jsonObject["name"];
    result.id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result.createdAt = jsonObject["createdAt"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (name != null) _result.addAll({"name": name});
    if (id != null) _result.addAll({"id": id});
    if (metadata != null) _result.addAll({"metadata": metadata});
    if (createdAt != null) _result.addAll({"createdAt": createdAt});

    return _result;
  }
}

class PersonImage {
  String? path;
  String? url;
  String? contentType;
  String? id;
  dynamic metadata;
  String? createdAt;

  static PersonImage? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new PersonImage();

    result.path = jsonObject["path"];
    result.url = jsonObject["url"];
    result.contentType = jsonObject["contentType"];
    result.id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result.createdAt = jsonObject["createdAt"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (path != null) _result.addAll({"path": path});
    if (url != null) _result.addAll({"url": url});
    if (contentType != null) _result.addAll({"contentType": contentType});
    if (id != null) _result.addAll({"id": id});
    if (metadata != null) _result.addAll({"metadata": metadata});
    if (createdAt != null) _result.addAll({"createdAt": createdAt});

    return _result;
  }
}

class ImageUpload {
  String? imageData;
  String? imageUrl;

  static ImageUpload? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ImageUpload();

    result.imageData = jsonObject["imageData"];
    result.imageUrl = jsonObject["imageUrl"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (imageData != null) _result.addAll({"imageData": imageData});
    if (imageUrl != null) _result.addAll({"imageUrl": imageUrl});

    return _result;
  }
}

class EditGroupPersonsRequest {
  List<String?> personIdsToAdd = [];
  List<String?> personIdsToRemove = [];

  static EditGroupPersonsRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new EditGroupPersonsRequest();

    if (jsonObject["personIdsToAdd"] != null)
      for (var item in jsonObject["personIdsToAdd"])
        result.personIdsToAdd.add(item);
    if (jsonObject["personIdsToRemove"] != null)
      for (var item in jsonObject["personIdsToRemove"])
        result.personIdsToRemove.add(item);

    return result;
  }

  Map toJson() {
    Map _result = {};

    _result.addAll({"personIdsToAdd": personIdsToAdd});
    _result.addAll({"personIdsToRemove": personIdsToRemove});

    return _result;
  }
}

class SearchPersonRequest {
  OutputImageParams? outputImageParams;
  List<String?> groupIdsForSearch = [];
  double? threshold;
  int? limit;
  ImageUpload? imageUpload;
  bool? detectAll;

  static SearchPersonRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new SearchPersonRequest();

    result.outputImageParams =
        OutputImageParams.fromJson(jsonObject["outputImageParams"]);
    if (jsonObject["groupIdsForSearch"] != null)
      for (var item in jsonObject["groupIdsForSearch"])
        result.groupIdsForSearch.add(item);
    result.threshold = jsonObject["threshold"] == null
        ? null
        : jsonObject["threshold"].toDouble();
    result.limit = jsonObject["limit"];
    result.imageUpload = ImageUpload.fromJson(jsonObject["imageUpload"]);
    result.detectAll = jsonObject["detectAll"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (outputImageParams != null)
      _result.addAll({"outputImageParams": outputImageParams!.toJson()});
    _result.addAll({"groupIdsForSearch": groupIdsForSearch});
    if (threshold != null) _result.addAll({"threshold": threshold});
    if (limit != null) _result.addAll({"limit": limit});
    if (imageUpload != null)
      _result.addAll({"imageUpload": imageUpload!.toJson()});
    if (detectAll != null) _result.addAll({"detectAll": detectAll});

    return _result;
  }
}

class SearchPerson {
  SearchPersonDetection? detection;
  List<SearchPersonImage?> images = [];
  String? name;
  List<String?> groups = [];
  String? updatedAt;
  String? id;
  dynamic metadata;
  String? createdAt;

  static SearchPerson? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new SearchPerson();

    result.detection = SearchPersonDetection.fromJson(jsonObject["detection"]);
    if (jsonObject["images"] != null)
      for (var item in jsonObject["images"])
        result.images.add(SearchPersonImage.fromJson(item));
    result.name = jsonObject["name"];
    if (jsonObject["groups"] != null)
      for (var item in jsonObject["groups"]) result.groups.add(item);
    result.updatedAt = jsonObject["updatedAt"];
    result.id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result.createdAt = jsonObject["createdAt"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (detection != null) _result.addAll({"detection": detection!.toJson()});
    if (!images.isEmpty) {
      var list = [];
      for (var item in images) list.add(item!.toJson());
      _result.addAll({"images": list});
    }
    if (name != null) _result.addAll({"name": name});
    _result.addAll({"groups": groups});
    if (updatedAt != null) _result.addAll({"updatedAt": updatedAt});
    if (id != null) _result.addAll({"id": id});
    if (metadata != null) _result.addAll({"metadata": metadata});
    if (createdAt != null) _result.addAll({"createdAt": createdAt});

    return _result;
  }
}

class SearchPersonImage {
  double? similarity;
  double? distance;
  String? path;
  String? url;
  String? contentType;
  String? id;
  dynamic metadata;
  String? createdAt;

  static SearchPersonImage? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new SearchPersonImage();

    result.similarity = jsonObject["similarity"] == null
        ? null
        : jsonObject["similarity"].toDouble();
    result.distance = jsonObject["distance"] == null
        ? null
        : jsonObject["distance"].toDouble();
    result.path = jsonObject["path"];
    result.url = jsonObject["url"];
    result.contentType = jsonObject["contentType"];
    result.id = jsonObject["id"];
    result.metadata = jsonObject["metadata"];
    result.createdAt = jsonObject["createdAt"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (similarity != null) _result.addAll({"similarity": similarity});
    if (distance != null) _result.addAll({"distance": distance});
    if (path != null) _result.addAll({"path": path});
    if (url != null) _result.addAll({"url": url});
    if (contentType != null) _result.addAll({"contentType": contentType});
    if (id != null) _result.addAll({"id": id});
    if (metadata != null) _result.addAll({"metadata": metadata});
    if (createdAt != null) _result.addAll({"createdAt": createdAt});

    return _result;
  }
}

class SearchPersonDetection {
  List<Point?> landmarks = [];
  Rect? rect;
  String? cropImage;
  double? rotationAngle;

  static SearchPersonDetection? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new SearchPersonDetection();

    if (jsonObject["landmarks"] != null)
      for (var item in jsonObject["landmarks"])
        result.landmarks.add(Point.fromJson(item));
    result.rect = Rect.fromJson(jsonObject["rect"]);
    result.cropImage = jsonObject["cropImage"];
    result.rotationAngle = jsonObject["rotationAngle"] == null
        ? null
        : jsonObject["rotationAngle"].toDouble();

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (!landmarks.isEmpty) {
      var list = [];
      for (var item in landmarks) list.add(item!.toJson());
      _result.addAll({"landmarks": list});
    }
    if (rect != null) _result.addAll({"rect": rect!.toJson()});
    if (cropImage != null) _result.addAll({"cropImage": cropImage});
    if (rotationAngle != null) _result.addAll({"rotationAngle": rotationAngle});

    return _result;
  }
}

class LivenessNotification {
  String? status;
  LivenessResponse? response;

  static LivenessNotification? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessNotification();

    result.status = jsonObject["status"];
    result.response = LivenessResponse.fromJson(jsonObject["response"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (status != null) _result.addAll({"status": status});
    if (response != null) _result.addAll({"response": response!.toJson()});

    return _result;
  }
}

class VideoEncoderCompletion {
  bool? success;
  String? transactionId;

  static VideoEncoderCompletion? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new VideoEncoderCompletion();

    result.success = jsonObject["success"];
    result.transactionId = jsonObject["transactionId"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (success != null) _result.addAll({"success": success});
    if (transactionId != null) _result.addAll({"transactionId": transactionId});

    return _result;
  }
}

class InitializationConfiguration {
  String? license;
  bool? licenseUpdate;

  static InitializationConfiguration? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new InitializationConfiguration();

    result.license = jsonObject["license"];
    result.licenseUpdate = jsonObject["licenseUpdate"];

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (license != null) _result.addAll({"license": license});
    if (licenseUpdate != null) _result.addAll({"licenseUpdate": licenseUpdate});

    return _result;
  }
}

class InitResponse {
  bool? success;
  InitException? error;

  static InitResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new InitResponse();

    result.success = jsonObject["success"];
    result.error = InitException.fromJson(jsonObject["error"]);

    return result;
  }

  Map toJson() {
    Map _result = {};

    if (success != null) _result.addAll({"success": success});
    if (error != null) _result.addAll({"error": error!.toJson()});

    return _result;
  }
}

// Enum

class FontStyle {
  static const int NORMAL = 0;
  static const int BOLD = 1;
  static const int ITALIC = 2;
  static const int BOLD_ITALIC = 3;
}

class CustomizationColor {
  static const String ONBOARDING_SCREEN_START_BUTTON_BACKGROUND =
      "CustomizationColor.ONBOARDING_SCREEN_START_BUTTON_BACKGROUND";
  static const String ONBOARDING_SCREEN_START_BUTTON_TITLE =
      "CustomizationColor.ONBOARDING_SCREEN_START_BUTTON_TITLE";
  static const String ONBOARDING_SCREEN_BACKGROUND =
      "CustomizationColor.ONBOARDING_SCREEN_BACKGROUND";
  static const String ONBOARDING_SCREEN_TITLE_LABEL_TEXT =
      "CustomizationColor.ONBOARDING_SCREEN_TITLE_LABEL_TEXT";
  static const String ONBOARDING_SCREEN_SUBTITLE_LABEL_TEXT =
      "CustomizationColor.ONBOARDING_SCREEN_SUBTITLE_LABEL_TEXT";
  static const String ONBOARDING_SCREEN_MESSAGE_LABELS_TEXT =
      "CustomizationColor.ONBOARDING_SCREEN_MESSAGE_LABELS_TEXT";
  static const String CAMERA_SCREEN_STROKE_NORMAL =
      "CustomizationColor.CAMERA_SCREEN_STROKE_NORMAL";
  static const String CAMERA_SCREEN_STROKE_ACTIVE =
      "CustomizationColor.CAMERA_SCREEN_STROKE_ACTIVE";
  static const String CAMERA_SCREEN_SECTOR_TARGET =
      "CustomizationColor.CAMERA_SCREEN_SECTOR_TARGET";
  static const String CAMERA_SCREEN_SECTOR_ACTIVE =
      "CustomizationColor.CAMERA_SCREEN_SECTOR_ACTIVE";
  static const String CAMERA_SCREEN_FRONT_HINT_LABEL_BACKGROUND =
      "CustomizationColor.CAMERA_SCREEN_FRONT_HINT_LABEL_BACKGROUND";
  static const String CAMERA_SCREEN_FRONT_HINT_LABEL_TEXT =
      "CustomizationColor.CAMERA_SCREEN_FRONT_HINT_LABEL_TEXT";
  static const String CAMERA_SCREEN_BACK_HINT_LABEL_BACKGROUND =
      "CustomizationColor.CAMERA_SCREEN_BACK_HINT_LABEL_BACKGROUND";
  static const String CAMERA_SCREEN_BACK_HINT_LABEL_TEXT =
      "CustomizationColor.CAMERA_SCREEN_BACK_HINT_LABEL_TEXT";
  static const String CAMERA_SCREEN_LIGHT_TOOLBAR_TINT =
      "CustomizationColor.CAMERA_SCREEN_LIGHT_TOOLBAR_TINT";
  static const String CAMERA_SCREEN_DARK_TOOLBAR_TINT =
      "CustomizationColor.CAMERA_SCREEN_DARK_TOOLBAR_TINT";
  static const String RETRY_SCREEN_BACKGROUND =
      "CustomizationColor.RETRY_SCREEN_BACKGROUND";
  static const String RETRY_SCREEN_RETRY_BUTTON_BACKGROUND =
      "CustomizationColor.RETRY_SCREEN_RETRY_BUTTON_BACKGROUND";
  static const String RETRY_SCREEN_RETRY_BUTTON_TITLE =
      "CustomizationColor.RETRY_SCREEN_RETRY_BUTTON_TITLE";
  static const String RETRY_SCREEN_TITLE_LABEL_TEXT =
      "CustomizationColor.RETRY_SCREEN_TITLE_LABEL_TEXT";
  static const String RETRY_SCREEN_SUBTITLE_LABEL_TEXT =
      "CustomizationColor.RETRY_SCREEN_SUBTITLE_LABEL_TEXT";
  static const String RETRY_SCREEN_HINT_LABELS_TEXT =
      "CustomizationColor.RETRY_SCREEN_HINT_LABELS_TEXT";
  static const String PROCESSING_SCREEN_BACKGROUND =
      "CustomizationColor.PROCESSING_SCREEN_BACKGROUND";
  static const String PROCESSING_SCREEN_PROGRESS =
      "CustomizationColor.PROCESSING_SCREEN_PROGRESS";
  static const String PROCESSING_SCREEN_TITLE =
      "CustomizationColor.PROCESSING_SCREEN_TITLE";
  static const String SUCCESS_SCREEN_BACKGROUND =
      "CustomizationColor.SUCCESS_SCREEN_BACKGROUND";
}

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

class LicensingResultCode {
  static const String OK = "OK";
  static const String LICENSE_CORRUPTED = "LICENSE_CORRUPTED";
  static const String INVALID_DATE = "INVALID_DATE";
  static const String INVALID_VERSION = "INVALID_VERSION";
  static const String INVALID_DEVICE_ID = "INVALID_DEVICE_ID";
  static const String INVALID_SYSTEM_OR_APP_ID = "INVALID_SYSTEM_OR_APP_ID";
  static const String NO_CAPABILITIES = "NO_CAPABILITIES";
  static const String NO_AUTHENTICITY = "NO_AUTHENTICITY";
  static const String LICENSE_ABSENT = "LICENSE_ABSENT";
  static const String NO_INTERNET = "NO_INTERNET";
  static const String NO_DATABASE = "NO_DATABASE";
  static const String DATABASE_INCORRECT = "DATABASE_INCORRECT";
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
  static const int IN_PROGRESS_ALREADY = 0;
  static const int MISSING_CORE = 1;
  static const int INTERNAL_CORE_ERROR = 2;
  static const int BAD_LICENSE = 3;
  static const int UNAVAILABLE = 4;
  static const int CONTEXT_IS_NULL = 100;
  static const int RESOURCE_DAT_ABSENT = 101;
  static const int LICENSE_IS_NULL = 102;
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
  static const String NOT_INITIALIZED = "NOT_INITIALIZED";
  static const String NO_LICENSE = "NO_LICENSE";
  static const String API_CALL_FAILED = "API_CALL_FAILED";
  static const String SESSION_START_FAILED = "SESSION_START_FAILED";
  static const String CANCELLED = "CANCELLED";
  static const String PROCESSING_TIMEOUT = "PROCESSING_TIMEOUT";
  static const String PROCESSING_FAILED = "PROCESSING_FAILED";
  static const String PROCESSING_FRAME_FAILED = "PROCESSING_FRAME_FAILED";
  static const String APPLICATION_INACTIVE = "APPLICATION_INACTIVE";
  static const String CONTEXT_IS_NULL = "CONTEXT_IS_NULL";
  static const String IN_PROGRESS_ALREADY = "IN_PROGRESS_ALREADY";
  static const String ZOOM_NOT_SUPPORTED = "ZOOM_NOT_SUPPORTED";
  static const String CAMERA_NO_PERMISSION = "CAMERA_NO_PERMISSION";
  static const String CAMERA_NOT_AVAILABLE = "CAMERA_NOT_AVAILABLE";
}

class RecordingProcess {
  static const String ASYNCHRONOUS_UPLOAD = "ASYNCHRONOUS_UPLOAD";
  static const String SYNCHRONOUS_UPLOAD = "SYNCHRONOUS_UPLOAD";
  static const String NOT_UPLOAD = "NOT_UPLOAD";
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
  static const String IMAGES_COUNT_LIMIT_EXCEEDED =
      "IMAGES_COUNT_LIMIT_EXCEEDED";
  static const String API_CALL_FAILED = "API_CALL_FAILED";
  static const String PROCESSING_FAILED = "PROCESSING_FAILED";
  static const String NO_LICENSE = "NO_LICENSE";
}

class ImageQualityCharacteristicName {
  static const String IMAGE_WIDTH = "ImageWidth";
  static const String IMAGE_HEIGHT = "ImageHeight";
  static const String IMAGE_WIDTH_TO_HEIGHT = "ImageWidthToHeight";
  static const String IMAGE_CHANNELS_NUMBER = "ImageChannelsNumber";
  static const String ART_FACE = "ArtFace";
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
  static const String IMAGE_CHARACTERISTIC_ALL_RECOMMENDED =
      "ImageCharacteristic";
  static const String HEAD_SIZE_AND_POSITION_ALL_RECOMMENDED =
      "HeadSizeAndPosition";
  static const String FACE_IMAGE_QUALITY_ALL_RECOMMENDED = "FaceImageQuality";
  static const String EYES_CHARACTERISTICS_ALL_RECOMMENDED =
      "EyesCharacteristics";
  static const String SHADOW_AND_LIGHTING_ALL_RECOMMENDED =
      "ShadowsAndLightning";
  static const String POSE_AND_EXPRESSION_ALL_RECOMMENDED = "PoseAndExpression";
  static const String HEAD_OCCLUSION_ALL_RECOMMENDED = "HeadOcclusion";
  static const String QUALITY_BACKGROUND_ALL_RECOMMENDED = "QualityBackground";
}

class ScreenOrientation {
  static const int PORTRAIT = 1;
  static const int LANDSCAPE = 2;
}

class ButtonTag {
  static const int CLOSE = 1001;
  static const int TORCH = 1002;
  static const int CAMERA_SWITCH = 1003;
}

class CustomizationFont {
  static const String ONBOARDING_SCREEN_START_BUTTON =
      "CustomizationFont.ONBOARDING_SCREEN_START_BUTTON";
  static const String ONBOARDING_SCREEN_TITLE_LABEL =
      "CustomizationFont.ONBOARDING_SCREEN_TITLE_LABEL";
  static const String ONBOARDING_SCREEN_SUBTITLE_LABEL =
      "CustomizationFont.ONBOARDING_SCREEN_SUBTITLE_LABEL";
  static const String ONBOARDING_SCREEN_MESSAGE_LABELS =
      "CustomizationFont.ONBOARDING_SCREEN_MESSAGE_LABELS";
  static const String CAMERA_SCREEN_HINT_LABEL =
      "CustomizationFont.CAMERA_SCREEN_HINT_LABEL";
  static const String RETRY_SCREEN_RETRY_BUTTON =
      "CustomizationFont.RETRY_SCREEN_RETRY_BUTTON";
  static const String RETRY_SCREEN_TITLE_LABEL =
      "CustomizationFont.RETRY_SCREEN_TITLE_LABEL";
  static const String RETRY_SCREEN_SUBTITLE_LABEL =
      "CustomizationFont.RETRY_SCREEN_SUBTITLE_LABEL";
  static const String RETRY_SCREEN_HINT_LABELS =
      "CustomizationFont.RETRY_SCREEN_HINT_LABELS";
  static const String PROCESSING_SCREEN = "CustomizationFont.PROCESSING_SCREEN";
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

class LivenessProcessStatus {
  static const String START = "START";
  static const String PREPARING = "PREPARING";
  static const String NEW_SESSION = "NEW_SESSION";
  static const String NEXT_STAGE = "NEXT_STAGE";
  static const String SECTOR_CHANGED = "SECTOR_CHANGED";
  static const String PROGRESS = "PROGRESS";
  static const String LOW_BRIGHTNESS = "LOW_BRIGHTNESS";
  static const String FIT_FACE = "FIT_FACE";
  static const String MOVE_AWAY = "MOVE_AWAY";
  static const String MOVE_CLOSER = "MOVE_CLOSER";
  static const String TURN_HEAD = "TURN_HEAD";
  static const String PROCESSING = "PROCESSING";
  static const String FAILED = "FAILED";
  static const String RETRY = "RETRY";
  static const String SUCCESS = "SUCCESS";
}

class OutputImageCropAspectRatio {
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_3X4 = 0;
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_4X5 = 1;
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_2X3 = 2;
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_1X1 = 3;
  static const int OUTPUT_IMAGE_CROP_ASPECT_RATIO_7X9 = 4;
}

class LivenessType {
  static const String ACTIVE = "ACTIVE";
  static const String PASSIVE = "PASSIVE";
}

class LivenessSkipStep {
  static const int ONBOARDING_STEP = 1;
  static const int SUCCESS_STEP = 2;
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
  static const int BARCODE = 7;
}

class FaceCaptureErrorCode {
  static const String CANCEL = "CANCEL";
  static const String TIMEOUT = "TIMEOUT";
  static const String NOT_INITIALIZED = "NOT_INITIALIZED";
  static const String SESSION_START_FAILED = "SESSION_START_FAILED";
  static const String CAMERA_NOT_AVAILABLE = "CAMERA_NOT_AVAILABLE";
  static const String CAMERA_NO_PERMISSION = "CAMERA_NO_PERMISSION";
  static const String IN_PROGRESS_ALREADY = "IN_PROGRESS_ALREADY";
  static const String CONTEXT_IS_NULL = "CONTEXT_IS_NULL";
}

class LivenessBackendErrorCode {
  static const int UNDEFINED = -1;
  static const int NO_LICENSE = 200;
  static const int LOW_QUALITY = 231;
  static const int TRACK_BREAK = 246;
  static const int CLOSED_EYES_DETECTED = 230;
  static const int HIGH_ASYMMETRY = 232;
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

class ProcessingMode {
  static const String ONLINE = "ONLINE";
  static const String OFFLINE = "OFFLINE";
}

class CustomizationImage {
  static const String ONBOARDING_SCREEN_CLOSE_BUTTON =
      "CustomizationImage.ONBOARDING_SCREEN_CLOSE_BUTTON";
  static const String ONBOARDING_SCREEN_ILLUMINATION =
      "CustomizationImage.ONBOARDING_SCREEN_ILLUMINATION";
  static const String ONBOARDING_SCREEN_ACCESSORIES =
      "CustomizationImage.ONBOARDING_SCREEN_ACCESSORIES";
  static const String ONBOARDING_SCREEN_CAMERA_LEVEL =
      "CustomizationImage.ONBOARDING_SCREEN_CAMERA_LEVEL";
  static const String CAMERA_SCREEN_CLOSE_BUTTON =
      "CustomizationImage.CAMERA_SCREEN_CLOSE_BUTTON";
  static const String CAMERA_SCREEN_LIGHT_ON_BUTTON =
      "CustomizationImage.CAMERA_SCREEN_LIGHT_ON_BUTTON";
  static const String CAMERA_SCREEN_LIGHT_OFF_BUTTON =
      "CustomizationImage.CAMERA_SCREEN_LIGHT_OFF_BUTTON";
  static const String CAMERA_SCREEN_SWITCH_BUTTON =
      "CustomizationImage.CAMERA_SCREEN_SWITCH_BUTTON";
  static const String RETRY_SCREEN_CLOSE_BUTTON =
      "CustomizationImage.RETRY_SCREEN_CLOSE_BUTTON";
  static const String RETRY_SCREEN_HINT_ENVIRONMENT =
      "CustomizationImage.RETRY_SCREEN_HINT_ENVIRONMENT";
  static const String RETRY_SCREEN_HINT_SUBJECT =
      "CustomizationImage.RETRY_SCREEN_HINT_SUBJECT";
  static const String PROCESSING_SCREEN_CLOSE_BUTTON =
      "CustomizationImage.PROCESSING_SCREEN_CLOSE_BUTTON";
  static const String SUCCESS_SCREEN_IMAGE =
      "CustomizationImage.SUCCESS_SCREEN_IMAGE";
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

  @deprecated
  static Future<dynamic> init() async {
    return await _channel.invokeMethod("init", []);
  }

  static Future<dynamic> initialize() async {
    return await _channel.invokeMethod("initialize", []);
  }

  static Future<dynamic> initializeWithConfig(config) async {
    return await _channel.invokeMethod("initializeWithConfig", [config]);
  }

  @deprecated
  static Future<dynamic> deinit() async {
    return await _channel.invokeMethod("deinit", []);
  }

  static Future<dynamic> deinitialize() async {
    return await _channel.invokeMethod("deinitialize", []);
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

  static Future<dynamic> matchFacesWithConfig(request, config) async {
    return await _channel
        .invokeMethod("matchFacesWithConfig", [request, config]);
  }

  static Future<dynamic> startLivenessWithConfig(config) async {
    return await _channel.invokeMethod("startLivenessWithConfig", [config]);
  }

  static Future<dynamic> setServiceUrl(url) async {
    return await _channel.invokeMethod("setServiceUrl", [url]);
  }

  static Future<dynamic> setLogs(isEnable) async {
    return await _channel.invokeMethod("setLogs", [isEnable]);
  }

  static Future<dynamic> setSaveLogs(isSaveLog) async {
    return await _channel.invokeMethod("setSaveLogs", [isSaveLog]);
  }

  static Future<dynamic> setLogsFolder(path) async {
    return await _channel.invokeMethod("setLogsFolder", [path]);
  }

  static Future<dynamic> matchFaces(request) async {
    return await _channel.invokeMethod("matchFaces", [request]);
  }

  static Future<dynamic> detectFaces(request) async {
    return await _channel.invokeMethod("detectFaces", [request]);
  }

  static Future<dynamic> setUiCustomizationLayer(json) async {
    return await _channel.invokeMethod("setUiCustomizationLayer", [json]);
  }

  static Future<dynamic> setUiConfiguration(config) async {
    return await _channel.invokeMethod("setUiConfiguration", [config]);
  }

  static Future<dynamic> setLocalizationDictionary(dictionary) async {
    return await _channel
        .invokeMethod("setLocalizationDictionary", [dictionary]);
  }

  static Future<dynamic> matchFacesSimilarityThresholdSplit(
      faces, similarity) async {
    return await _channel.invokeMethod(
        "matchFacesSimilarityThresholdSplit", [faces, similarity]);
  }

  static Future<dynamic> getPerson(personId) async {
    return await _channel.invokeMethod("getPerson", [personId]);
  }

  static Future<dynamic> createPerson(name, groupIds, metadata) async {
    return await _channel
        .invokeMethod("createPerson", [name, groupIds, metadata]);
  }

  static Future<dynamic> updatePerson(person) async {
    return await _channel.invokeMethod("updatePerson", [person]);
  }

  static Future<dynamic> deletePerson(personId) async {
    return await _channel.invokeMethod("deletePerson", [personId]);
  }

  static Future<dynamic> getPersonImages(personId) async {
    return await _channel.invokeMethod("getPersonImages", [personId]);
  }

  static Future<dynamic> getPersonImagesForPage(personId, page, size) async {
    return await _channel
        .invokeMethod("getPersonImagesForPage", [personId, page, size]);
  }

  static Future<dynamic> addPersonImage(personId, image) async {
    return await _channel.invokeMethod("addPersonImage", [personId, image]);
  }

  static Future<dynamic> getPersonImage(personId, imageId) async {
    return await _channel.invokeMethod("getPersonImage", [personId, imageId]);
  }

  static Future<dynamic> deletePersonImage(personId, imageId) async {
    return await _channel
        .invokeMethod("deletePersonImage", [personId, imageId]);
  }

  static Future<dynamic> getGroups() async {
    return await _channel.invokeMethod("getGroups", []);
  }

  static Future<dynamic> getGroupsForPage(page, size) async {
    return await _channel.invokeMethod("getGroupsForPage", [page, size]);
  }

  static Future<dynamic> getPersonGroups(personId) async {
    return await _channel.invokeMethod("getPersonGroups", [personId]);
  }

  static Future<dynamic> getPersonGroupsForPage(personId, page, size) async {
    return await _channel
        .invokeMethod("getPersonGroupsForPage", [personId, page, size]);
  }

  static Future<dynamic> createGroup(name, metadata) async {
    return await _channel.invokeMethod("createGroup", [name, metadata]);
  }

  static Future<dynamic> getGroup(groupId) async {
    return await _channel.invokeMethod("getGroup", [groupId]);
  }

  static Future<dynamic> updateGroup(group) async {
    return await _channel.invokeMethod("updateGroup", [group]);
  }

  static Future<dynamic> editPersonsInGroup(
      groupId, editGroupPersonsRequest) async {
    return await _channel
        .invokeMethod("editPersonsInGroup", [groupId, editGroupPersonsRequest]);
  }

  static Future<dynamic> getPersonsInGroup(groupId) async {
    return await _channel.invokeMethod("getPersonsInGroup", [groupId]);
  }

  static Future<dynamic> getPersonsInGroupForPage(groupId, page, size) async {
    return await _channel
        .invokeMethod("getPersonsInGroupForPage", [groupId, page, size]);
  }

  static Future<dynamic> deleteGroup(groupId) async {
    return await _channel.invokeMethod("deleteGroup", [groupId]);
  }

  static Future<dynamic> searchPerson(searchPersonRequest) async {
    return await _channel.invokeMethod("searchPerson", [searchPersonRequest]);
  }
}
