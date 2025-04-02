part of "../../flutter_face_api.dart";

late CustomButtonTappedCompletion _customButtonTappedCompletion;
void _setCustomButtonTappedCompletion(CustomButtonTappedCompletion completion) {
  _customButtonTappedCompletion = completion;
  _eventChannel(
    'onCustomButtonTappedEvent',
    (msg) => _customButtonTappedCompletion(msg),
  );
}

late VideoEncoderCompletion _videoEncoderCompletion;
void _setVideoEncoderCompletion(VideoEncoderCompletion completion) {
  _videoEncoderCompletion = completion;
  _eventChannel('video_encoder_completion', (msg) {
    var jsonObject = json.decode(msg);
    var transactionId = jsonObject["transactionId"];
    var success = jsonObject["success"];
    _videoEncoderCompletion(transactionId, success);
  });
}

LivenessNotificationCompletion? _livenessNotificationCompletion;
void _setLivenessNotificationCompletion(
  LivenessNotificationCompletion? completion,
) {
  _livenessNotificationCompletion = completion;
  _eventChannel('livenessNotificationEvent', (msg) {
    var livenessNotification = LivenessNotification.fromJson(json.decode(msg))!;
    _livenessNotificationCompletion?.call(livenessNotification);
  });
}

CameraSwitchCallback? _cameraSwitchCallback;
void _setCameraSwitchCallback(CameraSwitchCallback? callback) {
  _cameraSwitchCallback = callback;
  _eventChannel('cameraSwitchEvent', (cameraId) {
    _cameraSwitchCallback?.call(cameraId);
  });
}
