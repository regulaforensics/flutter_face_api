part of "../../flutter_face_api.dart";

/// Compares two or more images with faces on them to find out the similarity of pairs.
/// The request is used as a parameter to [FaceSDK.matchFaces].
class MatchFacesRequest {
  /// Images with faces to match.
  List<MatchFacesImage> get images => _images;
  List<MatchFacesImage> _images;

  /// If set the uploaded image is processed according to the indicated settings.
  OutputImageParams? get outputImageParams => _outputImageParams;
  OutputImageParams? _outputImageParams;

  /// Defines tag that can be used in match faces processing. Defaults to `null`.
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
