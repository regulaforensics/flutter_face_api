part of "../../flutter_face_api.dart";

/// Physical position of camera's hardware on the system.
enum CameraPosition {
  /// The camera position corresponds to the front camera.
  FRONT(0),

  /// The camera position corresponds to the back camera.
  BACK(1);

  const CameraPosition(this.value);
  final int value;

  static CameraPosition? getByValue(int? i) {
    if (i == null) return null;
    return CameraPosition.values.firstWhere((x) => x.value == i);
  }
}
