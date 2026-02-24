import XCTest
import FaceSDK
import flutter_face_api

class Tests: XCTestCase {
    // image_params
    
    func test_point() {
        compare("point", Point.decode, Point.encode)
    }
    
    func test_rect() {
        compare("rect", CGRect.decode, CGRect.encode)
    }
    
    func test_size() {
        compare("size", CGSize.decode, CGSize.encode)
    }
    
    func test_outputImageCrop() {
        compare("outputImageCrop", OutputImageCrop.decode, OutputImageCrop.encode)
    }
    
    func test_outputImageParams() {
        compare("outputImageParams", OutputImageParams.decode, OutputImageParams.encode)
    }
    
    // image_quality
    
    func test_imageQualityRange() {
        compare("imageQualityRange", ImageQualityRange.decode, ImageQualityRange.encode)
    }
    
    func test_imageQualityResult() {
        compare("imageQualityResult", ImageQualityResult.decode, ImageQualityResult.encode)
    }
    
    func test_imageQualityCharacteristic() {
        compare("imageQualityCharacteristic", ImageQualityCharacteristic.decode, ImageQualityCharacteristic.encode)
    }
    
    // init
    
    func test_initConfig() {
        compare("initConfig", InitializationConfiguration.decode, InitializationConfiguration.encode, omit: ["useBleDevice"])
    }
    
    // detect_faces
    
    func test_detectFacesAttributeResult() {
        compare("detectFacesAttributeResult", DetectFacesAttributeResult.decode, DetectFacesAttributeResult.encode)
    }
    
    func test_detectFaceResult() {
        compare("detectFaceResult", DetectFaceResult.decode, DetectFaceResult.encode)
    }
    
    func test_detectFacesConfig() {
        compare("detectFacesConfig", DetectFacesConfiguration.decode, DetectFacesConfiguration.encode)
    }
    
    func test_detectFacesRequest() {
        compare("detectFacesRequest", DetectFacesRequest.decode, DetectFacesRequest.encode)
    }
    
    func test_detectFacesResponse() {
        compare("detectFacesResponse", DetectFacesResponse.decode, DetectFacesResponse.encode, omit: ["error"])
    }
    
    // face_capture
    
    func test_faceCaptureConfig() {
        compare("faceCaptureConfig", FaceCaptureConfiguration.decode, FaceCaptureConfiguration.encode, omit: ["cameraPositionAndroid", "screenOrientation"])
    }
    
    func test_faceCaptureImage() {
        compare("faceCaptureImage", Image.decode, Image.encode)
    }
    
    func test_faceCaptureResponse() {
        compare("faceCaptureResponse", FaceCaptureResponse.decode, FaceCaptureResponse.encode, omit: ["error"])
    }
    
    // liveness
    
    func test_livenessConfig() {
        compare("livenessConfig", LivenessConfiguration.decode, LivenessConfiguration.encode, omit: [
            "cameraPositionAndroid",
            "screenOrientation",
        ])
    }
    
    func test_livenessResponse() {
        compare("livenessResponse", LivenessResponse.decode, LivenessResponse.encode, omit: ["error"])
    }
    
    // match_faces
    
    func test_matchFacesConfig() {
        compare("matchFacesConfig", MatchFacesConfiguration.decode, MatchFacesConfiguration.encode)
    }
    
    func test_matchFacesImage() {
        compare("matchFacesImage", MatchFacesImage.decode, MatchFacesImage.encode)
    }
    
    func test_matchFacesRequest() {
        compare("matchFacesRequest", MatchFacesRequest.decode, MatchFacesRequest.encode)
    }
    
    func test_matchFacesDetectionFace() {
        compare("matchFacesDetectionFace", MatchFacesDetectionFace.decode, MatchFacesDetectionFace.encode)
    }
    
    func test_matchFacesDetection() {
        compare("matchFacesDetection", MatchFacesDetection.decode, MatchFacesDetection.encode, omit: ["error"])
    }
    
    func test_comparedFace() {
        compare("comparedFace", MatchFacesComparedFace.decode, MatchFacesComparedFace.encode)
    }
    
    func test_comparedFacesPair() {
        compare("comparedFacesPair", MatchFacesComparedFacesPair.decode, MatchFacesComparedFacesPair.encode, omit: ["error"])
    }
    
    func test_matchFacesResponse() {
        compare("matchFacesResponse", MatchFacesResponse.decode, MatchFacesResponse.encode, omit: [
            "error",
            "results.error",
            "detections.error",
        ])
    }
    
    // person_database
    
    func test_editGroupPersonsRequest() {
        compare("editGroupPersonsRequest", PersonDatabase.EditGroupPersonsRequest.decode, PersonDatabase.EditGroupPersonsRequest.encode)
    }
    
    func test_imageUpload() {
        compare("imageUpload", PersonDatabase.ImageUpload.decode, PersonDatabase.ImageUpload.encode)
    }
    
    func test_person() {
        compare("person", PersonDatabase.Person.decode, PersonDatabase.Person.encode)
    }
    
    func test_personGroup() {
        compare("personGroup", PersonDatabase.PersonGroup.decode, PersonDatabase.PersonGroup.encode)
    }
    
    func test_personImage() {
        compare("personImage", PersonDatabase.PersonImage.decode, PersonDatabase.PersonImage.encode)
    }
    
    func test_searchPersonDetection() {
        compare("searchPersonDetection", PersonDatabase.SearchPersonDetection.decode, PersonDatabase.SearchPersonDetection.encode)
    }
    
    func test_searchPersonImage() {
        compare("searchPersonImage", PersonDatabase.SearchPersonImage.decode2, PersonDatabase.SearchPersonImage.encode2)
    }
    
    func test_searchPerson() {
        compare("searchPerson", PersonDatabase.SearchPerson.decode2, PersonDatabase.SearchPerson.encode2)
    }
    
    func test_searchPersonRequest() {
        compare("searchPersonRequest", PersonDatabase.SearchPersonRequest.decode, PersonDatabase.SearchPersonRequest.encode)
    }
}
