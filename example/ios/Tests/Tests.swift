import XCTest
import FaceSDK
import flutter_face_api

class Tests: XCTestCase {
    // image_params
    
    func test_point() {
        compare(name: "point", decode: Point.decode, encode: Point.encode)
    }
    
    func test_rect() {
        compare(name: "rect", decode: CGRect.decode, encode: CGRect.encode)
    }
    
    func test_size() {
        compare(name: "size", decode: CGSize.decode, encode: CGSize.encode)
    }
    
    func test_outputImageCrop() {
        compare(name: "outputImageCrop", decode: OutputImageCrop.decode, encode: OutputImageCrop.encode)
    }
    
    func test_outputImageParams() {
        compare(name: "outputImageParams", decode: OutputImageParams.decode, encode: OutputImageParams.encode)
    }
    
    // image_quality
    
    func test_imageQualityRange() {
        compare(name: "imageQualityRange", decode: ImageQualityRange.decode, encode: ImageQualityRange.encode)
    }
    
    func test_imageQualityResult() {
        compare(name: "imageQualityResult", decode: ImageQualityResult.decode, encode: ImageQualityResult.encode)
    }
    
    func test_imageQualityCharacteristic() {
        compare(name: "imageQualityCharacteristic", decode: ImageQualityCharacteristic.decode, encode: ImageQualityCharacteristic.encode)
    }
    
    // init
    
    func test_initConfig() {
        compare(name: "initConfig", decode: InitializationConfiguration.decode, encode: InitializationConfiguration.encode, omit: ["useBleDevice"])
    }
    
    // detect_faces
    
    func test_detectFacesAttributeResult() {
        compare(name: "detectFacesAttributeResult", decode: DetectFacesAttributeResult.decode, encode: DetectFacesAttributeResult.encode)
    }
    
    func test_detectFaceResult() {
        compare(name: "detectFaceResult", decode: DetectFaceResult.decode, encode: DetectFaceResult.encode)
    }
    
    func test_detectFacesConfig() {
        compare(name: "detectFacesConfig", decode: DetectFacesConfiguration.decode, encode: DetectFacesConfiguration.encode)
    }
    
    func test_detectFacesRequest() {
        compare(name: "detectFacesRequest", decode: DetectFacesRequest.decode, encode: DetectFacesRequest.encode)
    }
    
    func test_detectFacesResponse() {
        compare(name: "detectFacesResponse", decode: DetectFacesResponse.decode, encode: DetectFacesResponse.encode, omit: ["error"])
    }
    
    // face_capture
    
    func test_faceCaptureConfig() {
        compare(name: "faceCaptureConfig", decode: FaceCaptureConfiguration.decode, encode: FaceCaptureConfiguration.encode, omit: ["cameraPositionAndroid", "screenOrientation"])
    }
    
    func test_faceCaptureImage() {
        compare(name: "faceCaptureImage", decode: Image.decode, encode: Image.encode)
    }
    
    func test_faceCaptureResponse() {
        compare(name: "faceCaptureResponse", decode: FaceCaptureResponse.decode, encode: FaceCaptureResponse.encode, omit: ["error"])
    }
    
    // liveness
    
    func test_livenessConfig() {
        compare(name: "livenessConfig", decode: LivenessConfiguration.decode, encode: LivenessConfiguration.encode, omit: [
            "cameraPositionAndroid",
            "screenOrientation",
        ])
    }
    
    func test_livenessResponse() {
        compare(name: "livenessResponse", decode: LivenessResponse.decode, encode: LivenessResponse.encode, omit: ["error"])
    }
    
    // match_faces
    
    func test_matchFacesConfig() {
        compare(name: "matchFacesConfig", decode: MatchFacesConfiguration.decode, encode: MatchFacesConfiguration.encode)
    }
    
    func test_matchFacesImage() {
        compare(name: "matchFacesImage", decode: MatchFacesImage.decode, encode: MatchFacesImage.encode)
    }
    
    func test_matchFacesRequest() {
        compare(name: "matchFacesRequest", decode: MatchFacesRequest.decode, encode: MatchFacesRequest.encode)
    }
    
    func test_matchFacesDetectionFace() {
        compare(name: "matchFacesDetectionFace", decode: MatchFacesDetectionFace.decode, encode: MatchFacesDetectionFace.encode)
    }
    
    func test_matchFacesDetection() {
        compare(name: "matchFacesDetection", decode: MatchFacesDetection.decode, encode: MatchFacesDetection.encode, omit: ["error"])
    }
    
    func test_comparedFace() {
        compare(name: "comparedFace", decode: MatchFacesComparedFace.decode, encode: MatchFacesComparedFace.encode)
    }
    
    func test_comparedFacesPair() {
        compare(name: "comparedFacesPair", decode: MatchFacesComparedFacesPair.decode, encode: MatchFacesComparedFacesPair.encode, omit: ["error"])
    }
    
    func test_matchFacesResponse() {
        compare(name: "matchFacesResponse", decode: MatchFacesResponse.decode, encode: MatchFacesResponse.encode, omit: [
            "error",
            "results.error",
            "detections.error",
        ])
    }
    
    // person_database
    
    func test_editGroupPersonsRequest() {
        compare(name: "editGroupPersonsRequest", decode: PersonDatabase.EditGroupPersonsRequest.decode, encode: PersonDatabase.EditGroupPersonsRequest.encode)
    }
    
    func test_imageUpload() {
        compare(name: "imageUpload", decode: PersonDatabase.ImageUpload.decode, encode: PersonDatabase.ImageUpload.encode)
    }
    
    func test_person() {
        compare(name: "person", decode: PersonDatabase.Person.decode, encode: PersonDatabase.Person.encode)
    }
    
    func test_personGroup() {
        compare(name: "personGroup", decode: PersonDatabase.PersonGroup.decode, encode: PersonDatabase.PersonGroup.encode)
    }
    
    func test_personImage() {
        compare(name: "personImage", decode: PersonDatabase.PersonImage.decode, encode: PersonDatabase.PersonImage.encode)
    }
    
    func test_searchPersonDetection() {
        compare(name: "searchPersonDetection", decode: PersonDatabase.SearchPersonDetection.decode, encode: PersonDatabase.SearchPersonDetection.encode)
    }
    
    func test_searchPersonImage() {
        compare(name: "searchPersonImage", decode: PersonDatabase.SearchPersonImage.decode2, encode: PersonDatabase.SearchPersonImage.encode2)
    }
    
    func test_searchPerson() {
        compare(name: "searchPerson", decode: PersonDatabase.SearchPerson.decode2, encode: PersonDatabase.SearchPerson.encode2)
    }
    
    func test_searchPersonRequest() {
        compare(name: "searchPersonRequest", decode: PersonDatabase.SearchPersonRequest.decode, encode: PersonDatabase.SearchPersonRequest.encode)
    }
}
