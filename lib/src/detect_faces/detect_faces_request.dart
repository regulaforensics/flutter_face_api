part of "../../flutter_face_api.dart";

class DetectFacesRequest {
  String? _tag;
  DetectFacesScenario? _scenario;
  late Uint8List _image;
  DetectFacesConfig? _configuration;

  DetectFacesRequest._privateConstructor();

  DetectFacesRequest(
    Uint8List image,
    DetectFacesConfig config, {
    String? tag,
  })  : _image = image,
        _configuration = config,
        _tag = tag;

  DetectFacesRequest.qualityFull(Uint8List image)
      : _image = image,
        _scenario = DetectFacesScenario.QUALITY_FULL;

  DetectFacesRequest.qualityICAO(Uint8List image)
      : _image = image,
        _scenario = DetectFacesScenario.QUALITY_ICAO;

  DetectFacesRequest.qualityVisaSchengen(Uint8List image)
      : _image = image,
        _scenario = DetectFacesScenario.QUALITY_VISA_SCHENGEN;

  DetectFacesRequest.qualityVisaUSA(Uint8List image)
      : _image = image,
        _scenario = DetectFacesScenario.QUALITY_VISA_USA;

  DetectFacesRequest.cropCentralFace(Uint8List image)
      : _image = image,
        _scenario = DetectFacesScenario.CROP_CENTRAL_FACE;

  DetectFacesRequest.cropAllFaces(Uint8List image)
      : _image = image,
        _scenario = DetectFacesScenario.CROP_ALL_FACES;

  DetectFacesRequest.thumbnail(Uint8List image)
      : _image = image,
        _scenario = DetectFacesScenario.THUMBNAIL;

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
    result._configuration =
        DetectFacesConfig.fromJson(jsonObject["configuration"]);

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "tag": _tag,
        "scenario": _scenario?.value,
        "image": _bytesToBase64(_image),
        "configuration": _configuration?.toJson(),
      }.clearNulls();
}
