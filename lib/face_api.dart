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
    Map result = {};

    if (errorCode != null) result.addAll({"errorCode": errorCode});
    if (message != null) result.addAll({"message": message});

    return result;
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
    Map result = {};

    if (errorCode != null) result.addAll({"errorCode": errorCode});
    if (message != null) result.addAll({"message": message});

    return result;
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
    Map result = {};

    if (errorCode != null) result.addAll({"errorCode": errorCode});
    if (message != null) result.addAll({"message": message});

    return result;
  }
}

class ComparedFacesPairException {
  int? errorCode;
  String? message;

  static ComparedFacesPairException? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ComparedFacesPairException();

    result.errorCode = jsonObject["errorCode"];
    result.message = jsonObject["message"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (errorCode != null) result.addAll({"errorCode": errorCode});
    if (message != null) result.addAll({"message": message});

    return result;
  }
}

class ComparedFace {
  String? tag;
  int? imageType;
  int? position;

  static ComparedFace? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ComparedFace();

    result.tag = jsonObject["tag"];
    result.imageType = jsonObject["imageType"];
    result.position = jsonObject["position"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (tag != null) result.addAll({"tag": tag});
    if (imageType != null) result.addAll({"imageType": imageType});
    if (position != null) result.addAll({"position": position});

    return result;
  }
}

class ComparedFacesPair {
  ComparedFace? first;
  ComparedFace? second;
  double? similarity;
  ComparedFacesPairException? exception;

  static ComparedFacesPair? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ComparedFacesPair();

    result.first = ComparedFace.fromJson(jsonObject["first"]);
    result.second = ComparedFace.fromJson(jsonObject["second"]);
    result.similarity = jsonObject["similarity"] == null ? null : jsonObject["similarity"].toDouble();
    result.exception = ComparedFacesPairException.fromJson(jsonObject["exception"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (first != null) result.addAll({"first": first});
    if (second != null) result.addAll({"second": second});
    if (similarity != null) result.addAll({"similarity": similarity});
    if (exception != null) result.addAll({"exception": exception});

    return result;
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
    Map result = {};

    if (exception != null) result.addAll({"exception": exception});
    if (image != null) result.addAll({"image": image});

    return result;
  }
}

class LivenessResponse {
  String? bitmap;
  int? liveness;
  LivenessErrorException? exception;

  static LivenessResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessResponse();

    result.bitmap = jsonObject["bitmap"];
    result.liveness = jsonObject["liveness"];
    result.exception = LivenessErrorException.fromJson(jsonObject["exception"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (bitmap != null) result.addAll({"bitmap": bitmap});
    if (liveness != null) result.addAll({"liveness": liveness});
    if (exception != null) result.addAll({"exception": exception});

    return result;
  }
}

class MatchFacesResponse {
  MatchFacesException? exception;
  List<ComparedFacesPair?> matchedFaces = [];
  List<ComparedFacesPair?> unmatchedFaces = [];

  static MatchFacesResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesResponse();

    result.exception = MatchFacesException.fromJson(jsonObject["exception"]);
    if (jsonObject["matchedFaces"] != null)
      for (var item in jsonObject["matchedFaces"])
        result.matchedFaces.add(ComparedFacesPair.fromJson(item));
    if (jsonObject["unmatchedFaces"] != null)
      for (var item in jsonObject["unmatchedFaces"])
        result.unmatchedFaces.add(ComparedFacesPair.fromJson(item));

    return result;
  }

  Map toJson(){
    Map result = {};

    if (exception != null) result.addAll({"exception": exception});
    if (matchedFaces != null) result.addAll({"matchedFaces": matchedFaces});
    if (unmatchedFaces != null) result.addAll({"unmatchedFaces": unmatchedFaces});

    return result;
  }
}

class Image {
  int? imageType;
  String? tag;
  String? bitmap;

  static Image? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Image();

    result.imageType = jsonObject["imageType"];
    result.tag = jsonObject["tag"];
    result.bitmap = jsonObject["bitmap"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (imageType != null) result.addAll({"imageType": imageType});
    if (tag != null) result.addAll({"tag": tag});
    if (bitmap != null) result.addAll({"bitmap": bitmap});

    return result;
  }
}

class MatchFacesRequest {
  double? similarityThreshold;
  List<Image?> images = [];
  dynamic? customMetadata;

  static MatchFacesRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesRequest();

    result.similarityThreshold = jsonObject["similarityThreshold"] == null ? null : jsonObject["similarityThreshold"].toDouble();
    if (jsonObject["images"] != null)
      for (var item in jsonObject["images"])
        result.images.add(Image.fromJson(item));
    result.customMetadata = jsonObject["customMetadata"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (similarityThreshold != null) result.addAll({"similarityThreshold": similarityThreshold});
    if (images != null) result.addAll({"images": images});
    if (customMetadata != null) result.addAll({"customMetadata": customMetadata});

    return result;
  }
}

// Enum

class ComparedFacesPairErrorCodes {
  static const int IMAGE_EMPTY = 1;
  static const int FACE_NOT_DETECTED = 2;
  static const int LANDMARKS_NOT_DETECTED = 3;
  static const int FACE_ALIGNER_FAILED = 4;
  static const int DESCRIPTOR_EXTRACTOR_ERROR = 5;
  static const int API_CALL_FAILED = 6;
}

class FaceCaptureResultCodes {
  static const int CANCEL = 1;
  static const int CAMERA_NOT_AVAILABLE = 2;
  static const int CAMERA_NO_PERMISSION = 3;
  static const int IN_PROGRESS_ALREADY = 4;
  static const int CONTEXT_IS_NULL = 5;
}

class ImageType {
  static const int IMAGE_TYPE_PRINTED = 1;
  static const int IMAGE_TYPE_RFID = 2;
  static const int IMAGE_TYPE_LIVE = 3;
  static const int IMAGE_TYPE_LIVE_WITH_DOC = 4;
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
  static const int PROCESSING_ATTEMPTS_ENDED = 9;
}

class LivenessStatus {
  static const int PASSED = 0;
  static const int UNKNOWN = 1;
}

class MatchFacesErrorCodes {
  static const int IMAGE_EMPTY = 1;
  static const int FACE_NOT_DETECTED = 2;
  static const int LANDMARKS_NOT_DETECTED = 3;
  static const int FACE_ALIGNER_FAILED = 4;
  static const int DESCRIPTOR_EXTRACTOR_ERROR = 5;
  static const int NO_LICENSE = 6;
  static const int NOT_INITIALIZED = 7;
  static const int COMMAND_IS_NOT_SUPPORTED = 8;
  static const int COMMAND_PARAMS_READ_ERROR = 9;
  static const int API_CALL_FAILED = 10;
  static const int PROCESSING_FAILED = 11;
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

  static Future<dynamic> presentFaceCaptureActivityByCameraId(cameraId) async {
    return await _channel.invokeMethod("presentFaceCaptureActivityByCameraId", [cameraId]);
  }

  static Future<dynamic> startLivenessByCameraId(cameraId) async {
    return await _channel.invokeMethod("startLivenessByCameraId", [cameraId]);
  }

  static Future<dynamic> setServiceUrl(url) async {
    return await _channel.invokeMethod("setServiceUrl", [url]);
  }

  static Future<dynamic> matchFaces(request) async {
    return await _channel.invokeMethod("matchFaces", [request]);
  }
}