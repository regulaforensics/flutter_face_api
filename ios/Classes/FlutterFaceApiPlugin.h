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


static NSString* _Nonnull RFSWCameraSwitchEvent = @"cameraSwitchEvent";
static NSString* _Nonnull RFSWLivenessNotificationEvent = @"livenessNotificationEvent";
static NSString* _Nonnull RFSWVideoEncoderCompletionEvent = @"video_encoder_completion";
static NSString* _Nonnull RFSWOnCustomButtonTappedEvent = @"onCustomButtonTappedEvent";

@interface RFSWCameraSwitchStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWLivenessNotificationStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWVideoEncoderCompletionStreamHandler : NSObject <FlutterStreamHandler>
@end
@interface RFSWOnCustomButtonTappedStreamHandler : NSObject <FlutterStreamHandler>
@end
