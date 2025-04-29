import XCTest
import FaceSDK
import flutter_face_api

class Tests: XCTestCase {
    // image_params
    
    func test_point() {
        compare(name: "point", fromJson: RFSWJSONConstructor.point, generate: RFSWJSONConstructor.generate)
    }
    
    func test_rect() {
        compare(name: "rect", fromJson: RFSWJSONConstructor.rect, generate: RFSWJSONConstructor.generate)
    }
    
    func test_size() {
        compare(name: "size", fromJson: RFSWJSONConstructor.size, generate: RFSWJSONConstructor.generate)
    }
    
    func test_outputImageCrop() {
        compare(name: "outputImageCrop", fromJson: RFSWJSONConstructor.outputImageCrop, generate: RFSWJSONConstructor.generate)
    }
    
    func test_outputImageParams() {
        compare(name: "outputImageParams", fromJson: RFSWJSONConstructor.outputImageParams, generate: RFSWJSONConstructor.generate)
    }
    
    // image_quality
    
    func test_imageQualityRange() {
        compare(name: "imageQualityRange", fromJson: RFSWJSONConstructor.imageQualityRange, generate: RFSWJSONConstructor.generate)
    }
    
    func test_imageQualityResult() {
        compare(name: "imageQualityResult", fromJson: RFSWJSONConstructor.imageQualityResult, generate: RFSWJSONConstructor.generate)
    }
    
    func test_imageQualityCharacteristic() {
        compare(name: "imageQualityCharacteristic", fromJson: RFSWJSONConstructor.imageQualityCharacteristic, generate: RFSWJSONConstructor.generate)
    }
    
    // init
    
    func test_faceSDKVersion() {
        compare(name: "faceSDKVersion", fromJson: RFSWJSONConstructor.faceSDKVersion, generate: RFSWJSONConstructor.generate)
    }
    
    func test_initConfig() {
        compare(name: "initConfig", fromJson: RFSWJSONConstructor.initConfig, generate: RFSWJSONConstructor.generateInitConfig, omit: ["useBleDevice"])
    }
    
    // detect_faces
    
    func test_detectFacesAttributeResult() {
        compare(name: "detectFacesAttributeResult", fromJson: RFSWJSONConstructor.detectFacesAttributeResult, generate: RFSWJSONConstructor.generate)
    }
    
    func test_detectFaceResult() {
        compare(name: "detectFaceResult", fromJson: RFSWJSONConstructor.detectFaceResult, generate: RFSWJSONConstructor.generate)
    }
    
    func test_detectFacesConfig() {
        compare(name: "detectFacesConfig", fromJson: RFSWJSONConstructor.detectFacesConfig, generate: RFSWJSONConstructor.generateDetectFacesConfig)
    }
    
    func test_detectFacesRequest() {
        compare(name: "detectFacesRequest", fromJson: RFSWJSONConstructor.detectFacesRequest, generate: RFSWJSONConstructor.generate)
    }
    
    func test_detectFacesResponse() {
        compare(name: "detectFacesResponse", fromJson: RFSWJSONConstructor.detectFacesResponse, generate: RFSWJSONConstructor.generate, omit: ["error"])
    }
    
    // face_capture
    
    func test_faceCaptureConfig() {
        compare(name: "faceCaptureConfig", fromJson: RFSWConfig.faceCapture, generate: RFSWConfig.generateFaceCapture, omit: ["cameraPositionAndroid", "screenOrientation"])
    }
    
    func test_faceCaptureImage() {
        compare(name: "faceCaptureImage", fromJson: RFSWJSONConstructor.faceCaptureImage, generate: RFSWJSONConstructor.generateFaceCapture)
    }
    
    func test_faceCaptureResponse() {
        compare(name: "faceCaptureResponse", fromJson: RFSWJSONConstructor.faceCaptureResponse, generate: RFSWJSONConstructor.generate, omit: ["error"])
    }
    
    // liveness
    
    func test_livenessConfig() {
        compare(name: "livenessConfig", fromJson: RFSWConfig.livenessConfig, generate: RFSWConfig.generateLivenessConfig, omit: ["cameraPositionAndroid",
                                                                                                                                 "screenOrientation"])
    }
    
    func test_livenessResponse() {
        compare(name: "livenessResponse", fromJson: RFSWJSONConstructor.livenessResponse, generate: RFSWJSONConstructor.generate, omit: ["error"])
    }
    
    // match_faces
    
    func test_matchFacesConfig() {
        compare(name: "matchFacesConfig", fromJson: RFSWConfig.matchFacesConfig, generate: RFSWConfig.generateMatchFacesConfig)
    }
    
    func test_matchFacesImage() {
        compare(name: "matchFacesImage", fromJson: RFSWJSONConstructor.matchFacesImage, generate: RFSWJSONConstructor.generate)
    }
    
    func test_matchFacesRequest() {
        compare(name: "matchFacesRequest", fromJson: RFSWJSONConstructor.matchFacesRequest, generate: RFSWJSONConstructor.generate)
    }
    
    func test_matchFacesDetectionFace() {
        compare(name: "matchFacesDetectionFace", fromJson: RFSWJSONConstructor.matchFacesDetectionFace, generate: RFSWJSONConstructor.generate)
    }
    
    func test_matchFacesDetection() {
        compare(name: "matchFacesDetection", fromJson: RFSWJSONConstructor.matchFacesDetection, generate: RFSWJSONConstructor.generate, omit: ["error"])
    }
    
    func test_comparedFace() {
        compare(name: "comparedFace", fromJson: RFSWJSONConstructor.comparedFace, generate: RFSWJSONConstructor.generate)
    }
    
    func test_comparedFacesPair() {
        compare(name: "comparedFacesPair", fromJson: RFSWJSONConstructor.comparedFacesPair, generate: RFSWJSONConstructor.generate, omit: ["error"])
    }
    
    func test_matchFacesResponse() {
        compare(name: "matchFacesResponse", fromJson: RFSWJSONConstructor.matchFacesResponse, generate: RFSWJSONConstructor.generate, omit: ["error",
                                                                                                                                             "results.error",
                                                                                                                                             "detections.error"])
    }
    
    // person_database
    
    func test_editGroupPersonsRequest() {
        compare(name: "editGroupPersonsRequest", fromJson: RFSWJSONConstructor.editGroupPersonsRequest, generate: RFSWJSONConstructor.generate)
    }
    
    func test_imageUpload() {
        compare(name: "imageUpload", fromJson: RFSWJSONConstructor.imageUpload, generate: RFSWJSONConstructor.generate)
    }
    
    func test_person() {
        compare(name: "person", fromJson: RFSWJSONConstructor.person, generate: RFSWJSONConstructor.generate)
    }
    
    func test_personGroup() {
        compare(name: "personGroup", fromJson: RFSWJSONConstructor.personGroup, generate: RFSWJSONConstructor.generate)
    }
    
    func test_personImage() {
        compare(name: "personImage", fromJson: RFSWJSONConstructor.personImage, generate: RFSWJSONConstructor.generate)
    }
    
    func test_searchPersonDetection() {
        compare(name: "searchPersonDetection", fromJson: RFSWJSONConstructor.searchPersonDetection, generate: RFSWJSONConstructor.generate)
    }
    
    func test_searchPersonImage() {
        compare(name: "searchPersonImage", fromJson: RFSWJSONConstructor.searchPersonImage, generate: RFSWJSONConstructor.generate)
    }
    
    func test_searchPerson() {
        compare(name: "searchPerson", fromJson: RFSWJSONConstructor.searchPerson, generate: RFSWJSONConstructor.generate)
    }
    
    func test_searchPersonRequest() {
        compare(name: "searchPersonRequest", fromJson: RFSWJSONConstructor.searchPersonRequest, generate: RFSWJSONConstructor.generate)
    }
}
