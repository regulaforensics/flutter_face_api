part of "../../flutter_face_api.dart";

/// Request object that configures Search settings.
class SearchPersonRequest {
  ImageUpload _imageUpload;
  List<String>? _groupIdsForSearch;
  double? _threshold;
  int? _limit;
  String? _tag;
  bool _detectAll;
  OutputImageParams? _outputImageParams;

  /// Create [SearchPersonRequest] object.
  ///
  /// `image` - Image Upload object to apply search with.
  ///
  /// `groupIdsForSearch` - The Group IDs of the groups in which the search is performed.
  ///
  /// `threshold` - The similarity distance threshold, should be between 0.0 and 2.0,
  /// where 0.0 is for returning results for only the most similar persons and 2.0
  /// is for all the persons, even the dissimilar ones.
  /// Default: 1.
  ///
  /// `limit` - The number of returned Persons limit.
  /// Default: 100.
  ///
  /// `tag` - Defines tag that can be used in search request.
  /// Default: null.
  ///
  /// `detectAll` - Whether to process only the one face on the image or all the faces.
  /// Default: `false`.
  ///
  /// `outputImageParams` - If set the uploaded image is processed according to the indicated settings.
  SearchPersonRequest(
    ImageUpload image, {
    List<String>? groupIdsForSearch,
    double? threshold,
    int? limit,
    String? tag,
    bool detectAll = false,
    OutputImageParams? outputImageParams,
  })  : _imageUpload = image,
        _groupIdsForSearch = groupIdsForSearch,
        _threshold = threshold,
        _limit = limit,
        _tag = tag,
        _detectAll = detectAll,
        _outputImageParams = outputImageParams;

  @visibleForTesting
  static SearchPersonRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return SearchPersonRequest(
      ImageUpload.fromJson(jsonObject["imageUpload"])!,
      groupIdsForSearch: _stringListFrom(jsonObject["groupIdsForSearch"]),
      threshold: _toDouble(jsonObject["threshold"]),
      limit: jsonObject["limit"],
      tag: jsonObject["tag"],
      detectAll: jsonObject["detectAll"],
      outputImageParams:
          OutputImageParams.fromJson(jsonObject["outputImageParams"]),
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "imageUpload": _imageUpload.toJson(),
        "groupIdsForSearch": _groupIdsForSearch,
        "threshold": _threshold,
        "limit": _limit,
        "tag": _tag,
        "detectAll": _detectAll,
        "outputImageParams": _outputImageParams?.toJson(),
      }.clearNulls();
}
