#import "FlutterFaceApiPlugin.h"

FlutterEventSink RFSWVideoEncoderCompletionEvent;
FlutterEventSink RFSWOnCustomButtonTappedEvent;
FlutterEventSink RFSWLivenessNotificationEvent;

@implementation RFSWVideoEncoderCompletionStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RFSWVideoEncoderCompletionEvent = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RFSWVideoEncoderCompletionEvent = nil;
    return nil;
}
@end

@implementation RFSWOnCustomButtonTappedStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RFSWOnCustomButtonTappedEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RFSWOnCustomButtonTappedEvent = nil;
  return nil;
}
@end

@implementation RFSWLivenessNotificationStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    RFSWLivenessNotificationEvent = eventSink;
  return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    RFSWLivenessNotificationEvent = nil;
  return nil;
}
@end

@implementation FlutterFaceApiPlugin

- (void) result:(id _Nullable)message :(RFSWCallback)callback {
    callback(message);
}

- (void)videoUploadingForTransactionId:(NSString * _Nonnull)transactionId didFinishedWithSuccess:(BOOL)success {
    if(RFSWVideoEncoderCompletionEvent != nil)
        RFSWVideoEncoderCompletionEvent([RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateVideoEncoderCompletion:transactionId :success]]);
}

- (void)onFaceCustomButtonTappedWithTag:(NSInteger)tag {
    if(RFSWOnCustomButtonTappedEvent != nil)
        RFSWOnCustomButtonTappedEvent([NSString stringWithFormat:@"%ld", tag]);
}

- (void)processStatusChanged:(RFSLivenessProcessStatus)status result:(RFSLivenessResponse*)result {
    if(RFSWLivenessNotificationEvent != nil)
        RFSWLivenessNotificationEvent([RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateLivenessNotification:status result:result]]);
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [[FlutterEventChannel eventChannelWithName:@"flutter_face_api/event/video_encoder_completion" binaryMessenger:[registrar messenger]] setStreamHandler:[RFSWVideoEncoderCompletionStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_face_api/event/onCustomButtonTappedEvent" binaryMessenger:[registrar messenger]] setStreamHandler:[RFSWOnCustomButtonTappedStreamHandler new]];
    [[FlutterEventChannel eventChannelWithName:@"flutter_face_api/event/livenessNotification" binaryMessenger:[registrar messenger]] setStreamHandler:[RFSWLivenessNotificationStreamHandler new]];

    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_face_api/method" binaryMessenger:[registrar messenger]];
    FlutterFaceApiPlugin* instance = [FlutterFaceApiPlugin new];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* action = call.method;
    NSMutableArray* args = call.arguments;

    RFSWCallback successCallback = ^(id _Nullable response){
        result(response);
    };
    RFSWCallback errorCallback = ^(NSString* error){
        result([FlutterError errorWithCode:@"error" message:error details:nil]);
    };

    if([action isEqualToString:@"getServiceUrl"])
        [self getServiceUrl :successCallback :errorCallback];
    else if([action isEqualToString:@"startLiveness"])
        [self startLiveness :successCallback :errorCallback];
    else if([action isEqualToString:@"getFaceSdkVersion"])
        [self getFaceSdkVersion :successCallback :errorCallback];
    else if([action isEqualToString:@"presentFaceCaptureActivity"])
        [self presentFaceCaptureActivity :successCallback :errorCallback];
    else if([action isEqualToString:@"stopFaceCaptureActivity"])
        [self stopFaceCaptureActivity :successCallback :errorCallback];
    else if([action isEqualToString:@"init"])
        [self init :successCallback :errorCallback];
    else if([action isEqualToString:@"initialize"])
        [self initialize :successCallback :errorCallback];
    else if([action isEqualToString:@"initializeWithConfig"])
        [self initializeWithConfig :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"deinit"])
        [self deinit :successCallback :errorCallback];
    else if([action isEqualToString:@"deinitialize"])
        [self deinitialize :successCallback :errorCallback];
    else if([action isEqualToString:@"isInitialized"])
        [self isInitialized :successCallback :errorCallback];
    else if([action isEqualToString:@"stopLivenessProcessing"])
        [self stopLivenessProcessing :successCallback :errorCallback];
    else if([action isEqualToString:@"setRequestHeaders"])
        [self setRequestHeaders :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"presentFaceCaptureActivityWithConfig"])
        [self presentFaceCaptureActivityWithConfig :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"matchFacesWithConfig"])
        [self matchFacesWithConfig :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"startLivenessWithConfig"])
        [self startLivenessWithConfig :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setServiceUrl"])
        [self setServiceUrl :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setLogs"])
        [self setLogs :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setSaveLogs"])
        [self setSaveLogs :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setLogsFolder"])
        [self setLogsFolder :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"matchFaces"])
        [self matchFaces :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"detectFaces"])
        [self detectFaces :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setUiCustomizationLayer"])
        [self setUiCustomizationLayer :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setUiConfiguration"])
        [self setUiConfiguration :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"setLocalizationDictionary"])
        [self setLocalizationDictionary :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"matchFacesSimilarityThresholdSplit"])
        [self matchFacesSimilarityThresholdSplit :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"getPerson"])
        [self getPerson :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"createPerson"])
        [self createPerson :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"updatePerson"])
        [self updatePerson :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"deletePerson"])
        [self deletePerson :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getPersonImages"])
        [self getPersonImages :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getPersonImagesForPage"])
        [self getPersonImagesForPage :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"addPersonImage"])
        [self addPersonImage :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"getPersonImage"])
        [self getPersonImage :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"deletePersonImage"])
        [self deletePersonImage :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"getGroups"])
        [self getGroups :successCallback :errorCallback];
    else if([action isEqualToString:@"getGroupsForPage"])
        [self getGroupsForPage :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"getPersonGroups"])
        [self getPersonGroups :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getPersonGroupsForPage"])
        [self getPersonGroupsForPage :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"createGroup"])
        [self createGroup :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"getGroup"])
        [self getGroup :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"updateGroup"])
        [self updateGroup :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"editPersonsInGroup"])
        [self editPersonsInGroup :[args objectAtIndex:0] :[args objectAtIndex:1] :successCallback :errorCallback];
    else if([action isEqualToString:@"getPersonsInGroup"])
        [self getPersonsInGroup :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"getPersonsInGroupForPage"])
        [self getPersonsInGroupForPage :[args objectAtIndex:0] :[args objectAtIndex:1] :[args objectAtIndex:2] :successCallback :errorCallback];
    else if([action isEqualToString:@"deleteGroup"])
        [self deleteGroup :[args objectAtIndex:0] :successCallback :errorCallback];
    else if([action isEqualToString:@"searchPerson"])
        [self searchPerson :[args objectAtIndex:0] :successCallback :errorCallback];
    else
        [self result:[NSString stringWithFormat:@"%@/%@", @"method not implemented: ", action] :errorCallback];
}
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (void) getServiceUrl:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [self result:[RFSFaceSDK.service serviceURL] :successCallback];
}

- (void) setRequestHeaders:(NSDictionary*)headers :(RFSWCallback)successCallback :(RFSWCallback)errorCallback {
    self.headers = headers;
    RFSFaceSDK.service.requestInterceptingDelegate = self;
    [self result:@"" :successCallback];
}

- (void) startLiveness:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        [RFSFaceSDK.service startLivenessFrom:[[[UIApplication sharedApplication] keyWindow] rootViewController] animated:true onLiveness:[self getLivenessCompletion:successCallback :errorCallback] completion:nil];
    });
}

- (void) getFaceSdkVersion:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [self result:[RFSFaceSDK.service version] :successCallback];
}

- (void) init:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service initializeWithCompletion:[self getInitCompletion:successCallback :errorCallback]];
}

- (void) initialize:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service initializeWithCompletion:[self getInitCompletion:successCallback :errorCallback]];
}

- (void) initializeWithConfig:(NSDictionary*)config :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service initializeWithConfiguration:[RFSWJSONConstructor RFSInitializationConfigurationFromJSON:config] completion:[self getInitCompletion:successCallback :errorCallback]];
}

- (void) deinit:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service deinitialize];
    [self result:@"" :successCallback];
}

- (void) deinitialize:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service deinitialize];
    [self result:@"" :successCallback];
}

- (void) isInitialized:(RFSWCallback)successCallback :(RFSWCallback)errorCallback {
    [self result:@"isInitialized() is an android-only method" :errorCallback];
}

- (void) setUiCustomizationLayer:(NSDictionary*)json :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSFaceSDK.service.customization.customUILayerJSON = json;
    [self result:@"" :successCallback];
}

- (void) setUiConfiguration:(NSDictionary*)config :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSFaceSDK.service.customization.configuration = [RFSWJSONConstructor RFSUIConfigurationFromJSON:config];
    [self result:@"" :successCallback];
}

- (void) presentFaceCaptureActivity:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    dispatch_async(dispatch_get_main_queue(), ^{
        [RFSFaceSDK.service presentFaceCaptureViewControllerFrom:[[[UIApplication sharedApplication] keyWindow] rootViewController] animated:true onCapture:[self getFaceCaptureCompletion:successCallback :errorCallback] completion:nil];
    });
}

- (void) stopFaceCaptureActivity:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service stopFaceCaptureViewController];
    [self result:@"" :successCallback];
}

- (void) stopLivenessProcessing:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service stopLivenessProcessing];
    [self result:@"" :successCallback];
}

- (void) presentFaceCaptureActivityWithConfig:(NSDictionary*)config :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSFaceCaptureConfiguration *configuration = [RFSFaceCaptureConfiguration configurationWithBuilder:^(RFSFaceCaptureConfigurationBuilder  * _Nonnull builder) {
        if([config valueForKey:@"copyright"] != nil)
            [builder setCopyright:[[config valueForKey:@"copyright"] boolValue]];
        if([config valueForKey:@"cameraSwitchEnabled"] != nil)
            [builder setCameraSwitchButtonEnabled:[[config valueForKey:@"cameraSwitchEnabled"] boolValue]];
        if([config valueForKey:@"closeButtonEnabled"] != nil)
            [builder setCloseButtonEnabled:[[config valueForKey:@"closeButtonEnabled"] boolValue]];
        if([config valueForKey:@"torchButtonEnabled"] != nil)
            [builder setTorchButtonEnabled:[[config valueForKey:@"torchButtonEnabled"] boolValue]];
        if([config valueForKey:@"cameraPositionIOS"] != nil)
            [builder setCameraPosition:[self RFSCameraPositionWithNSInteger:[[config valueForKey:@"cameraPositionIOS"] integerValue]]];
        if([config valueForKey:@"timeout"] != nil)
            [builder setTimeoutInterval:[config valueForKey:@"timeout"]];
        if([config valueForKey:@"holdStillDuration"] != nil)
            [builder setHoldStillDuration:[config valueForKey:@"holdStillDuration"]];
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        [RFSFaceSDK.service presentFaceCaptureViewControllerFrom:[[[UIApplication sharedApplication] keyWindow] rootViewController] animated:true configuration: configuration onCapture:[self getFaceCaptureCompletion:successCallback :errorCallback] completion:nil];
    });
}

- (void) matchFacesWithConfig:(NSString*)requestString :(NSDictionary*)config :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSMatchFacesConfiguration *configuration = [RFSMatchFacesConfiguration configurationWithBuilder:^(RFSMatchFacesConfigurationBuilder  * _Nonnull builder) {
        if([config valueForKey:@"processingMode"] != nil)
            [builder setProcessingMode:[self RFSProcessingModeWithString:[config valueForKey:@"processingMode"]]];
    }];
    [RFSFaceSDK.service matchFaces:[RFSWJSONConstructor RFSMatchFacesRequestFromJSON:[NSJSONSerialization JSONObjectWithData:[requestString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL]] configuration:configuration completion:[self getMatchFacesCompletion:successCallback :errorCallback]];
}

- (void) startLivenessWithConfig:(NSDictionary*)config :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSLivenessConfiguration *configuration = [RFSLivenessConfiguration configurationWithBuilder:^(RFSLivenessConfigurationBuilder  * _Nonnull builder) {
        if([config valueForKey:@"copyright"] != nil)
            [builder setCopyright:[[config valueForKey:@"copyright"] boolValue]];
        if([config valueForKey:@"cameraSwitchEnabled"] != nil)
            [builder setCameraSwitchButtonEnabled:[[config valueForKey:@"cameraSwitchEnabled"] boolValue]];
        if([config valueForKey:@"closeButtonEnabled"] != nil)
            [builder setCloseButtonEnabled:[[config valueForKey:@"closeButtonEnabled"] boolValue]];
        if([config valueForKey:@"torchButtonEnabled"] != nil)
            [builder setTorchButtonEnabled:[[config valueForKey:@"torchButtonEnabled"] boolValue]];
        if([config valueForKey:@"cameraPositionIOS"] != nil)
            [builder setCameraPosition:[self RFSCameraPositionWithNSInteger:[[config valueForKey:@"cameraPositionIOS"] integerValue]]];
        if([config valueForKey:@"attemptsCount"] != nil)
            [builder setAttemptsCount:[[config valueForKey:@"attemptsCount"] integerValue]];
        if([config valueForKey:@"locationTrackingEnabled"] != nil)
            [builder setLocationTrackingEnabled:[[config valueForKey:@"locationTrackingEnabled"] boolValue]];
        if([config valueForKey:@"recordingProcess"] != nil)
            [builder setRecordingProcess:[RFSWJSONConstructor RFSRecordingProcessWithString:[config valueForKey:@"recordingProcess"]]];
        if([config valueForKey:@"livenessType"] != nil)
            [builder setLivenessType:[RFSWJSONConstructor RFSLivenessTypeWithString:[config valueForKey:@"livenessType"]]];
        if([config valueForKey:@"tag"] != nil)
            [builder setTag:[config valueForKey:@"tag"]];
        if([config valueForKey:@"skipStep"] != nil) {
            [builder setStepSkippingMask:[self RFSLivenessStepSkipsWithIntegerArray:[config valueForKey:@"skipStep"]]];
        }
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        [RFSFaceSDK.service startLivenessFrom:[[[UIApplication sharedApplication] keyWindow] rootViewController] animated:true configuration: configuration onLiveness:[self getLivenessCompletion:successCallback :errorCallback] completion:nil];
    });
}

- (void) setServiceUrl:(NSString*)url :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service setServiceURL:url];
    [self result:@"" :successCallback];
}

- (void) setLogs:(BOOL)isEnable :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
//    [RFSFaceSDK.service setLogs:isEnable];
    [self result:@"Currently unavailable on iOS" :errorCallback];
}

- (void) setSaveLogs:(BOOL)isSaveLogs :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
//    [RFSFaceSDK.service setSaveLogs: isSaveLogs];
    [self result:@"Currently unavailable on iOS" :errorCallback];
}

- (void) setLogsFolder:(NSString*)path :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
//    [RFSFaceSDK.service setLogsFolder: path];
    [self result:@"Currently unavailable on iOS" :errorCallback];
}

- (void) matchFaces:(NSString*)requestString :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service matchFaces:[RFSWJSONConstructor RFSMatchFacesRequestFromJSON:[NSJSONSerialization JSONObjectWithData:[requestString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL]] completion:[self getMatchFacesCompletion:successCallback :errorCallback]];
}

- (void) detectFaces:(NSString*)requestString :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service detectFacesByRequest:[RFSWJSONConstructor RFSDetectFacesRequestFromJSON:[NSJSONSerialization JSONObjectWithData:[requestString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL]] completion:[self getDetectFacesCompletion:successCallback :errorCallback]];
}

- (void) matchFacesSimilarityThresholdSplit:(NSString*)str :(NSNumber*)similarity :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSArray<RFSMatchFacesComparedFacesPair *> *faces = [RFSWJSONConstructor NSArrayRFSMatchFacesComparedFacesPairFromJSON:array];
    RFSMatchFacesSimilarityThresholdSplit *split = [RFSMatchFacesSimilarityThresholdSplit splitPairs:faces bySimilarityThreshold:similarity];
    [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSMatchFacesSimilarityThresholdSplit:split]] :successCallback];
}

- (void) setLocalizationDictionary:(NSDictionary*)dictionary :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSFaceSDK.service.localizationHandler = ^NSString * _Nullable(NSString * _Nonnull localizationKey) {
        if(dictionary != nil && ![dictionary isEqual:[NSNull null]] && [dictionary valueForKey:localizationKey] != nil)
            return [dictionary valueForKey:localizationKey];
        return nil;
    };
    [self result:@"" :successCallback];
}

- (void (^)(RFSLivenessResponse * _Nonnull)) getLivenessCompletion:(RFSWCallback)successCallback :(RFSWCallback)errorCallback {
    return ^(RFSLivenessResponse* response) {
        [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSLivenessResponse:response]] :successCallback];
    };
}

- (void (^)(RFSFaceCaptureResponse * _Nonnull)) getFaceCaptureCompletion:(RFSWCallback)successCallback :(RFSWCallback)errorCallback {
    return ^(RFSFaceCaptureResponse* response) {
        [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSFaceCaptureResponse:response]] :successCallback];
    };
}

- (void (^)(RFSMatchFacesResponse * _Nonnull)) getMatchFacesCompletion:(RFSWCallback)successCallback :(RFSWCallback)errorCallback {
    return ^(RFSMatchFacesResponse* response) {
        [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSMatchFacesResponse:response]] :successCallback];
    };
}

- (void (^)(RFSDetectFacesResponse* _Nonnull)) getDetectFacesCompletion:(RFSWCallback)successCallback :(RFSWCallback)errorCallback {
    return ^(RFSDetectFacesResponse* response) {
        [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSDetectFacesResponse:response]] :successCallback];
    };
}

-(RFSCameraPosition)RFSCameraPositionWithNSInteger:(NSInteger)value {
    switch(value){
        case 0:
            return RFSCameraPositionBack;
        case 1:
            return RFSCameraPositionFront;
        default:
            return RFSCameraPositionBack;
    }
}

-(RFSProcessingMode)RFSProcessingModeWithString:(NSString*)value {
    if([value  isEqual: @"ONLINE"])
        return RFSProcessingModeOnline;
    else if([value  isEqual: @"OFFLINE"])
        return RFSProcessingModeOffline;
    else
        return RFSProcessingModeOnline;
}

-(RFSLivenessStepSkip)RFSLivenessStepSkipsWithIntegerArray:(NSArray<NSNumber*>*)input {
    // same as input.contains(1)
    bool start = CFArrayContainsValue((__bridge CFArrayRef)input, CFRangeMake(0, input.count), (CFNumberRef)@1);
    bool done = CFArrayContainsValue((__bridge CFArrayRef)input, CFRangeMake(0, input.count), (CFNumberRef)@2);

    if(start && !done){
        return RFSLivenessStepSkipOnboarding;
    }
    if(done && !start){
        return RFSLivenessStepSkipSuccess;
    }
    if(start && done){
        return RFSLivenessStepSkipOnboarding | RFSLivenessStepSkipSuccess;
    }
    return RFSLivenessStepSkipNone;
}

- (NSURLRequest*)interceptorPrepareRequest:(NSURLRequest*)request {
    NSMutableURLRequest *interceptedRequest = [request mutableCopy];
    for(NSString* key in self.headers.allKeys)
        [interceptedRequest addValue:key forHTTPHeaderField:[self.headers valueForKey:key]];
    return interceptedRequest;
}

- (void) getPerson:(NSString*)personId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getPersonByPersonId:personId completion:^(RFSItemResponse<RFSPerson *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPerson:response.item]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) createPerson:(NSString*)name :(NSDictionary*)metadata :(NSArray<NSString*>*)groupIds :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase createPersonWithName:name metadata:metadata groupIds:groupIds completion:^(RFSItemResponse<RFSPerson *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPerson:response.item]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) updatePerson:(NSDictionary*)person :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getPersonByPersonId:[RFSWJSONConstructor idFromJSON:person] completion:^(RFSItemResponse<RFSPerson *> * response) {
        if(response.error == nil) {
            if(response.item != nil) {
                [RFSFaceSDK.service.personDatabase updatePerson:[RFSWJSONConstructor updatePersonFromJSON:response.item :person] completion:^(RFSComfirmResponse * success) {
                    if(success)
                        [self result:@"" :successCallback];
                    else
                        [self result:@"" :errorCallback];
                }];
            } else
                [self result:@"id does not exist" :errorCallback];
        } else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) deletePerson:(NSString*)personId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase deletePersonByPersonId:personId completion:^(RFSComfirmResponse * success) {
        if(success)
            [self result:@"" :successCallback];
        else
            [self result:@"" :errorCallback];
    }];
}

- (void) getPersonImages:(NSString*)personId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getPersonImagesByPersonId:personId completion:^(RFSPageResponse<RFSPersonImage *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPagePersonImageResponse:response]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) getPersonImagesForPage:(NSString*)personId :(NSNumber*)page :(NSNumber*)size :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getPersonImagesByPersonId:personId page:[page integerValue] size:[size integerValue] completion:^(RFSPageResponse<RFSPersonImage *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPagePersonImageResponse:response]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) addPersonImage:(NSString*)personId :(NSDictionary*)image :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSImageUpload *imageUpload = [RFSWJSONConstructor RFSImageUploadFromJSON:image];
    [RFSFaceSDK.service.personDatabase addPersonImageByPersonId:personId imageUpload:imageUpload completion:^(RFSItemResponse<RFSPersonImage *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPersonImage:response.item]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) getPersonImage:(NSString*)personId :(NSString*)imageId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getPersonImageByPersonId:personId imageId:imageId completion:^(RFSDataResponse* response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateNSDataImage:response.data]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) deletePersonImage:(NSString*)personId :(NSString*)imageId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase deletePersonImageByPersonId:personId imageId: imageId completion:^(RFSComfirmResponse * success) {
        if(success)
            [self result:@"" :successCallback];
        else
            [self result:@"" :errorCallback];
    }];
}

- (void) getGroups:(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getGroups:^(RFSPageResponse<RFSPersonGroup *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPagePersonGroupResponse:response]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) getGroupsForPage:(NSNumber*)page :(NSNumber*)size :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getGroupsForPage:[page integerValue] size:[size integerValue] completion:^(RFSPageResponse<RFSPersonGroup *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPagePersonGroupResponse:response]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) getPersonGroups:(NSString*)personId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getPersonGroupsByPersonId:personId completion:^(RFSPageResponse<RFSPersonGroup *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPagePersonGroupResponse:response]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) getPersonGroupsForPage:(NSString*)personId :(NSNumber*)page :(NSNumber*)size :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getPersonGroupsByPersonId:personId page:[page integerValue] size:[size integerValue] completion:^(RFSPageResponse<RFSPersonGroup *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPagePersonGroupResponse:response]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) createGroup:(NSString*)name :(NSDictionary*)metadata :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase createGroupWithName:name metadata:metadata completion:^(RFSItemResponse<RFSPersonGroup *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPersonGroup:response.item]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) getGroup:(NSString*)groupId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getGroupByGroupId:groupId completion:^(RFSItemResponse<RFSPersonGroup *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPersonGroup:response.item]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) updateGroup:(NSDictionary*)group :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getGroupByGroupId:[RFSWJSONConstructor idFromJSON:group] completion:^(RFSItemResponse<RFSPersonGroup *> * response) {
        if(response.error == nil) {
            if(response.item != nil) {
                [RFSFaceSDK.service.personDatabase updateGroup:[RFSWJSONConstructor updatePersonGroupFromJSON:response.item :group] completion:^(RFSComfirmResponse * success) {
                    if(success)
                        [self result:@"" :successCallback];
                    else
                        [self result:@"" :errorCallback];
                }];
            } else
                [self result:@"id does not exist" :errorCallback];
        } else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) editPersonsInGroup:(NSString*)groupId :(NSDictionary*)editGroupPersonsRequest :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSEditGroupPersonsRequest *request = [RFSWJSONConstructor RFSEditGroupPersonsRequestFromJSON:editGroupPersonsRequest];
    [RFSFaceSDK.service.personDatabase editGroupPersonsByGroupId:groupId request:request completion:^(RFSComfirmResponse * success) {
        if(success)
            [self result:@"" :successCallback];
        else
            [self result:@"" :errorCallback];
    }];
}

- (void) getPersonsInGroup:(NSString*)groupId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getGroupPersonsByGroupId:groupId completion:^(RFSPageResponse<RFSPerson *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPagePersonResponse:response]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) getPersonsInGroupForPage:(NSString*)groupId :(NSNumber*)page :(NSNumber*)size :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase getGroupPersonsByGroupId:groupId page:[page integerValue] size:[size integerValue] completion:^(RFSPageResponse<RFSPerson *> * response) {
        if(response.error == nil)
            [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateRFSPagePersonResponse:response]] :successCallback];
        else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

- (void) deleteGroup:(NSString*)groupId :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    [RFSFaceSDK.service.personDatabase deleteGroupByGroupId:groupId completion:^(RFSComfirmResponse * success) {
        if(success)
            [self result:@"" :successCallback];
        else
            [self result:@"" :errorCallback];
    }];
}

- (void) searchPerson:(NSDictionary*)searchPersonRequest :(RFSWCallback)successCallback :(RFSWCallback)errorCallback{
    RFSSearchPersonRequest *request = [RFSWJSONConstructor RFSSearchPersonRequestFromJSON:searchPersonRequest];
    [RFSFaceSDK.service.personDatabase searchPerson:request completion:^(RFSSearchPersonResponse *response) {
        if(response.error == nil) {
            NSMutableArray<NSDictionary*> *results = [NSMutableArray new];
            for(RFSSearchPerson* searchPerson in response.results)
                [results addObject:[RFSWJSONConstructor generateRFSSearchPerson:searchPerson]];
            [self result:[RFSWJSONConstructor arrayToString:results] :successCallback];
        } else
            [self result:[RFSWJSONConstructor generateNSError:response.error] :errorCallback];
    }];
}

-(RFSFaceInitializationCompletion)getInitCompletion:(RFSWCallback)successCallback :(RFSWCallback)errorCallback {
    return ^(BOOL success, NSError * _Nullable error) {
        if(success){
            [RFSFaceSDK.service setVideoUploadingDelegate:self];
            [RFSFaceSDK.service setProcessStatusDelegate:self];
            RFSFaceSDK.service.customization.actionDelegate = self;
        }
        [self result:[RFSWJSONConstructor dictToString:[RFSWJSONConstructor generateInitCompletion:success :error]] :successCallback];
    };
}

@end
