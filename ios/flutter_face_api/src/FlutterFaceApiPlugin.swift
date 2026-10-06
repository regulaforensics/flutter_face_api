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
    DispatchQueue.main.async { eventSinks[event]?(data.toSendable()) }
}

func withPresenter(_ action: @escaping (UIViewController) -> Void) {
    DispatchQueue.main.async {
        let windows = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.filter { $0.activationState == .foregroundActive || $0.activationState == .foregroundInactive }.flatMap { $0.windows }
        let candidates = windows.filter { $0.isKeyWindow } + windows.filter { !$0.isKeyWindow && !$0.isHidden && $0.alpha > 0 && $0.windowLevel == .normal }
        for window in candidates {
            guard var presenter = window.rootViewController else { continue }
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
        print("REGULA: Cannot present the UI: no presenter available.")
    }
}
