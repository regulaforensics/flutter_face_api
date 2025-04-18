part of "../../flutter_face_api.dart";

/// Detect Faces Request.
/// Could be created by predefined scenarios (e.g: [DetectFacesRequest.qualityICAO], [DetectFacesRequest.cropAllFaces] etc. )
/// or by using custom [DetectFacesConfig].
class DetectFacesRequest {
  String? _tag;
  DetectFacesScenario? _scenario;
  late Uint8List _image;
  DetectFacesConfig? _configuration;

  DetectFacesRequest._privateConstructor();

  /// Create [DetectFacesRequest] object.
  ///
  /// `image` - Image base64.
  ///
  /// `config` - Custom Request configuration to specify  image, quality, attributes parameters.
  ///
  /// `tag` - Defines tag that can be used in detect faces processing. Defaults to `null`.
  DetectFacesRequest(Uint8List image, DetectFacesConfig config, {String? tag})
    : _image = image,
      _configuration = config,
      _tag = tag;

  /// Creates a request to check all the available quality characteristics.
  ///
  /// [image] - Image base64.
  DetectFacesRequest.qualityFull(Uint8List image)
    : _image = image,
      _scenario = DetectFacesScenario.QUALITY_FULL;

  /// Creates a request to check the quality characteristics based on the ICAO standard.
  ///
  /// [image] - Image base64.
  DetectFacesRequest.qualityICAO(Uint8List image)
    : _image = image,
      _scenario = DetectFacesScenario.QUALITY_ICAO;

  /// Creates a request to check the quality characteristics based on the Schengen visa standard.
  ///
  /// [image] - Image base64.
  DetectFacesRequest.qualityVisaSchengen(Uint8List image)
    : _image = image,
      _scenario = DetectFacesScenario.QUALITY_VISA_SCHENGEN;

  /// Creates a request to check the quality characteristics based on the USA visa standard.
  ///
  /// [image] - Image base64.
  DetectFacesRequest.qualityVisaUSA(Uint8List image)
    : _image = image,
      _scenario = DetectFacesScenario.QUALITY_VISA_USA;

  /// Creates a request for a cropped portrait of the person whose face is the most central.
  ///
  /// [image] - Image base64.
  DetectFacesRequest.cropCentralFace(Uint8List image)
    : _image = image,
      _scenario = DetectFacesScenario.CROP_CENTRAL_FACE;

  /// Creates a request for cropped portraits of all the people in the image.
  ///
  /// [image] - Image base64.
  DetectFacesRequest.cropAllFaces(Uint8List image)
    : _image = image,
      _scenario = DetectFacesScenario.CROP_ALL_FACES;

  /// Creates a request for a cropped portrait of the person whose face is the most central in the image in the original size.
  ///
  /// [image] - Image base64.
  DetectFacesRequest.thumbnail(Uint8List image)
    : _image = image,
      _scenario = DetectFacesScenario.THUMBNAIL;

  /// Creates a request for all available attribute results.
  ///
  /// [image] - Image base64.
  DetectFacesRequest.allAttributes(Uint8List image)
    : _image = image,
      _scenario = DetectFacesScenario.ATTRIBUTES_ALL;

  @visibleForTesting
  static DetectFacesRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = DetectFacesRequest._privateConstructor();

    result._tag = jsonObject["tag"];
    result._scenario = DetectFacesScenario.getByValue(jsonObject["scenario"]);
    result._image = _bytesFromBase64(jsonObject["image"])!;
    result._configuration = DetectFacesConfig.fromJson(
      jsonObject["configuration"],
    );

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() =>
      {
        "tag": _tag,
        "scenario": _scenario?.value,
        "image": _bytesToBase64(_image),
        "configuration": _configuration?.toJson(),
      }.clearNulls();
}
