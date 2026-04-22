import FaceSDK
import FaceSDK.Private
import UIKit

// MARK: - Init

// No decode and no tests for FaceSDKVersion because of the way its implemented.
public extension RFSFaceSDKVersion {
    func encode() -> [String: Any?] {
        return [
            "api": self.api,
            "core": self.core,
            "coreMode": self.coreMode,
        ]
    }
}


public extension Error {
    func encode() -> [String: Any?] {
        guard let it = self as NSError? else { return [:] }
        var result: [String: Any?] = [
            "code": it.code,
            "message": it.localizedDescription
        ]
        if let temp = it.userInfo[NSUnderlyingErrorKey] as? NSError {
            if let underlying = temp.userInfo[NSUnderlyingErrorKey] as? BackendError {
                result["underlyingError"] = [
                    "code": underlying.code,
                    "message": underlying.userInfo[BackendError.OriginalMessageKey]
                ]
            }
        }
        return result
    }
}

func generateInitCompletion(_ success: Bool, _ error: Error?) -> [String: Any?] {
    return [
        "success": success,
        "error": error?.encode()
    ]
}

public extension InitializationConfiguration {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        return Self(builder: { builder in
            builder.licenseData = Data.decode(it["license"])!
            if let prop = it["licenseUpdate"] as? Bool { builder.licenseUpdate = prop }
        })
    }
    func encode() -> [String: Any?] {
        return [
            "license": self.licenseData.encode(),
            "licenseUpdate": self.licenseUpdate,
        ]
    }
}

func generateVideoEncoderCompletion(_ success: Bool, _ transactionId: String) -> [String: Any?] {
    return [
        "success": success,
        "transactionId": transactionId
    ]
}

// MARK: - FaceCapture

public extension Image {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        let result = Self(
            image: UIImage.decode(it["image"])!,
            type: ImageType(rawValue: it["imageType"] as! Int)!)
        result.setValue(it["tag"] as! String, forKey: "identifier")
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "imageType": self.imageType.rawValue,
            "image": self.image.encode(),
            "tag": self.identifier,
        ]
    }
}

public extension FaceCaptureResponse {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let alloc = FaceCaptureResponse.allocate()
        let sel = "initWithImage:error:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            Any, Selector,
            Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                Image.decode(it["image"]),
                nil
            )})
    }
    func encode() -> [String: Any?] {
        return [
            "image": self.image?.encode(),
            "error": self.error?.encode(),
        ]
    }
}

// MARK: - Liveness

public extension LivenessResponse {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let alloc = LivenessResponse.allocate()
        let sel = "initWithTag:transactionId:estimatedAge:status:image:error:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            AnyObject, Selector,
            Any?, Any?, Any?, Int, Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                it["tag"],
                it["transactionId"],
                it["estimatedAge"],
                it["liveness"] as! Int,
                UIImage.decode(it["image"]),
                nil
            )})
    }
    func encode() -> [String: Any?] {
        return [
            "image": self.image?.encode(),
            "liveness": self.liveness.rawValue,
            "error": self.error?.encode(),
            "estimatedAge": self.estimatedAge,
            "tag": self.tag,
            "transactionId": self.transactionId,
        ]
    }
}

func generateLivenessNotification(_ status: LivenessProcessStatus, _ result: LivenessResponse?) -> [String: Any?] {
    return [
        "status": status.rawValue,
        "result": result?.encode()
    ]
}

// MARK: - MatchFacesRequest

public extension MatchFacesImage {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        let result = Self(image: UIImage.decode(it["image"])!,
                          imageType: ImageType(rawValue: it["imageType"] as! Int)!,
                          detectAll: it["detectAll"] as? Bool ?? false)
        result.setValue(it["identifier"] as! String, forKey: "identifier")
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "image": self.image.encode(),
            "imageType": self.imageType.rawValue,
            "detectAll": self.detectAll,
            "identifier": self.identifier,
        ]
    }
}

public extension CGSize {
    static func decode(_ it: Any?) -> Self {
        guard let it = it as? [String: Any] else { return .zero }
        return Self(width: CGFloat(it["width"] as! Float),
                    height: CGFloat(it["height"] as! Float))
    }
    func encode() -> [String: Any?]? {
        if self == .zero { return nil }
        if self == CGSizeMake(60, 80) { return nil } // this is default size that is created in sdk if you pass null
        return [
            "width": self.width,
            "height": self.height,
        ]
    }
}

public extension OutputImageCrop {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        return Self(type: AspectRatio(rawValue: it["type"] as! UInt)!,
                    size: CGSize.decode(it["size"]),
                    padColor: UIColor.decode(it["padColor"]),
                    returnOriginalRect: it["returnOriginalRect"] as? Bool ?? false)
    }
    func encode() -> [String: Any?] {
        return [
            "type": self.type.rawValue,
            "size": self.size.encode(),
            "padColor": self.padColor?.encode(),
            "returnOriginalRect": self.returnOriginalRect,
        ]
    }
}

public extension OutputImageParams {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        let result = Self()
        result.backgroundColor = UIColor.decode(it["backgroundColor"]);
        result.crop = OutputImageCrop.decode(it["crop"]);
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "backgroundColor": self.backgroundColor?.encode(),
            "crop": self.crop?.encode(),
        ]
    }
}

public extension MatchFacesRequest {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let result = Self(images: (it["images"] as! [[String: Any?]]).compactMap { MatchFacesImage.decode($0) })
        result.metadata = it["metadata"] as? [String: Any]
        result.tag = it["tag"] as? String
        result.outputImageParams = OutputImageParams.decode(it["outputImageParams"])
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "images": self.images.map { $0.encode() },
            "metadata": self.metadata,
            "tag": self.tag,
            "outputImageParams": self.outputImageParams?.encode(),
        ]
    }
}

// MARK: - MatchFacesResponse

public extension Point {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        return Self(x: CGFloat(it["x"] as! Float),
                    y: CGFloat(it["y"] as! Float))
    }
    func encode() -> [String: Any?] {
        return [
            "x": self.x,
            "y": self.y,
        ]
    }
}

public extension CGRect {
    static func decode(_ it: Any?) -> Self {
        guard let it = it as? [String: Any] else { return .null }
        return Self(x: CGFloat(it["left"] as! Float),
                    y: CGFloat(it["top"] as! Float),
                    width: CGFloat(it["right"] as! Float) - CGFloat(it["left"] as! Float),
                    height: CGFloat(it["bottom"] as! Float) - CGFloat(it["top"] as! Float))
    }
    func encode() -> [String: Any?]? {
        if self == .null { return nil }
        return [
            "top": self.origin.y,
            "left": self.origin.x,
            "bottom": self.origin.y + self.size.height,
            "right": self.origin.x + self.size.width,
        ]
    }
}

public extension MatchFacesDetectionFace {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        return Self(faceIndex: it["faceIndex"] as! NSNumber,
                    landmarks: (it["landmarks"] as! [[String: Any?]]).compactMap { Point.decode($0) },
                    face: CGRect.decode(it["faceRect"]),
                    rotationAngle: it["rotationAngle"] as? NSNumber,
                    thumbnailImage: UIImage.decode(it["thumbnailImage"]),
                    crop: UIImage.decode(it["crop"]),
                    originalRect: CGRect.decode(it["originalRect"]))
    }
    func encode() -> [String: Any?] {
        return [
            "faceIndex": self.faceIndex,
            "landmarks": self.landmarks.map { $0.encode() },
            "faceRect": self.faceRect.encode(),
            "rotationAngle": self.rotationAngle,
            "crop": self.crop?.encode(),
            "originalRect": self.originalRect.encode(),
        ]
    }
}

public extension MatchFacesDetection {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let alloc = MatchFacesDetection.allocate()
        let sel = "initWithImageIndex:image:faces:error:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            AnyObject, Selector,
            Any?, Any?, Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                it["imageIndex"],
                MatchFacesImage.decode(it["image"]),
                (it["faces"] as? [Any])?.map { MatchFacesDetectionFace.decode($0) },
                nil
            )})
    }
    func encode() -> [String: Any?] {
        return [
            "image": self.image.encode(),
            "imageIndex": self.imageIndex,
            "faces": self.faces.map { $0.encode() },
            "error": self.error?.encode(),
        ]
    }
}

public extension MatchFacesComparedFace {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        return Self(imageIndex: it["imageIndex"] as! NSNumber,
                    image: MatchFacesImage.decode(it["image"])!,
                    faceIndex: it["faceIndex"] as? NSNumber,
                    face: MatchFacesDetectionFace.decode(it["face"]))
    }
    func encode() -> [String: Any?] {
        return [
            "imageIndex": self.imageIndex,
            "image": self.image.encode(),
            "faceIndex": self.faceIndex,
            "face": self.face?.encode(),
        ]
    }
}

public extension MatchFacesComparedFacesPair {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        return Self(first: MatchFacesComparedFace.decode(it["first"]),
                    second: MatchFacesComparedFace.decode(it["second"]),
                    score: it["score"] as? NSNumber,
                    similarity: it["similarity"] as? NSNumber,
                    error: nil)
    }
    func encode() -> [String: Any?] {
        return [
            "first": self.first.encode(),
            "second": self.second.encode(),
            "score": self.score,
            "similarity": self.similarity,
            "error": self.error?.encode(),
        ]
    }
}

public extension MatchFacesResponse {
    static func decode(_ it: Any?) -> MatchFacesResponse {
        let it = it as! [String: Any]
        let alloc = MatchFacesResponse.allocate()
        let sel = "initWithResults:detections:error:".selector()
        let result = privateInit(alloc, sel, (@convention(c)(
            AnyObject, Selector,
            Any?, Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                (it["results"] as? [Any])?.map { MatchFacesComparedFacesPair.decode($0) },
                (it["detections"] as? [Any])?.map { MatchFacesDetection.decode($0) },
                nil
            )}) as MatchFacesResponse
        result.setValue(it["tag"] as? String, forKey: "tag")
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "results": self.results.map { $0.encode() },
            "detections": self.detections.map { $0.encode() },
            "error": self.error?.encode(),
            "tag": self.tag,
        ]
    }
}

public extension MatchFacesSimilarityThresholdSplit {
    func encode() -> [String: Any?] {
        return [
            "matchedFaces": self.matchedFaces.map { $0.encode() },
            "unmatchedFaces": self.unmatchedFaces.map { $0.encode() },
        ]
    }
}

// MARK: - DetectFaces

public extension ImageQualityRange {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        let alloc = ImageQualityRange.allocate()
        let sel = "initWithRange:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            Any, Selector,
            Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                [it["min"] as! NSNumber, it["max"] as! NSNumber]
            ) })
    }
    func encode() -> [String: Any?] {
        return [
            "min": self.min,
            "max": self.max,
        ]
    }
    func asList() -> [NSNumber] {
        return [self.min, self.max]
    }
}

public extension ImageQualityCharacteristic {
    static func decode(_ it: Any?) -> ImageQualityCharacteristic {
        let it = it as! [String: Any]
        let name = it["characteristicName"] as! String
        let recommendedRange = ImageQualityRange.decode(it["recommendedRange"])?.asList()
        let customRange = ImageQualityRange.decode(it["customRange"])?.asList()
        let color = UIColor.decode(it["customRange"])
        var result: ImageQualityCharacteristic?
        
        switch name {
        case("ImageWidth"): result = ImageQualityGroup.Image.imageWidth(withRange: recommendedRange!)
        case("ImageHeight"): result = ImageQualityGroup.Image.imageHeight(withRange: recommendedRange!)
        case("ImageWidthToHeight"): result = ImageQualityGroup.Image.imageWidthToHeight(withRange: recommendedRange!)
        case("ImageChannelsNumber"): result = ImageQualityGroup.Image.imageChannelsNumber(withValue: recommendedRange![0])
        case("PaddingRatio"): result = ImageQualityGroup.Image.paddingRatio(withMinValue: recommendedRange![0], maxValue: recommendedRange![1])
        case("ArtFace"): result = ImageQualityGroup.Image.artFace()
            
        case("FaceMidPointHorizontalPosition"): result = ImageQualityGroup.HeadSizeAndPosition.faceMidPointHorizontalPosition()
        case("FaceMidPointVerticalPosition"): result = ImageQualityGroup.HeadSizeAndPosition.faceMidPointVerticalPosition()
        case("HeadWidthRatio"): result = ImageQualityGroup.HeadSizeAndPosition.headWidthRatio()
        case("HeadHeightRatio"): result = ImageQualityGroup.HeadSizeAndPosition.headHeightRatio()
        case("EyesDistance"): result = ImageQualityGroup.HeadSizeAndPosition.eyesDistance()
        case("Yaw"): result = ImageQualityGroup.HeadSizeAndPosition.yaw()
        case("Pitch"): result = ImageQualityGroup.HeadSizeAndPosition.pitch()
        case("Roll"): result = ImageQualityGroup.HeadSizeAndPosition.roll()
            
        case("BlurLevel"): result = ImageQualityGroup.FaceImage.blurLevel()
        case("NoiseLevel"): result = ImageQualityGroup.FaceImage.noiseLevel()
        case("UnnaturalSkinTone"): result = ImageQualityGroup.FaceImage.unnaturalSkinTone()
        case("FaceDynamicRange"): result = ImageQualityGroup.FaceImage.faceDynamicRange()
            
        case("EyeRightClosed"): result = ImageQualityGroup.Eyes.eyeRightClosed()
        case("EyeLeftClosed"): result = ImageQualityGroup.Eyes.eyeLeftClosed()
        case("EyeRightOccluded"): result = ImageQualityGroup.Eyes.eyeRightOccluded()
        case("EyeLeftOccluded"): result = ImageQualityGroup.Eyes.eyeLeftOccluded()
        case("EyesRed"): result = ImageQualityGroup.Eyes.eyesRed()
        case("EyeRightCoveredWithHair"): result = ImageQualityGroup.Eyes.eyeRightCoveredWithHair()
        case("EyeLeftCoveredWithHair"): result = ImageQualityGroup.Eyes.eyeLeftCoveredWithHair()
        case("OffGaze"): result = ImageQualityGroup.Eyes.offGaze()
            
        case("TooDark"): result = ImageQualityGroup.ShadowsAndLightning.tooDark()
        case("TooLight"): result = ImageQualityGroup.ShadowsAndLightning.tooLight()
        case("FaceGlare"): result = ImageQualityGroup.ShadowsAndLightning.faceGlare()
        case("ShadowsOnFace"): result = ImageQualityGroup.ShadowsAndLightning.shadowsOnFace()
            
        case("ShouldersPose"): result = ImageQualityGroup.PoseAndExpression.shouldersPose()
        case("ExpressionLevel"): result = ImageQualityGroup.PoseAndExpression.expressionLevel()
        case("MouthOpen"): result = ImageQualityGroup.PoseAndExpression.mouthOpen()
        case("Smile"): result = ImageQualityGroup.PoseAndExpression.smile()
            
        case("DarkGlasses"): result = ImageQualityGroup.HeadOcclusion.darkGlasses()
        case("ReflectionOnGlasses"): result = ImageQualityGroup.HeadOcclusion.reflectionOnGlasses()
        case("FramesTooHeavy"): result = ImageQualityGroup.HeadOcclusion.framesTooHeavy()
        case("FaceOccluded"): result = ImageQualityGroup.HeadOcclusion.faceOccluded()
        case("HeadCovering"): result = ImageQualityGroup.HeadOcclusion.headCovering()
        case("ForeheadCovering"): result = ImageQualityGroup.HeadOcclusion.foreheadCovering()
        case("StrongMakeup"): result = ImageQualityGroup.HeadOcclusion.strongMakeup()
        case("Headphones"): result = ImageQualityGroup.HeadOcclusion.headphones()
        case("MedicalMask"): result = ImageQualityGroup.HeadOcclusion.medicalMask()
            
        case("BackgroundUniformity"): result = ImageQualityGroup.Background.backgroundUniformity()
        case("ShadowsOnBackground"): result = ImageQualityGroup.Background.shadowsOnBackground()
        case("OtherFaces"): result = ImageQualityGroup.Background.otherFaces()
        case("BackgroundColorMatch"):
            if color != nil { result = ImageQualityGroup.Background.backgroundColorMatch(with: color!) }
            else { result = ImageQualityGroup.Background.backgroundColorMatch() }
        default: break
        }
        
        guard let customRange = customRange else { return result! }
        return result!.withCustomRange(customRange)
    }
    func encode() -> [String: Any?] {
        return [
            "characteristicName": self.name.rawValue,
            "recommendedRange": self.recommendedRange?.encode(),
            "customRange": self.customRange?.encode(),
            "color": (self as? ImageQualityColorCharacteristic)?.color.encode()
        ]
    }
}

public extension DetectFacesConfiguration {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let result = Self()
        result.customQuality = (it["customQuality"] as? [[String: Any]])?.compactMap { ImageQualityCharacteristic.decode($0) }
        result.outputImageParams = OutputImageParams.decode(it["outputImageParams"])
        result.onlyCentralFace = it["onlyCentralFace"] as? Bool ?? false
        result.attributes = (it["attributes"] as? [String])?.compactMap { DetectFacesAttribute(rawValue: $0) }
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "customQuality": self.customQuality?.map { $0.encode() },
            "outputImageParams": self.outputImageParams?.encode(),
            "onlyCentralFace": self.onlyCentralFace,
            "attributes": self.attributes?.map { $0.rawValue },
        ]
    }
}

public extension DetectFacesRequest {
    static func decode(_ it: Any?) -> DetectFacesRequest {
        let it = it as! [String: Any]
        var result: DetectFacesRequest!
        let image = UIImage.decode(it["image"])!
        if let scenario = it["scenario"] as? String {
            let alloc = DetectFacesRequest.allocate()
            let sel = "initImage:scenario:".selector()
            result = privateInit(alloc, sel, (@convention(c)(
                Any, Selector,
                Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                    alloc, sel,
                    image, scenario
                ) })
        } else {
            result = DetectFacesRequest(
                image: image,
                configuration: DetectFacesConfiguration.decode(it["configuration"])
            )
        }
        
        result.tag = it["tag"] as? String
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "image": self.image.encode(),
            "tag": self.tag,
            "scenario": self.scenario,
            "configuration": self.configuration?.encode(),
        ]
    }
}

public extension ImageQualityResult {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let alloc = ImageQualityResult.allocate()
        let sel = "initWithName:groupId:status:value:range:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            Any, Selector,
            Any?, Int, Int, Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                it["name"] as! NSString,
                it["group"] as! Int,
                it["status"] as! Int,
                it["value"] as! NSNumber,
                ImageQualityRange.decode(it["range"])!
            )})
    }
    func encode() -> [String: Any?] {
        return [
            "name": self.name.rawValue,
            "group": self.group.rawValue,
            "status": self.status.rawValue,
            "range": self.range.encode(),
            "value": self.value,
        ]
    }
}

public extension DetectFacesAttributeResult {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let alloc = DetectFacesAttributeResult.allocate()
        let sel = "initWith:confidence:value:range:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            Any, Selector,
            Any?, Any?, Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                it["attribute"],
                it["confidence"],
                it["value"],
                ImageQualityRange.decode(it["range"])?.asList()
            )})
    }
    func encode() -> [String: Any?] {
        return [
            "attribute": self.attribute.rawValue,
            "range": self.range?.encode(),
            "value": self.value,
            "confidence": self.confidence,
        ]
    }
}

public extension DetectFaceResult {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let alloc = DetectFaceResult.allocate()
        let sel = "initWithQuality:attributes:cropImageData:faceRect:landmarks:originalRect:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            Any, Selector,
            Any?, Any?, Any?, CGRect, Any?, CGRect) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                (it["quality"] as? [Any])?.map { ImageQualityResult.decode($0) },
                (it["attributes"] as? [Any])?.map{ DetectFacesAttributeResult.decode($0) },
                it["crop"],
                CGRect.decode(it["faceRect"]),
                (it["landmarks"] as? [Any])?.map{ Point.decode($0) },
                CGRect.decode(it["originalRect"])
            )})
    }
    func encode() -> [String: Any?] {
        return [
            "quality": self.quality?.map { $0.encode() },
            "attributes": self.attributes?.map { $0.encode() },
            "landmarks": self.landmarks?.map { $0.encode() },
            "crop": self.crop?.encode(),
            "faceRect": self.faceRect.encode(),
            "originalRect": self.originalRect.encode(),
            "isQualityCompliant": self.isQualityCompliant,
        ]
    }
}

public extension DetectFacesResponse {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let alloc = DetectFacesResponse.allocate()
        let sel = "initWithDetections:scenario:error:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            Any, Selector,
            Any?, Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                (it["allDetections"] as? [Any])?.map { DetectFaceResult.decode($0) },
                it["scenario"],
                nil
            )})
    }
    func encode() -> [String: Any?] {
        return [
            "detection": self.detection?.encode(),
            "error": self.error?.encode(),
            "allDetections": self.allDetections?.map { $0.encode() },
            "scenario": self.scenario,
        ]
    }
}

// MARK: - PersonDatabase

func encodeDBItemResponse(_ data: Any?, _ error: Error?) -> [String: Any?] {
    return [
        "data": data,
        "error": error?.localizedDescription
    ]
}

func encodeDBPageResponse<T>(_ response: DBPageResponse<T>, _ data: Any?) -> [String: Any?] {
    return encodeDBItemResponse([
        "items": data,
        "page": response.page,
        "totalPages": response.totalPages,
    ], response.error)
}

public extension PersonDatabase.Response {
    func encode() -> [String: Any?] { return encodeDBItemResponse(self.success, self.error) }
}
public extension BDItemResponse<PersonDatabase.Person> {
    func encode() -> [String: Any?] { return encodeDBItemResponse(self.item?.encode(), self.error) }
}
public extension BDItemResponse<PersonDatabase.PersonImage> {
    func encode() -> [String: Any?] { return encodeDBItemResponse(self.item?.encode(), self.error) }
}
public extension BDItemResponse<PersonDatabase.PersonGroup> {
    func encode() -> [String: Any?] { return encodeDBItemResponse(self.item?.encode(), self.error) }
}
public extension DBPageResponse<PersonDatabase.Person> {
    func encode() -> [String: Any?] { return encodeDBPageResponse(self, self.items?.compactMap{ $0.encode() }) }
}
public extension DBPageResponse<PersonDatabase.PersonImage> {
    func encode() -> [String: Any?] { return encodeDBPageResponse(self, self.items?.compactMap{ $0.encode() }) }
}
public extension DBPageResponse<PersonDatabase.PersonGroup> {
    func encode() -> [String: Any?] { return encodeDBPageResponse(self, self.items?.compactMap{ $0.encode() }) }
}

public extension Date {
    private static func formatter() -> DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return df
    }
    static func decode(_ it: Any?) -> Date {
        let it = it as! String
        return formatter().date(from: it)!
    }
    func encode() -> String { return Date.formatter().string(from: self) }
}

public extension URL {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? String else { return nil }
        return Self(string: it)
    }
    func encode() -> String {
        return self.absoluteString
    }
}

public extension PersonDatabase.Person {
    static func decode(_ it: Any?) -> PersonDatabase.Person {
        let it = it as! [String: Any]
        let result = PersonDatabase.Person.emptyInit() as PersonDatabase.Person
        result.setValue(Date.decode(it["updatedAt"]), forKey: "updatedAt")
        result.setValue(Date.decode(it["createdAt"]), forKey: "createdAt")
        result.setValue(it["name"] as Any?, forKey: "name")
        result.setValue(it["groups"] as Any?, forKey: "groups")
        result.setValue(it["id"] as Any?, forKey: "itemId")
        result.setValue((it["metadata"] as Any?) ?? NSNull(), forKey: "mutableMetadata")
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "updatedAt": self.updatedAt.encode(),
            "createdAt": self.createdAt.encode(),
            "name": self.name,
            "groups": self.groups,
            "id": self.itemId,
            "metadata": self.metadata,
        ]
    }
    func update(_ it: [String: Any?]) -> Self {
        if let name = it["name"] as? String { self.name = name }
        if let metadata = it["metadata"] as? [String: Any] { self.metadata = NSMutableDictionary(dictionary: metadata) }
        return self
    }
}

public extension PersonDatabase.PersonImage {
    static func decode(_ it: Any?) -> PersonDatabase.PersonImage {
        let it = it as! [String: Any]
        let result = PersonDatabase.PersonImage.emptyInit() as PersonDatabase.PersonImage
        result.setValue(Date.decode(it["createdAt"]), forKey: "createdAt")
        result.setValue(URL.decode(it["url"]), forKey: "url")
        result.setValue(it["id"] as Any?, forKey: "itemId")
        result.setValue(it["path"] as Any?, forKey: "path")
        result.setValue(it["contentType"] as Any?, forKey: "contentType")
        result.setValue(it["metadata"] as Any?, forKey: "metadata")
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "url": self.url.encode(),
            "createdAt": self.createdAt.encode(),
            "path": self.path,
            "contentType": self.contentType,
            "id": self.itemId,
            "metadata": self.metadata,
        ]
    }
}

public extension PersonDatabase.ImageUpload {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        if let imageUrl = it["imageUrl"] as? String { return Self(imageURL: URL.decode(imageUrl)!) }
        return Self(imageData: Data.decode(it["imageData"])!)
    }
    func encode() -> [String: Any?] {
        return [
            "imageUrl": self.imageURL?.encode(),
            "imageData": self.imageData?.encode(),
        ]
    }
}

public extension PersonDatabase.PersonGroup {
    static func decode(_ it: Any?) -> PersonDatabase.PersonGroup {
        let it = it as! [String: Any]
        let result = PersonDatabase.PersonGroup.emptyInit() as PersonDatabase.PersonGroup
        result.setValue(Date.decode(it["createdAt"]), forKey: "createdAt")
        result.setValue(it["name"] as Any?, forKey: "name")
        result.setValue(it["id"] as Any?, forKey: "itemId")
        result.setValue((it["metadata"] as Any?) ?? NSNull(), forKey: "mutableMetadata")
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "createdAt": self.createdAt.encode(),
            "name": self.name,
            "id": self.itemId,
            "metadata": self.metadata,
        ]
    }
    func update(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        if let name = it["name"] as? String { self.name = name }
        if let metadata = it["metadata"] as? [String: Any] { self.metadata = NSMutableDictionary(dictionary: metadata) }
        return self
    }
}

public extension PersonDatabase.EditGroupPersonsRequest {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        return Self(personIdsToAdd: it["personIdsToAdd"] as? [String],
                    personIdsToRemove: it["personIdsToRemove"] as? [String])
    }
    func encode() -> [String: Any?] {
        return [
            "personIdsToAdd": self.personIdsToAdd,
            "personIdsToRemove": self.personIdsToRemove,
        ]
    }
}

public extension PersonDatabase.SearchPersonRequest {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let result = Self(
            groupIds: it["groupIdsForSearch"] as? [String],
            imageUpload: PersonDatabase.ImageUpload.decode(it["imageUpload"])!)
        result.threshold = it["threshold"] as? NSNumber
        result.limit = it["limit"] as? NSNumber
        result.tag = it["tag"] as? String
        result.detectAll = it["detectAll"] as? Bool ?? false
        result.outputImageParams = OutputImageParams.decode(it["outputImageParams"])
        return result
    }
    func encode() -> [String: Any?] {
        return [
            "imageUpload": self.imageUpload.encode(),
            "detectAll": self.detectAll,
            "threshold": self.threshold,
            "limit": self.limit,
            "tag": self.tag,
            "groupIdsForSearch": self.groupIdsForSearch,
            "outputImageParams": self.outputImageParams?.encode(),
        ]
    }
}

public extension PersonDatabase.SearchPersonDetection {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [String: Any]
        let alloc = PersonDatabase.SearchPersonDetection.allocate()
        let sel = "initWithRoi:landmarks:crop:rotationAngle:".selector()
        return privateInit(alloc, sel, (@convention(c)(
            Any, Selector,
            CGRect, Any?, Any?, Any?) -> Unmanaged<AnyObject>?).self, { f in f(
                alloc, sel,
                CGRect.decode(it["rect"]),
                (it["landmarks"] as? [Any])?.map { Point.decode($0) },
                UIImage.decode(it["crop"]),
                it["rotationAngle"]
            )})
    }
    func encode() -> [String: Any?] {
        return [
            "landmarks": self.landmarks.compactMap({ $0.encode() }),
            "rect": self.rect.encode(),
            "crop": self.crop?.encode(),
            "rotationAngle": self.rotationAngle,
        ]
    }
}

public extension PersonDatabase.SearchPersonImage {
    static func decode2(_ it: Any?) -> PersonDatabase.SearchPersonImage {
        let it = it as! [String: Any]
        let result = PersonDatabase.SearchPersonImage.emptyInit() as PersonDatabase.SearchPersonImage
        result.setValue(Date.decode(it["createdAt"]), forKey: "createdAt")
        result.setValue(URL.decode(it["url"]), forKey: "url")
        result.setValue(it["id"] as Any?, forKey: "itemId")
        result.setValue(it["path"] as Any?, forKey: "path")
        result.setValue(it["contentType"] as Any?, forKey: "contentType")
        result.setValue(it["metadata"] as Any?, forKey: "metadata")
        result.setValue(it["similarity"] as Any?, forKey: "similarity")
        result.setValue(it["distance"] as Any?, forKey: "distance")
        return result
    }
    func encode2() -> [String: Any?] {
        return [
            "url": self.url.encode(),
            "createdAt": self.createdAt.encode(),
            "similarity": self.similarity,
            "distance": self.distance,
            "path": self.path,
            "contentType": self.contentType,
            "id": self.itemId,
            "metadata": self.metadata,
        ]
    }
}

public extension PersonDatabase.SearchPerson {
    static func decode2(_ it: Any?) -> PersonDatabase.SearchPerson {
        let it = it as! [String: Any]
        let result = PersonDatabase.SearchPerson.emptyInit() as PersonDatabase.SearchPerson
        result.setValue(Date.decode(it["updatedAt"]), forKey: "updatedAt")
        result.setValue(Date.decode(it["createdAt"]), forKey: "createdAt")
        result.setValue(it["name"] as Any?, forKey: "name")
        result.setValue(it["groups"] as Any?, forKey: "groups")
        result.setValue(it["id"] as Any?, forKey: "itemId")
        result.setValue((it["metadata"] as Any?) ?? NSNull(), forKey: "mutableMetadata")
        result.setValue((it["images"] as? [Any])?.map { PersonDatabase.SearchPersonImage.decode2($0) }, forKey: "images")
        result.setValue(PersonDatabase.SearchPersonDetection.decode(it["detection"]), forKey: "detection")
        return result
    }
    func encode2() -> [String: Any?] {
        return [
            "detection": self.detection.encode(),
            "images": self.images.compactMap({ $0.encode2() }),
            "createdAt": self.createdAt.encode(),
            "updatedAt": self.updatedAt.encode(),
            "name": self.name,
            "groups": self.groups,
            "id": self.itemId,
            "metadata": self.metadata,
        ]
    }
}
