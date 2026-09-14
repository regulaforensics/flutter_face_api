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
    runAsync { _ in eventSinks[event]?(data.toSendable()) }
}

func runAsync (_ action: @escaping (UIViewController) -> Void) {
    DispatchQueue.main.async {
        for case let scene as UIWindowScene in UIApplication.shared.connectedScenes
            where scene.activationState == .foregroundActive || scene.activationState == .foregroundInactive {
            let window = scene.windows.first { $0.isKeyWindow } ?? scene.windows.first { !$0.isHidden && $0.alpha > 0 && $0.windowLevel == .normal }
            guard var presenter = window?.rootViewController else { continue }
            while let next = presenter.presentedViewController
                ?? (presenter as? UINavigationController)?.visibleViewController
                ?? (presenter as? UINavigationController)?.topViewController
                ?? (presenter as? UITabBarController)?.selectedViewController {
                presenter = next
            }
            guard presenter.viewIfLoaded?.window != nil else { continue }
            action(presenter)
            return
        }
        NSLog("REGULA: Cannot present the UI: no presenter available.")
    }
}
