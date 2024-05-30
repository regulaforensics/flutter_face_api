part of "../../flutter_face_api.dart";

enum CameraPosition {
  FRONT(0),

  BACK(1);

  const CameraPosition(this.value);
  final int value;

  static CameraPosition? getByValue(int? i) {
    if (i == null) return null;
    return CameraPosition.values.firstWhere((x) => x.value == i);
  }
}
