#import <Flutter/Flutter.h>
#import <FaceSDK/FaceSDK.h>
#import "RFSWJSONConstructor.h"
#import "RFSWConfig.h"

typedef void (^RFSWCallback)(id _Nullable response);
typedef void (^RFSWEventSender)(NSString* _Nonnull event, id _Nullable data);

@interface FlutterFaceApiPlugin : NSObject<FlutterPlugin,
                                            RFSURLRequestInterceptingDelegate,
                                            RFSVideoUploadingDelegate,
                                            RFSCustomizationActionDelegate,
                                            RFSFaceCaptureDelegate,
                                            RFSLivenessDelegate>

@property (strong, nonatomic, class) FlutterMethodChannel* _Nullable channel;
@property NSDictionary* _Nullable headers;

@end


NSString* _Nonnull RFSWCameraSwitchEvent;
NSString* _Nonnull RFSWLivenessNotificationEvent;
NSString* _Nonnull RFSWVideoEncoderCompletionEvent;
NSString* _Nonnull RFSWOnCustomButtonTappedEvent;

@interface RFSWCameraSwitchStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWLivenessNotificationStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWVideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWOnCustomButtonTappedStreamHandler : NSObject <FlutterStreamHandler>
@end
