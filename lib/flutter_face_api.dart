/// Regula Face SDK
library face_api;

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

part 'src/internal/utils.dart';
part 'src/internal/bridge.dart';
part 'src/internal/event_channels.dart';

part 'src/customization/customization_colors.dart';
part 'src/customization/font.dart';
part 'src/customization/customization_fonts.dart';
part 'src/customization/customization_images.dart';
part 'src/customization/customization.dart';
part 'src/customization/camera_position.dart';
part 'src/customization/screen_orientation.dart';

part 'src/init/face_sdk_version.dart';
part 'src/init/init_config.dart';
part 'src/init/license_exception.dart';
part 'src/init/init_exception.dart';

part 'src/face_capture/face_capture_config.dart';
part 'src/face_capture/face_capture_image.dart';
part 'src/face_capture/face_capture_exception.dart';
part 'src/face_capture/face_capture_response.dart';

part 'src/liveness/liveness_config.dart';
part 'src/liveness/liveness_backend_exception.dart';
part 'src/liveness/liveness_exception.dart';
part 'src/liveness/liveness_response.dart';
part 'src/liveness/liveness_notification.dart';

part 'src/image_params/point.dart';
part 'src/image_params/rect.dart';
part 'src/image_params/size.dart';
part 'src/image_params/output_image_crop.dart';
part 'src/image_params/output_image_params.dart';

part 'src/match_faces/match_faces_config.dart';
part 'src/match_faces/match_faces_image.dart';
part 'src/match_faces/match_faces_request.dart';
part 'src/match_faces/match_faces_detection_face.dart';
part 'src/match_faces/match_faces_detection.dart';
part 'src/match_faces/compared_face.dart';
part 'src/match_faces/compared_faces_pair.dart';
part 'src/match_faces/match_faces_exception.dart';
part 'src/match_faces/match_faces_backend_exception.dart';
part 'src/match_faces/match_faces_response.dart';
part 'src/match_faces/compared_faces_split.dart';

part 'src/image_quality/image_quality_range.dart';
part 'src/image_quality/image_quality_characteristic_name.dart';
part 'src/image_quality/image_quality_characteristic.dart';
part 'src/image_quality/image_quality_group.dart';
part 'src/image_quality/image_quality_result.dart';

part 'src/detect_faces/detect_faces_attribute.dart';
part 'src/detect_faces/detect_faces_config.dart';
part 'src/detect_faces/detect_faces_scenario.dart';
part 'src/detect_faces/detect_faces_request.dart';
part 'src/detect_faces/detect_faces_attribute_result.dart';
part 'src/detect_faces/detect_face_result.dart';
part 'src/detect_faces/detect_faces_backend_exception.dart';
part 'src/detect_faces/detect_faces_exception.dart';
part 'src/detect_faces/detect_faces_response.dart';

part 'src/person_database/person_database.dart';
part 'src/person_database/pageable_item_list.dart';
part 'src/person_database/person.dart';
part 'src/person_database/person_image.dart';
part 'src/person_database/image_upload.dart';
part 'src/person_database/person_group.dart';
part 'src/person_database/edit_group_persons_request.dart';
part 'src/person_database/search_person_request.dart';
part 'src/person_database/search_person_detection.dart';
part 'src/person_database/search_person_image.dart';
part 'src/person_database/search_person.dart';

/// Entry point of the Regula Face SDK.
class FaceSDK {
  FaceSDK._privateConstructor();

  /// The only instance of singleton class [FaceSDK].
  static FaceSDK get instance => _instance;
  static final FaceSDK _instance = FaceSDK._privateConstructor();

  /// Information about the SDK.
  FaceSDKVersion? get version => _version;
  FaceSDKVersion? _version;

  String? get serviceUrl => _serviceUrl;
  String? _serviceUrl;
  set serviceUrl(String? val) {
    _serviceUrl = val;
    _setServiceUrl(val);
  }

  /// Customer name.
  String? get tenant => _tenant;
  String? _tenant;
  set tenant(String? val) {
    _tenant = val;
    _setTenant(val);
  }

  /// Environment type.
  String? get env => _env;
  String? _env;
  set env(String? val) {
    _env = val;
    _setEnv(val);
  }

  /// Custom language locale code of DocumentReaderSDK.
  /// If empty or doesn't exist - app language is used. Format "en-US" or "en".
  String? get locale => _locale;
  String? _locale;
  set locale(String? val) {
    _locale = val;
    _setLocale(val);
  }

  /// A localization dictionary to override default localization logic.
  /// Allows to replace any string of FaceSDK with an arbitrary string.
  ///
  /// To see all the localization keys, look up the `RegulaSDK.strings` file at
  /// `ios/Pods/FaceSDK/FaceSDK.xcframework/ios-arm64/FaceSDK.framework/FaceSDK.bundle/en.lproj/FaceSDK.strings`.
  ///
  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  Map<String, String>? get localizationDictionary => _localizationDictionary;
  Map<String, String>? _localizationDictionary;
  set localizationDictionary(Map<String, String>? val) {
    if (val != null) val = Map.unmodifiable(val);
    _localizationDictionary = val;
    _setLocalizationDictionary(val);
  }

  /// Unmodifiable property. Use setter instead of `.remove()`, `.addAll()`, etc.
  Map<String, String>? get requestHeaders => _requestHeaders;
  Map<String, String>? _requestHeaders;
  set requestHeaders(Map<String, String>? val) {
    if (val != null) val = Map.unmodifiable(val);
    _requestHeaders = val;
    _setRequestHeaders(val);
  }

  Customization get customization => _customization;
  Customization _customization = Customization();
  set customization(Customization val) {
    _customization = val;
    _customization._apply();
  }

  /// Allows user to receive a video file of current session
  set videoEncoderCompletion(VideoEncoderCompletion completion) =>
      _setVideoEncoderCompletion(completion);

  PersonDatabase get personDatabase => _personDatabase;
  PersonDatabase _personDatabase = PersonDatabase._privateConstructor();

  /// Checks if FaceSDK is initialized.
  Future<bool> isInitialized() async {
    return await _bridge.invokeMethod("isInitialized", []);
  }

  /// Allows you to initialize FaceSDK.
  ///
  /// [config] - configuration file for FaceSDK initialization.
  ///
  /// Returns [bool] indicating success of initialization
  /// and a nullable [InitException].
  Future<(bool success, InitException? error)> initialize({
    InitConfig? config,
  }) async {
    var response = await _bridge.invokeMethod("initialize", [config?.toJson()]);

    var jsonObject = _decode(response);
    bool success = jsonObject["success"];
    var error = jsonObject["error"];

    if (success) await _onInit();

    return (success, InitException.fromJson(error));
  }

  /// Used to deinitialize FaceSDK and free up RAM as a
  /// consequence of this.
  void deinitialize() {
    _bridge.invokeMethod("deinitialize", []);
  }

  Future<FaceCaptureResponse> startFaceCapture({
    FaceCaptureConfig? config,
    CameraSwitchCallback? cameraSwitchCallback,
  }) async {
    _setCameraSwitchCallback(cameraSwitchCallback);
    var response = await _bridge.invokeMethod(
      "startFaceCapture",
      [config?.toJson()],
    );
    return FaceCaptureResponse.fromJson(_decode(response))!;
  }

  void stopFaceCapture() {
    _bridge.invokeMethod("stopFaceCapture", []);
  }

  Future<LivenessResponse> startLiveness({
    LivenessConfig? config,
    LivenessNotificationCompletion? notificationCompletion,
    CameraSwitchCallback? cameraSwitchCallback,
  }) async {
    _setLivenessNotificationCompletion(notificationCompletion);
    _setCameraSwitchCallback(cameraSwitchCallback);
    var response = await _bridge.invokeMethod(
      "startLiveness",
      [config?.toJson()],
    );
    return LivenessResponse.fromJson(_decode(response))!;
  }

  void stopLiveness() {
    _bridge.invokeMethod("stopLiveness", []);
  }

  Future<MatchFacesResponse> matchFaces(
    MatchFacesRequest request, {
    MatchFacesConfig? config,
  }) async {
    var response = await _bridge.invokeMethod("matchFaces", [
      request.toJson(),
      config?.toJson(),
    ]);
    return MatchFacesResponse.fromJson(_decode(response))!;
  }

  Future<ComparedFacesSplit> splitComparedFaces(
    List<ComparedFacesPair> facesPairs,
    double similarityThreshold,
  ) async {
    var response = await _bridge.invokeMethod("splitComparedFaces", [
      facesPairs.map((e) => e.toJson()).toList(),
      similarityThreshold,
    ]);
    return ComparedFacesSplit.fromJson(_decode(response))!;
  }

  Future<DetectFacesResponse> detectFaces(DetectFacesRequest request) async {
    var response = await _bridge.invokeMethod(
      "detectFaces",
      [request.toJson()],
    );
    return DetectFacesResponse.fromJson(_decode(response))!;
  }

  Future<void> _onInit() async {
    _version = await _getVersion();
    _serviceUrl = await _getServiceUrl();
    _tenant = await _getTenant();
    _env = await _getEnv();
    _locale = await _getLocale();
  }

  Future<FaceSDKVersion?> _getVersion() async {
    var response = await _bridge.invokeMethod("getVersion", []);
    return FaceSDKVersion.fromJson(_decode(response));
  }

  Future<String?> _getServiceUrl() async {
    return await _bridge.invokeMethod("getServiceUrl", []);
  }

  void _setServiceUrl(String? url) {
    _bridge.invokeMethod("setServiceUrl", [url]);
  }

  Future<String?> _getTenant() async {
    return await _bridge.invokeMethod("getTenant", []);
  }

  void _setTenant(String? tag) {
    _bridge.invokeMethod("setTenant", [tag]);
  }

  Future<String?> _getEnv() async {
    return await _bridge.invokeMethod("getEnv", []);
  }

  void _setEnv(String? tag) {
    _bridge.invokeMethod("setEnv", [tag]);
  }

  Future<String?> _getLocale() async {
    return await _bridge.invokeMethod("getLocale", []);
  }

  void _setLocale(String? locale) {
    _bridge.invokeMethod("setLocale", [locale]);
  }

  void _setLocalizationDictionary(Map<String, String>? dictionary) {
    _bridge.invokeMethod("setLocalizationDictionary", [dictionary]);
  }

  void _setRequestHeaders(Map<String, String>? dictionary) {
    _bridge.invokeMethod("setRequestHeaders", [dictionary]);
  }
}

typedef VideoEncoderCompletion = void Function(
  String transactionId,
  bool success,
);

typedef CameraSwitchCallback = void Function(int cameraId);
