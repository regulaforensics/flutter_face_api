import Flutter

public class FlutterFaceApiPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channelID = "flutter_face_api"
        func setupEventChannel(_ eventId: String) {
            let channel = FlutterEventChannel(name: "\(channelID)/event/\(eventId)", binaryMessenger: registrar.messenger())
            channel.setStreamHandler(GenericStreamHandler(eventId))
        }
        setupEventChannel(cameraSwitchEvent);
        setupEventChannel(livenessNotificationEvent);
        setupEventChannel(videoEncoderCompletionEvent);
        setupEventChannel(onCustomButtonTappedEvent);
        
        let channel = FlutterMethodChannel(name: "\(channelID)/method", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(FlutterFaceApiPlugin(), channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        args = call.arguments as! [Any?]
        methodCall(call.method, { data in result(data.toSendable()) })
    }
} 

class GenericStreamHandler: NSObject, FlutterStreamHandler {
    private let eventId: String
    
    public init(_ eventId: String) {
        self.eventId = eventId
    }
    
    public func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
        eventSinks[eventId] = eventSink
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSinks[eventId] = nil
        return nil
    }
}

var eventSinks: [String: FlutterEventSink] = [:]
func sendEvent(_ event: String, _ data: Any? = nil) {
    DispatchQueue.main.async {
        if let sink = eventSinks[event] {
            sink(data.toSendable())
        }
    }
}

let rootViewController: () -> UIViewController? = {
    return UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first { $0.isKeyWindow }?
        .rootViewController
}
