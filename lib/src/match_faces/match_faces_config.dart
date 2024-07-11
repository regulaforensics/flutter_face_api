part of "../../flutter_face_api.dart";

class MatchFacesConfig {
  ProcessingMode processingMode;

  MatchFacesConfig({
    ProcessingMode processingMode = ProcessingMode.ONLINE,
  }) : processingMode = processingMode;

  @visibleForTesting
  static MatchFacesConfig? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = MatchFacesConfig();

    result.processingMode =
        ProcessingMode.getByValue(jsonObject["processingMode"])!;

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "processingMode": processingMode.value,
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
