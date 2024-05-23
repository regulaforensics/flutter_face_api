part of "../../flutter_face_api.dart";

class MatchFacesRequest {
  List<MatchFacesImage> get images => _images;
  List<MatchFacesImage> _images;

  OutputImageParams? get outputImageParams => _outputImageParams;
  OutputImageParams? _outputImageParams;

  String? get tag => _tag;
  String? _tag;

  Map<String, dynamic>? get metadata => _metadata;
  Map<String, dynamic>? _metadata;

  MatchFacesRequest(
    List<MatchFacesImage> images, {
    OutputImageParams? outputImageParams,
    String? tag,
    Map<String, dynamic>? metadata,
  })  : _images = images,
        _outputImageParams = outputImageParams,
        _tag = tag,
        _metadata = metadata;

  @visibleForTesting
  static MatchFacesRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    List<MatchFacesImage> images = [];
    for (var item in jsonObject["images"]) {
      images.add(MatchFacesImage.fromJson(item)!);
    }

    return MatchFacesRequest(images,
        outputImageParams:
            OutputImageParams.fromJson(jsonObject["outputImageParams"]),
        tag: jsonObject["tag"],
        metadata: jsonObject["metadata"]);
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "images": images.map((e) => e.toJson()).toList(),
        "outputImageParams": outputImageParams?.toJson(),
        "tag": tag,
        "metadata": metadata,
      }.clearNulls();
}
