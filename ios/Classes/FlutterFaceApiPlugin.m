#import "FlutterFaceApiPlugin.h"

@implementation FlutterFaceApiPlugin

static UIViewController *RFSWVisibleViewController(UIViewController *root) {
    if (root == nil) return nil;
    if ([root isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)root;
        return RFSWVisibleViewController(nav.visibleViewController ?: nav.topViewController ?: nav);
    }
    if ([root isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tab = (UITabBarController *)root;
        return RFSWVisibleViewController(tab.selectedViewController ?: tab);
    }
    if (root.presentedViewController != nil) {
        return RFSWVisibleViewController(root.presentedViewController);
    }
    return root;
}

UIViewController*(^RFSWRootViewController)(void) = ^UIViewController*() {
    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
        if (![scene isKindOfClass:[UIWindowScene class]]) continue;
        if (scene.activationState != UISceneActivationStateForegroundActive &&
            scene.activationState != UISceneActivationStateForegroundInactive) continue;

        UIWindowScene *windowScene = (UIWindowScene *)scene;
        UIWindow *targetWindow = nil;
        for (UIWindow *window in windowScene.windows) {
            if (window.isKeyWindow) {
                targetWindow = window;
                break;
            }
        }
        if (targetWindow == nil) {
            for (UIWindow *window in windowScene.windows) {
                if (!window.hidden && window.alpha > 0.0 && window.windowLevel == UIWindowLevelNormal) {
                    targetWindow = window;
                    break;
                }
            }
        }
        if (targetWindow == nil) continue;

        UIViewController *visible = RFSWVisibleViewController(targetWindow.rootViewController);
        if (visible.viewIfLoaded.window != nil) return visible;
    }

    UIWindow *window = UIApplication.sharedApplication.keyWindow;
    UIViewController *visible = RFSWVisibleViewController(window.rootViewController);
    return visible ?: window.rootViewController;
};

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    eventSinks = [NSMutableDictionary new];
    void(^setupEventChannel)(NSObject<FlutterPluginRegistrar>* registrar, NSString*eventId, NSObject<FlutterStreamHandler>*handler) = ^(NSObject<FlutterPluginRegistrar>* registrar, NSString*eventId, NSObject<FlutterStreamHandler>*handler) {
        [[FlutterEventChannel eventChannelWithName:[NSString stringWithFormat:@"%@%@", @"flutter_face_api/event/", eventId] binaryMessenger:[registrar messenger]] setStreamHandler:handler];
    };
    setupEventChannel(registrar, cameraSwitchEvent, [RFSWCameraSwitchStreamHandler new]);
    setupEventChannel(registrar, livenessNotificationEvent, [RFSWLivenessNotificationStreamHandler new]);
    setupEventChannel(registrar, videoEncoderCompletionEvent, [RFSWVideoEncoderCompletionStreamHandler new]);
    setupEventChannel(registrar, onCustomButtonTappedEvent, [RFSWOnCustomButtonTappedStreamHandler new]);
    
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_face_api/method" binaryMessenger:[registrar messenger]];
    [registrar addMethodCallDelegate:[FlutterFaceApiPlugin new] channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    RFSWEventSender sendEvent = ^(NSString* event, id data) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (eventSinks[event] != nil) eventSinks[event]([RFSWJSONConstructor toSendable:data]);
        });
    };
    
    [RFSWMain methodCall:call.method
                        :call.arguments
                        :^(id data) { result([RFSWJSONConstructor toSendable:data]); }
                        :sendEvent];
}

@end


@implementation RFSWCameraSwitchStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[cameraSwitchEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[cameraSwitchEvent] = nil;
    return nil;
}
@end

@implementation RFSWLivenessNotificationStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[livenessNotificationEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[livenessNotificationEvent] = nil;
    return nil;
}
@end

@implementation RFSWVideoEncoderCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[videoEncoderCompletionEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[videoEncoderCompletionEvent] = nil;
    return nil;
}
@end

@implementation RFSWOnCustomButtonTappedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    eventSinks[onCustomButtonTappedEvent] = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    eventSinks[onCustomButtonTappedEvent] = nil;
    return nil;
}
@end
