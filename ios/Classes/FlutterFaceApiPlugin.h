#import <Flutter/Flutter.h>
@import FaceSDK;
#import "RFSWJSONConstructor.h"

@interface FlutterFaceApiPlugin : NSObject<FlutterPlugin, RFSURLRequestInterceptingDelegate, RFSVideoUploadingDelegate>
@property NSDictionary* headers;
@end

@interface VideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
