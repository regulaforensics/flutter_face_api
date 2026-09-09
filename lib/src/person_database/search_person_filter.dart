part of "../../flutter_face_api.dart";

class SearchPersonFilter {
  List<String> groups;

  double threshold = 0;

  int limit = 1;

  String? get fieldName => _fieldName;
  String? _fieldName;

  List<String>? get fieldValues => _fieldValues;
  List<String>? _fieldValues;

  bool get exclude => _exclude;
  bool _exclude = false;

  SearchPersonFilter({List<String> groups = const [], double threshold = 0, int limit = 1})
      : groups = groups,
        threshold = threshold,
        limit = limit;

  void filterField(String fieldName, List<String> fieldValues, {bool exclude = false}) {
    _fieldName = fieldName;
    _fieldValues = fieldValues;
    _exclude = exclude;
  }

  @visibleForTesting
  static SearchPersonFilter? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = SearchPersonFilter(
      groups: _stringListFrom(jsonObject["groups"])!,
      threshold: _toDouble(jsonObject["threshold"])!,
      limit: jsonObject["limit"]!,
    );
    result._fieldName = jsonObject["fieldName"];
    result._fieldValues = _stringListFrom(jsonObject["fieldValues"]);
    result._exclude = jsonObject["exclude"];
    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "groups": groups,
        "threshold": threshold,
        "limit": limit,
        "fieldName": fieldName,
        "fieldValues": fieldValues,
        "exclude": exclude,
      }.clearNulls();
}
