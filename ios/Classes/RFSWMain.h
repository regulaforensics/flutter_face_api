#import "RFSWJSONConstructor.h"
@import FaceSDK;

typedef void (^RFSWCallback)(id _Nullable response);
typedef void (^RFSWEventSender)(NSString* _Nonnull event, id _Nullable data);
extern UIViewController*_Nonnull(^ _Nonnull RFSWRootViewController)(void);

@interface RFSWMain: NSObject<RFSURLRequestInterceptingDelegate,
                              RFSVideoUploadingDelegate,
                              RFSCustomizationActionDelegate,
                              RFSFaceCaptureDelegate,
                              RFSLivenessDelegate>

+(void)methodCall:(NSString* _Nonnull)method
                 :(NSArray* _Nonnull)args
                 :(RFSWCallback _Nonnull)callback
                 :(RFSWEventSender _Nonnull)eventSender;

@end

static NSString* _Nonnull cameraSwitchEvent = @"cameraSwitchEvent";
static NSString* _Nonnull livenessNotificationEvent = @"livenessNotificationEvent";
static NSString* _Nonnull videoEncoderCompletionEvent = @"video_encoder_completion";
static NSString* _Nonnull onCustomButtonTappedEvent = @"onCustomButtonTappedEvent";
