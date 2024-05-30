part of "../../flutter_face_api.dart";

class SearchPersonRequest {
  ImageUpload _imageUpload;
  List<String>? _groupIdsForSearch;
  double? _threshold;
  int? _limit;
  bool _detectAll;
  OutputImageParams? _outputImageParams;

  SearchPersonRequest(
    ImageUpload image, {
    List<String>? groupIdsForSearch,
    double? threshold,
    int? limit,
    bool detectAll = false,
    OutputImageParams? outputImageParams,
  })  : _imageUpload = image,
        _groupIdsForSearch = groupIdsForSearch,
        _threshold = threshold,
        _limit = limit,
        _detectAll = detectAll,
        _outputImageParams = outputImageParams;

  @visibleForTesting
  static SearchPersonRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    return SearchPersonRequest(
      ImageUpload.fromJson(jsonObject["imageUpload"])!,
      groupIdsForSearch: jsonObject["groupIdsForSearch"],
      threshold: _toDouble(jsonObject["threshold"]),
      limit: jsonObject["limit"],
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
        "detectAll": _detectAll,
        "outputImageParams": _outputImageParams?.toJson(),
      }.clearNulls();
}
