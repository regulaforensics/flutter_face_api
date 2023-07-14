#import <Flutter/Flutter.h>
@import FaceSDK;
#import "RFSWJSONConstructor.h"

typedef void (^RFSWCallback)(NSString* _Nullable response);

@interface FlutterFaceApiPlugin : NSObject<FlutterPlugin,
                                            RFSURLRequestInterceptingDelegate,
                                            RFSVideoUploadingDelegate,
                                            RFSCustomizationActionDelegate,
                                            RFSLivenessProcessStatusDelegate>
@property NSDictionary* _Nullable headers;
@end

@interface RFSWVideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RFSWOnCustomButtonTappedStreamHandler : NSObject <FlutterStreamHandler>
@end

@interface RFSWLivenessNotificationStreamHandler : NSObject <FlutterStreamHandler>
@end
