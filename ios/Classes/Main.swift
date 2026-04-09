import FaceSDK

let face = FaceSDK.service
let db = face.personDatabase

let cameraSwitchEvent = "cameraSwitchEvent"
let livenessNotificationEvent = "livenessNotificationEvent"
let videoEncoderCompletionEvent = "video_encoder_completion"
let onCustomButtonTappedEvent = "onCustomButtonTappedEvent"

func methodCall(_ method: String, _ callback: @escaping Callback) {
    switch method {
    case("getVersion"): callback(face.version?.encode())
    case("getServiceUrl"): callback(face.serviceURL)
    case("setServiceUrl"): face.serviceURL = argsNullable(0)
    case("getTenant"): callback(face.tenant)
    case("setTenant"): face.tenant = argsNullable(0)
    case("getEnv"): callback(face.env)
    case("setEnv"): face.env = argsNullable(0)
    case("getLocale"): callback(face.languageLocaleCode)
    case("setLocale"): face.languageLocaleCode = argsNullable(0)
    case("setLocalizationDictionary"):
        face.localizationHandler = { (argsNullable(0) as [String : String?]?)?[$0] ?? nil }
    case("setRequestHeaders"):
        headers = argsNullable(0)
        face.requestInterceptingDelegate = headersDelegate
    case("setCustomization"): setCustomization(args(0))
    case("isInitialized"): callback(face.isInitialized)
    case("initialize"): face.initialize(
        configuration: InitializationConfiguration.decode(argsNullable(0)),
        completion: { success, error in
            if success {
                face.customization.configuration = UIConfiguration.default()
                face.videoUploadingDelegate = videoUploadingDelegate
                face.faceCaptureDelegate = faceCaptureDelegate
                face.livenessDelegate = livenessDelegate
                face.customization.actionDelegate = actionDelegate
            }
            callback(generateInitCompletion(success, error))
        })
    case("deinitialize"): face.deinitialize()
    case("startFaceCapture"): DispatchQueue.main.async {
        face.presentFaceCaptureViewController(
            from: rootViewController()!,
            animated: true,
            configuration: FaceCaptureConfiguration.decode(argsNullable(0)),
            onCapture: { callback($0.encode()) },
            completion: nil)
    }
    case("stopFaceCapture"): face.stopFaceCaptureViewController()
    case("startLiveness"): DispatchQueue.main.async {
        face.startLiveness(
            from: rootViewController()!,
            animated: true,
            configuration: LivenessConfiguration.decode(argsNullable(0)),
            onLiveness: { callback($0.encode()) },
            completion: nil)
    }
    case("stopLiveness"): face.stopLivenessProcessing()
    case("matchFaces"): face.matchFaces(
        MatchFacesRequest.decode(args(0)),
        configuration: MatchFacesConfiguration.decode(argsNullable(0)),
        completion: { callback($0.encode()) })
    case("splitComparedFaces"): callback(MatchFacesSimilarityThresholdSplit(
        pairs: (args(0) as [[String: Any?]]).compactMap { MatchFacesComparedFacesPair.decode($0) },
        bySimilarityThreshold: args(1)).encode())
    case("detectFaces"): face.detectFaces(
        by: DetectFacesRequest.decode(args(0)),
        completion: { callback($0.encode()) })
        
        // MARK: - PersonDatabase
        
    case("createPerson"): db.createPerson(
        name: args(0),
        metadata: argsNullable(1),
        groupIds: argsNullable(2),
        completion: { callback($0.encode()) }
    )
    case("updatePerson"): let json = args(0) as [String: Any]
        db.getPerson(
            personId: json["id"] as! String,
            completion: {
                guard let person = $0.item else { callback($0.encode()); return }
                db.updatePerson(person: person.update(json), completion: { callback($0.encode()) })
            })
    case("deletePerson"): db.deletePerson(personId: args(0), completion: { callback($0.encode()) })
    case("getPerson"): db.getPerson(personId: args(0), completion: { callback($0.encode()) })
    case("addPersonImage"): db.addPersonImage(
        personId: args(0),
        imageUpload: PersonDatabase.ImageUpload.decode(args(1))!,
        completion: { callback($0.encode()) })
    case("deletePersonImage"): db.deletePersonImage(
        personId: args(0),
        imageId: args(1),
        completion: { callback($0.encode()) })
    case("getPersonImage"): db.getPersonImage(
        personId: args(0),
        imageId: args(1),
        completion: { callback(encodeDBItemResponse($0.data?.encode(), $0.error)) })
    case("getPersonImages"): db.getPersonImages(personId: args(0), completion: { callback($0.encode())})
    case("getPersonImagesForPage"): db.getPersonImages(
        personId: args(0),
        page: args(1),
        size: args(2),
        completion: { callback($0.encode()) })
    case("createGroup"): db.createGroup(
        name: args(0),
        metadata: argsNullable(1) as [String: Any]?,
        completion: { callback($0.encode()) })
    case("updateGroup"): let json = args(0) as [String: Any]
        db.getGroups(
            groupId: json["id"] as! String,
            completion: {
                guard let group = $0.item else { callback($0.encode()); return }
                db.updateGroup(group: group.update(json), completion: { callback($0.encode()) })
            })
    case("editPersonsInGroup"): db.editGroupPersons(
        groupId: args(0),
        request: PersonDatabase.EditGroupPersonsRequest.decode(args(0)),
        completion: { callback($0.encode()) })
    case("deleteGroup"): db.deleteGroup(groupId: args(0), completion: { callback($0.encode()) })
    case("getGroup"): db.getGroups(groupId: args(0), completion: { callback($0.encode()) })
    case("getGroups"): db.getGroups(completion: { callback($0.encode()) })
    case("getGroupsForPage"): db.getGroups(
        page: args(0),
        size: args(1),
        completion: { callback($0.encode()) })
    case("getPersonGroups"): db.getPersonGroups(personId: args(0), completion: { callback($0.encode()) })
    case("getPersonGroupsForPage"): db.getPersonGroups(
        personId: args(0),
        page: args(1),
        size: args(2),
        completion: { callback($0.encode()) })
    case("getPersonsInGroup"): db.getGroupPersons(groupId: args(0), completion: { callback($0.encode()) })
    case("getPersonsInGroupForPage"): db.getGroupPersons(
        groupId: args(0),
        page: args(1),
        size: args(2),
        completion: { callback($0.encode()) })
    case("searchPerson"): db.searchPerson(
        searchRequest: PersonDatabase.SearchPersonRequest.decode(args(0)),
        completion: { callback(encodeDBItemResponse($0.results?.compactMap{ $0.encode2() }, $0.error)) })
    default: break
    }
}

// MARK: - Implementation

var headers: [String: String]?
let headersDelegate = IURLRequestInterceptingDelegate()
class IURLRequestInterceptingDelegate: NSObject, URLRequestInterceptingDelegate {
    func interceptorPrepare(_ request: URLRequest) -> URLRequest? {
        guard let headers = headers else { return request }
        var req = request
        for (key, value) in headers {
            req.addValue(value, forHTTPHeaderField: key)
        }
        return req
    }
}

let videoUploadingDelegate = IVideoUploadingDelegate()
class IVideoUploadingDelegate: NSObject, VideoUploadingDelegate {
    func videoUploading(forTransactionId transactionId: String, didFinishedWithSuccess success: Bool) {
        sendEvent(videoEncoderCompletionEvent, generateVideoEncoderCompletion(success, transactionId))
    }
}

let faceCaptureDelegate = IFaceCaptureDelegate()
class IFaceCaptureDelegate: NSObject, FaceCaptureDelegate {
    func cameraPositionChanged(_ cameraPosition: CameraPosition) {
        sendEvent(cameraSwitchEvent, cameraPosition)
    }
}

let livenessDelegate = ILivenessDelegate()
class ILivenessDelegate: NSObject, LivenessDelegate {
    func processStatusChanged(_ status: LivenessProcessStatus, result: LivenessResponse?) {
        sendEvent(livenessNotificationEvent, generateLivenessNotification(status, result))
    }
    func cameraPositionChanged(_ cameraPosition: CameraPosition) {
        sendEvent(cameraSwitchEvent, cameraPosition)
    }
}

let actionDelegate = ICustomizationActionDelegate()
class ICustomizationActionDelegate: NSObject, FaceSDK.CustomizationActionDelegate {
    func onFaceCustomButtonTapped(withTag tag: Int) {
        sendEvent(onCustomButtonTappedEvent, tag)
    }
}
