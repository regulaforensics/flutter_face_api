part of "../../flutter_face_api.dart";

class EnrollmentRequest {
  String get externalId => _externalId;
  String _externalId;

  String? get groupId => _groupId;
  String? _groupId;

  Uint8List? get trustedImage => _trustedImage;
  Uint8List? _trustedImage;

  String? get trustedImageUrl => _trustedImageUrl;
  String? _trustedImageUrl;

  EnrollmentRequest.withImage(
    String externalId,
    Uint8List trustedImage, {
    String? groupId,
  })  : _externalId = externalId,
        _trustedImage = trustedImage,
        _groupId = groupId;

  EnrollmentRequest.withImageUrl(
    String externalId,
    String trustedImageUrl, {
    String? groupId,
  })  : _externalId = externalId,
        _trustedImageUrl = trustedImageUrl,
        _groupId = groupId;

  EnrollmentRequest._privateConstructor(String externalId)
      : _externalId = externalId;

  @visibleForTesting
  static EnrollmentRequest? fromJson(jsonObject) {
    if (jsonObject == null) return null;
    var result = EnrollmentRequest._privateConstructor(
      jsonObject["externalId"],
    );

    result._groupId = jsonObject["groupId"];
    result._trustedImage = _bytesFromBase64(jsonObject["trustedImage"]);
    result._trustedImageUrl = jsonObject["trustedImageUrl"];

    return result;
  }

  @visibleForTesting
  Map<String, dynamic> toJson() => {
        "externalId": externalId,
        "groupId": groupId,
        "trustedImage": _bytesToBase64(trustedImage),
        "trustedImageUrl": trustedImageUrl,
      }.clearNulls();
}
