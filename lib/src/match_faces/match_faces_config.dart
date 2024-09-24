part of "../../flutter_face_api.dart";

class MatchFacesConfig {
  ProcessingMode processingMode;
  bool locationTrackingEnabled;

  MatchFacesConfig({
    ProcessingMode processingMode = ProcessingMode.ONLINE,
    bool locationTrackingEnabled = true,
  })  : processingMode = processingMode,
        locationTrackingEnabled = locationTrackingEnabled;

  @visibleForTesting
  static MatchFacesConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = MatchFacesConfig();

    result.processingMode =
        ProcessingMode.getByValue(jsonObject["processingMode"])!;
    result.locationTrackingEnabled = jsonObject["locationTrackingEnabled"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "processingMode": processingMode.value,
        "locationTrackingEnabled": locationTrackingEnabled,
      }.clearNulls();
}

enum ProcessingMode {
  ONLINE(0),

  OFFLINE(1);

  const ProcessingMode(this.value);
  final int value;

  static ProcessingMode? getByValue(int? i) {
    if (i == null) return null;
    return ProcessingMode.values.firstWhere((x) => x.value == i);
  }
}
