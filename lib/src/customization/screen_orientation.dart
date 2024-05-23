part of "../../flutter_face_api.dart";

enum ScreenOrientation {
  PORTRAIT(0),

  LANDSCAPE(1);

  const ScreenOrientation(this.value);
  final int value;

  static ScreenOrientation? getByValue(int? i) {
    if (i == null) return null;
    return ScreenOrientation.values.firstWhere((x) => x.value == i);
  }

  static List<ScreenOrientation>? fromIntList(List<dynamic>? input) {
    if (input == null) return null;
    List<ScreenOrientation> list = [];
    for (int item in input) {
      list.addSafe(getByValue(item));
    }
    return list;
  }
}
