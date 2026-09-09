part of "../../flutter_face_api.dart";

class EnrollmentResponse {
  bool get enrolled => _enrolled;
  bool _enrolled = false;

  Person? get person => _person;
  Person? _person;

  List<SearchPerson>? get searchPersons => _searchPersons;
  List<SearchPerson>? _searchPersons;

  EnrollmentResponse._privateConstructor();

  @visibleForTesting
  static EnrollmentResponse? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = new EnrollmentResponse._privateConstructor();

    result._enrolled = jsonObject["enrolled"];
    result._person = Person.fromJson(jsonObject["person"]);
    if (jsonObject["searchPersons"] != null) {
      result._searchPersons = [];
      for (var item in jsonObject["searchPersons"]) {
        result._searchPersons!.add(SearchPerson.fromJson(item)!);
      }
    }

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "enrolled": enrolled,
        "person": person?.toJson(),
        "searchPersons": searchPersons?.map((e) => e.toJson()).toList(),
      }.clearNulls();
}
