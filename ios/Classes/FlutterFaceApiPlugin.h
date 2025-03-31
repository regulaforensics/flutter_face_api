#import <Flutter/Flutter.h>
#import "RFSWMain.h"

@interface FlutterFaceApiPlugin : NSObject<FlutterPlugin>
@end

static NSMutableDictionary<NSString*, FlutterEventSink>* eventSinks;

@interface RFSWCameraSwitchStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWLivenessNotificationStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWVideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWOnCustomButtonTappedStreamHandler : NSObject <FlutterStreamHandler>
@end
