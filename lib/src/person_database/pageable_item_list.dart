part of "../../flutter_face_api.dart";

class PageableItemList<T> {
  List<T>? get items => _items;
  List<T>? _items;

  int get page => _page;
  late int _page;

  int get totalPages => _totalPages;
  late int _totalPages;

  PageableItemList._privateConstructor();

  @visibleForTesting
  static PageableItemList<T>? fromJson<T>(
    jsonObject,
    T? Function(dynamic) fromJSON,
  ) {
    if (jsonObject == null) return null;
    var result = PageableItemList<T>._privateConstructor();

    if (jsonObject["items"] != null) {
      result._items = [];
      for (var item in jsonObject["items"]) {
        var temp = fromJSON(item);
        if (temp != null) result._items!.add(temp);
      }
    }
    result._page = jsonObject["page"];
    result._totalPages = jsonObject["totalPages"];

    return result;
  }
}
