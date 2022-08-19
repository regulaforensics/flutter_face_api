import 'dart:async';
import 'package:flutter/services.dart';

// Classes

class FaceCaptureException {
  int? errorCode;
  String? message;

  static FaceCaptureException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceCaptureException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class LivenessErrorException {
  int? errorCode;
  String? message;

  static LivenessErrorException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessErrorException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (errorCode != null) _result.addAll({"errorCode": errorCode});
    if (message != null) _result.addAll({"message": message});

    return _result;
  }
}

class MatchFacesException {
  int? errorCode;
  String? message;

  static MatchFacesException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson(){
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

  Map toJson(){
    Map _result = {};

    if (exception != null) _result.addAll({"exception": exception});
    if (image != null) _result.addAll({"image": image});

    return _result;
  }
}

class LivenessResponse {
  String? bitmap;
  int? liveness;
  String? guid;
  LivenessErrorException? exception;

  static LivenessResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessResponse();

    result.bitmap = jsonObject["bitmap"];
    result.liveness = jsonObject["liveness"];
    result.guid = jsonObject["guid"];
    result.exception = LivenessErrorException.fromJson(jsonObject["exception"]);

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (bitmap != null) _result.addAll({"bitmap": bitmap});
    if (liveness != null) _result.addAll({"liveness": liveness});
    if (guid != null) _result.addAll({"guid": guid});
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

  Map toJson(){
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

  static Image? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Image();

    result.imageType = jsonObject["imageType"];
    result.bitmap = jsonObject["bitmap"];

    return result;
  }

  Map toJson(){
    Map _result = {};

    if (imageType != null) _result.addAll({"imageType": imageType});
    if (bitmap != null) _result.addAll({"bitmap": bitmap});

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

  Map toJson(){
    Map _result = {};

    _result.addAll({"images": images});
    if (customMetadata != null) _result.addAll({"customMetadata": customMetadata});
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

  Map toJson(){
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
    result.similarity = jsonObject["similarity"] == null ? null : jsonObject["similarity"].toDouble();
    result.score = jsonObject["score"] == null ? null : jsonObject["score"].toDouble();
    result.exception = MatchFacesException.fromJson(jsonObject["exception"]);

    return result;
  }

  Map toJson(){
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

  Map toJson(){
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
    result.rotationAngle = jsonObject["rotationAngle"] == null ? null : jsonObject["rotationAngle"].toDouble();
    result.thumbnail = jsonObject["thumbnail"];

    return result;
  }

  Map toJson(){
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

  Map toJson(){
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

  Map toJson(){
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

  Map toJson(){
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

  Map toJson(){
    Map _result = {};

    _result.addAll({"matchedFaces": matchedFaces});
    _result.addAll({"unmatchedFaces": unmatchedFaces});

    return _result;
  }
}

// Enum

class CameraPosition {
  static const int Back = 0;
  static const int Front = 1;
}

class LivenessStatus {
  static const int PASSED = 0;
  static const int UNKNOWN = 1;
}

class LivenessErrorCode {
  static const int CONTEXT_IS_NULL = 1;
  static const int IN_PROGRESS_ALREADY = 2;
  static const int ZOOM_NOT_SUPPORTED = 3;
  static const int NO_LICENSE = 4;
  static const int CANCELLED = 5;
  static const int PROCESSING_TIMEOUT = 6;
  static const int API_CALL_FAILED = 7;
  static const int PROCESSING_FAILED = 8;
}

class ImageType {
  static const int PRINTED = 1;
  static const int RFID = 2;
  static const int LIVE = 3;
  static const int DOCUMENT_WITH_LIVE = 4;
  static const int EXTERNAL = 5;
}

class FaceCaptureErrorCode {
  static const int CANCEL = 1;
  static const int CAMERA_NOT_AVAILABLE = 2;
  static const int CAMERA_NO_PERMISSION = 3;
  static const int IN_PROGRESS_ALREADY = 4;
  static const int CONTEXT_IS_NULL = 5;
}

class MatchFacesErrorCodes {
  static const int IMAGE_EMPTY = 1;
  static const int FACE_NOT_DETECTED = 2;
  static const int LANDMARKS_NOT_DETECTED = 3;
  static const int FACE_ALIGNER_FAILED = 4;
  static const int DESCRIPTOR_EXTRACTOR_ERROR = 5;
  static const int NO_LICENSE = 6;
  static const int IMAGES_COUNT_LIMIT_EXCEEDED = 7;
  static const int API_CALL_FAILED = 8;
  static const int PROCESSING_FAILED = 9;
}

class FaceSDK {
  static const MethodChannel _channel = const MethodChannel('flutter_face_api/method');

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

  static Future<dynamic> stopLivenessProcessing() async {
    return await _channel.invokeMethod("stopLivenessProcessing", []);
  }

  static Future<dynamic> presentFaceCaptureActivityWithConfig(config) async {
    return await _channel.invokeMethod("presentFaceCaptureActivityWithConfig", [config]);
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

  static Future<dynamic> matchFacesWithConfig(request, config) async {
    return await _channel.invokeMethod("matchFacesWithConfig", [request, config]);
  }

  static Future<dynamic> setLanguage(language) async {
    return await _channel.invokeMethod("setLanguage", [language]);
  }

  static Future<dynamic> matchFacesSimilarityThresholdSplit(faces, similarity) async {
    return await _channel.invokeMethod("matchFacesSimilarityThresholdSplit", [faces, similarity]);
  }
}