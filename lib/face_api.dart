import 'dart:async';
import 'package:flutter/services.dart';

// Classes

class FaceCaptureError {
  int errorCode;
  String message;

  static FaceCaptureError fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceCaptureError();

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

class FaceProcessorError {
  int errorCode;
  String message;

  static FaceProcessorError fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceProcessorError();

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

class LivenessError {
  int errorCode;
  String message;

  static LivenessError fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessError();

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

class MatchFacesError {
  int errorCode;
  String message;

  static MatchFacesError fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesError();

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

class LivenessParams {
  int attemptsCount;

  static LivenessParams fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessParams();

    result.attemptsCount = jsonObject["attemptsCount"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (attemptsCount != null) result.addAll({"attemptsCount": attemptsCount});

    return result;
  }
}

class AgeRange {
  int high;
  int low;

  static AgeRange fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new AgeRange();

    result.high = jsonObject["high"];
    result.low = jsonObject["low"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (high != null) result.addAll({"high": high});
    if (low != null) result.addAll({"low": low});

    return result;
  }
}

class ComparedFace {
  String tag;
  int imageType;
  int position;

  static ComparedFace fromJson(jsonObject) {
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
  ComparedFace first;
  ComparedFace second;
  double similarity;
  MatchFacesError error;

  static ComparedFacesPair fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new ComparedFacesPair();

    result.first = ComparedFace.fromJson(jsonObject["first"]);
    result.second = ComparedFace.fromJson(jsonObject["second"]);
    result.similarity = jsonObject["similarity"] == null ? null : jsonObject["similarity"].toDouble();
    result.error = MatchFacesError.fromJson(jsonObject["error"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (first != null) result.addAll({"first": first});
    if (second != null) result.addAll({"second": second});
    if (similarity != null) result.addAll({"similarity": similarity});
    if (error != null) result.addAll({"error": error});

    return result;
  }
}

class Ethnicity {
  int confidence;
  int value;

  static Ethnicity fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Ethnicity();

    result.confidence = jsonObject["confidence"];
    result.value = jsonObject["value"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (confidence != null) result.addAll({"confidence": confidence});
    if (value != null) result.addAll({"value": value});

    return result;
  }
}

class FaceCaptureResponse {
  FaceCaptureError error;
  Image image;

  static FaceCaptureResponse fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new FaceCaptureResponse();

    result.error = FaceCaptureError.fromJson(jsonObject["error"]);
    result.image = Image.fromJson(jsonObject["image"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (error != null) result.addAll({"error": error});
    if (image != null) result.addAll({"image": image});

    return result;
  }
}

class Gender {
  double confidence;
  int value;

  static Gender fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Gender();

    result.confidence = jsonObject["confidence"] == null ? null : jsonObject["confidence"].toDouble();
    result.value = jsonObject["value"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (confidence != null) result.addAll({"confidence": confidence});
    if (value != null) result.addAll({"value": value});

    return result;
  }
}

class Landmark {
  int type;
  int x;
  int y;

  static Landmark fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new Landmark();

    result.type = jsonObject["type"];
    result.x = jsonObject["x"];
    result.y = jsonObject["y"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (type != null) result.addAll({"type": type});
    if (x != null) result.addAll({"x": x});
    if (y != null) result.addAll({"y": y});

    return result;
  }
}

class LivenessResponse {
  String bitmap;
  int liveness;
  LivenessError error;

  static LivenessResponse fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessResponse();

    result.bitmap = jsonObject["bitmap"];
    result.liveness = jsonObject["liveness"];
    result.error = LivenessError.fromJson(jsonObject["error"]);

    return result;
  }

  Map toJson(){
    Map result = {};

    if (bitmap != null) result.addAll({"bitmap": bitmap});
    if (liveness != null) result.addAll({"liveness": liveness});
    if (error != null) result.addAll({"error": error});

    return result;
  }
}

class MatchFacesResponse {
  FaceProcessorError error;
  List<ComparedFacesPair> matchedFaces = [];
  List<ComparedFacesPair> unmatchedFaces = [];

  static MatchFacesResponse fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new MatchFacesResponse();

    result.error = FaceProcessorError.fromJson(jsonObject["error"]);
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

    if (error != null) result.addAll({"error": error});
    if (matchedFaces != null) result.addAll({"matchedFaces": matchedFaces});
    if (unmatchedFaces != null) result.addAll({"unmatchedFaces": unmatchedFaces});

    return result;
  }
}

class Image {
  int imageType;
  String tag;
  String bitmap;

  static Image fromJson(jsonObject) {
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

class LivenessRequest {
  List<dynamic> normalImageData;
  List<dynamic> scaledImageData;
  List<dynamic> requestBody;
  String guid;

  static LivenessRequest fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new LivenessRequest();

    result.normalImageData = jsonObject["normalImageData"];
    result.scaledImageData = jsonObject["scaledImageData"];
    result.requestBody = jsonObject["requestBody"];
    result.guid = jsonObject["guid"];

    return result;
  }

  Map toJson(){
    Map result = {};

    if (normalImageData != null) result.addAll({"normalImageData": normalImageData});
    if (scaledImageData != null) result.addAll({"scaledImageData": scaledImageData});
    if (requestBody != null) result.addAll({"requestBody": requestBody});
    if (guid != null) result.addAll({"guid": guid});

    return result;
  }
}

class MatchFacesRequest {
  double similarityThreshold;
  List<Image> images = [];
  dynamic customMetadata;

  static MatchFacesRequest fromJson(jsonObject) {
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

class eFaceRProcessorErrorCodes {
  static const int FR_IMAGE_EMPTY = 1;
  static const int FR_FACE_NOT_DETECTED = 2;
  static const int FR_LANDMARKS_NOT_DETECTED = 3;
  static const int FR_FACE_ALIGHNER_FAILED = 4;
  static const int FR_DESCRIPTOR_EXTRACTOR_ERROR = 5;
  static const int SERVER_RESPONSE_IS_EMPTY = 1001;
  static const int RGLFaceProcessorResultCodeNoLicense = 200;
  static const int RGLFaceProcessorResultCodeIsNotInitialized = 201;
  static const int RGLFaceProcessorResultCodeCommandIsNotSupported = 202;
  static const int RGLFaceProcessorResultCodeCommandParamsReadError = 203;
}

class eInputFaceType {
  static const int ift_DocumentPrinted = 1;
  static const int ift_DocumentRFID = 2;
  static const int ift_Live = 3;
  static const int ift_LiveWithDoc = 4;
}

class FaceCaptureResultCodes {
  static const int CANCEL = 1;
  static const int CAMERA_NOT_AVAILABLE = 2;
  static const int CAMERA_NO_PERMISSION = 3;
  static const int IN_PROGRESS_ALREADY = 4;
}

class LivenessErrorCode {
  static const int INTERNAL_ERROR = 1000;
  static const int SERVER_ERROR = 1001;
  static const int ZOOM_NOT_SUPPORTED = 1002;
  static const int CANCELLED = 600;
  static const int PROCESSING_TIMEOUT = 601;
  static const int SERVER_RESPONSE_IS_EMPTY = 602;
  static const int PROCESSING_FAILED = 603;
  static const int PROCESSING_ATTEMPT_ENDED = 604;
}

class LivenessStatus {
  static const int PASSED = 0;
  static const int UNKNOWN = 1;
}

class Face {
  static const MethodChannel _channel = const MethodChannel('flutter_face_api/method');

  static Future<dynamic> getServiceUrl() async {
    return await _channel.invokeMethod("getServiceUrl", []);
  }

  static Future<dynamic> startLivenessMatching() async {
    return await _channel.invokeMethod("startLivenessMatching", []);
  }

  static Future<dynamic> getFaceSdkVersion() async {
    return await _channel.invokeMethod("getFaceSdkVersion", []);
  }

  static Future<dynamic> livenessParams() async {
    return await _channel.invokeMethod("livenessParams", []);
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

  static Future<dynamic> startLivenessMatchingByCameraId(cameraId) async {
    return await _channel.invokeMethod("startLivenessMatchingByCameraId", [cameraId]);
  }

  static Future<dynamic> setServiceUrl(url) async {
    return await _channel.invokeMethod("setServiceUrl", [url]);
  }

  static Future<dynamic> matchFaces(request) async {
    return await _channel.invokeMethod("matchFaces", [request]);
  }
}