package com.regula.plugin.facesdk

import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(shadows = [MyShadowBitmap::class, MyShadowDrawable::class, MyShadowBitmapDrawable::class])
class FlutterFaceApiPluginTest {
    // image_params

    @Test
    fun point() = compare("point", ::pointFromJSON, ::generatePoint)

    @Test
    fun rect() = compare("rect", ::rectFromJSON, ::generateRect)

    @Test
    fun size() = compare("size", ::sizeFromJSON, ::generateSize)

    @Test
    fun outputImageCrop() = compare("outputImageCrop", ::outputImageCropFromJSON, ::generateOutputImageCrop)

    @Test
    fun outputImageParams() = compare("outputImageParams", ::outputImageParamsFromJSON, ::generateOutputImageParams)

    // image_quality

    @Test
    fun imageQualityRange() = compare("imageQualityRange", ::imageQualityRangeFromJSON, ::generateImageQualityRange)

    @Test
    fun imageQualityResult() = compare("imageQualityResult", ::imageQualityResultFromJSON, ::generateImageQualityResult)

    @Test
    fun imageQualityCharacteristic() = compare("imageQualityCharacteristic", ::imageQualityCharacteristicFromJSON, ::generateImageQualityCharacteristic)

    // init

    @Test
    fun faceSDKVersion() = compare("faceSDKVersion", ::faceSDKVersionFromJSON, ::generateFaceSDKVersion)

    @Test
    fun initConfig() = compare("initConfig", ::initConfigFromJSON, ::generateInitConfig)

    @Test
    fun licenseException() = compare("licenseException", ::licenseExceptionFromJSON, ::generateLicenseException)

    @Test
    fun initException() = compare("initException", ::initExceptionFromJSON, ::generateInitException)

    // detect_faces

    @Test
    fun detectFacesAttributeResult() = compare("detectFacesAttributeResult", ::detectFacesAttributeResultFromJSON, ::generateDetectFacesAttributeResult)

    @Test
    fun detectFaceResult() = compare("detectFaceResult", ::detectFaceResultFromJSON, ::generateDetectFaceResult)

    @Test
    fun detectFacesConfig() = compare("detectFacesConfig", ::detectFacesConfigFromJSON, ::generateDetectFacesConfig)

    @Test
    fun detectFacesRequest() = compare("detectFacesRequest", ::detectFacesRequestFromJSON, ::generateDetectFacesRequest)

    @Test
    fun detectFacesBackendException() = compare("detectFacesBackendException", ::detectFacesBackendExceptionFromJSON, ::generateDetectFacesBackendException)

    @Test
    fun detectFacesException() = compare("detectFacesException", ::detectFacesExceptionFromJSON, ::generateDetectFacesException)

    @Test
    fun detectFacesResponse() = compare("detectFacesResponse", ::detectFacesResponseFromJSON, ::generateDetectFacesResponse)

    // face_capture

    @Test
    fun faceCaptureConfig() = compare("faceCaptureConfig", ::faceCaptureConfigFromJSON, ::generateFaceCaptureConfig, "cameraPositionIOS")

    @Test
    fun faceCaptureImage() = compare("faceCaptureImage", ::faceCaptureImageFromJSON, ::generateFaceCaptureImage)

    @Test
    fun faceCaptureException() = compare("faceCaptureException", ::faceCaptureExceptionFromJSON, ::generateFaceCaptureException)

    @Test
    fun faceCaptureResponse() = compare("faceCaptureResponse", ::faceCaptureResponseFromJSON, ::generateFaceCaptureResponse)

    // liveness

    @Test
    fun livenessConfig() = compare("livenessConfig", ::livenessConfigFromJSON, ::generateLivenessConfig, "cameraPositionIOS")

    @Test
    fun livenessBackendException() = compare("livenessBackendException", ::livenessBackendExceptionFromJSON, ::generateLivenessBackendException)

    @Test
    fun livenessException() = compare("livenessException", ::livenessExceptionFromJSON, ::generateLivenessException)

    @Test
    fun livenessResponse() = compare("livenessResponse", ::livenessResponseFromJSON, ::generateLivenessResponse)

    @Test
    fun livenessNotification() = compare("livenessNotification", ::livenessNotificationFromJSON, ::generateLivenessNotification)

    // match_faces

    @Test
    fun matchFacesConfig() = compare("matchFacesConfig", ::matchFacesConfigFromJSON, ::generateMatchFacesConfig)

    @Test
    fun matchFacesImage() = compare("matchFacesImage", ::matchFacesImageFromJSON, ::generateMatchFacesImage)

    @Test
    fun matchFacesRequest() = compare("matchFacesRequest", ::matchFacesRequestFromJSON, ::generateMatchFacesRequest)

    @Test
    fun matchFacesDetectionFace() = compare("matchFacesDetectionFace", ::matchFacesDetectionFaceFromJSON, ::generateMatchFacesDetectionFace)

    @Test
    fun matchFacesException() = compare("matchFacesException", ::matchFacesExceptionFromJSON, ::generateMatchFacesException)

    @Test
    fun matchFacesDetection() = compare("matchFacesDetection", ::matchFacesDetectionFromJSON, ::generateMatchFacesDetection, "error")

    @Test
    fun comparedFace() = compare("comparedFace", ::comparedFaceFromJSON, ::generateComparedFace)

    @Test
    fun comparedFacesPair() = compare("comparedFacesPair", ::comparedFacesPairFromJSON, ::generateComparedFacesPair, "error")

    @Test
    fun matchFacesResponse() = compare("matchFacesResponse", ::matchFacesResponseFromJSON, ::generateMatchFacesResponse)

    // person_database

    @Test
    fun editGroupPersonsRequest() = compare("editGroupPersonsRequest", ::editGroupPersonsRequestFromJSON, ::generateEditGroupPersonsRequest)

    @Test
    fun imageUpload() = compare("imageUpload", ::imageUploadFromJSON, ::generateImageUpload)

    @Test
    fun person() = compare("person", ::personFromJSON, ::generatePerson)

    @Test
    fun personGroup() = compare("personGroup", ::personGroupFromJSON, ::generatePersonGroup)

    @Test
    fun personImage() = compare("personImage", ::personImageFromJSON, ::generatePersonImage)

    @Test
    fun searchPersonDetection() = compare("searchPersonDetection", ::searchPersonDetectionFromJSON, ::generateSearchPersonDetection)

    @Test
    fun searchPersonImage() = compare("searchPersonImage", ::searchPersonImageFromJSON, ::generateSearchPersonImage)

    @Test
    fun searchPerson() = compare("searchPerson", ::searchPersonFromJSON, ::generateSearchPerson)

    @Test
    fun searchPersonRequest() = compare("searchPersonRequest", ::searchPersonRequestFromJSON, ::generateSearchPersonRequest)
}