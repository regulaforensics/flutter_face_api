var useOldXcode = true;

var img1 = useOldXcode
    ? "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAADElEQVQIHWP4//8/AAX+Av6fyi0TAAAAAElFTkSuQmCC"
    : "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAIRlWElmTU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAAGgAwAEAAAAAQAAAAEAAAAAChjw/QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAxJREFUCB1j+P//PwAF/gL+n8otEwAAAABJRU5ErkJggg==";
var img2 = useOldXcode
    ? "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII="
    : "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAIRlWElmTU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAAGgAwAEAAAAAQAAAAEAAAAAChjw/QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAtJREFUCB1jYAACAAAFAAGNu5vzAAAAAElFTkSuQmCC";
var img3 = useOldXcode
    ? "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAAD5Ip3+AAAADUlEQVQIHWP4z8BQDwAEgAF/OENMJgAAAABJRU5ErkJggg=="
    : "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAIRlWElmTU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAAGgAwAEAAAAAQAAAAEAAAAAChjw/QAAAAlwSFlzAAALEwAACxMBAJqcGAAAAA1JREFUCB1j+M/AUA8ABIABfzhDTCYAAAAASUVORK5CYII=";

var customJson = {"test1": true, "test2": 1, "test3": "test"};

var font1 = {"name": "AppleSDGothicNeo-Thin", "size": 10, "style": 2};
var font2 = {"name": "Copperplate-Light", "size": 20, "style": 1};
var customizationColors = {
  "100": 0xff000000,
  "101": 0xff000001,
  "102": 0xff000002,
  "103": 0xff000003,
  "104": 0xff000004,
  "105": 0xff000005,
  "200": 0xff000006,
  "201": 0xff000007,
  "202": 0xff000008,
  "203": 0xff000009,
  "204": 0xff000010,
  "205": 0xff000011,
  "206": 0xff000012,
  "207": 0xff000013,
  "208": 0xff000014,
  "209": 0xff000015,
  "300": 0xff000016,
  "301": 0xff000017,
  "302": 0xff000018,
  "303": 0xff000019,
  "304": 0xff000020,
  "305": 0xff000021,
  "400": 0xff000022,
  "401": 0xff000023,
  "402": 0xff000024,
  "500": 0xff000025,
};
var customizationFonts = {
  "100": font1,
  "101": font2,
  "102": font1,
  "103": font2,
  "200": font1,
  "300": font2,
  "301": font1,
  "302": font2,
  "303": font1,
  "400": font2,
};
var customizationImages = {
  "100": img1,
  "101": img2,
  "102": img3,
  "103": img1,
  "200": img2,
  "201": img3,
  "202": img1,
  "203": img2,
  "300": img3,
  "301": img1,
  "302": img2,
  "400": img3,
  "500": img1,
};
var customization = {
  "colors": customizationColors,
  "fonts": customizationFonts,
  "images": customizationImages,
  "uiCustomizationLayer": customJson
};

var point = {
  "x": 0,
  "y": 1,
};
var rect = {
  "left": 0,
  "top": 1,
  "right": 2,
  "bottom": 3,
};
var size = {
  "width": 68,
  "height": 91,
};
var outputImageCrop = {
  "type": 0,
  "size": size,
  "padColor": 0xff000000,
  "returnOriginalRect": true
};
var outputImageParams = {
  "crop": outputImageCrop,
  "backgroundColor": 0xff000000,
};

var imageQualityRange = {
  "min": 0.45,
  "max": 0.55,
};
var imageQualityResult = {
  "group": 1,
  "name": "ImageWidth",
  "status": 0,
  "value": 0.5,
  "range": imageQualityRange,
};
var imageQualityCharacteristic = {
  "characteristicName": "FaceMidPointHorizontalPosition",
  "recommendedRange": imageQualityRange,
};

var detectFacesAttributeResult = {
  "attribute": "Age",
  "confidence": 0.5,
  "value": "test",
  "range": imageQualityRange,
};
var detectFaceResult = {
  "quality": [imageQualityResult, imageQualityResult, imageQualityResult],
  "crop": img1,
  "attributes": [
    detectFacesAttributeResult,
    detectFacesAttributeResult,
    detectFacesAttributeResult
  ],
  "landmarks": [point, point, point],
  "faceRect": rect,
  "originalRect": rect,
  "isQualityCompliant": false,
};
var detectFacesConfig = {
  "attributes": ["Age", "EyeRight", "EyeLeft"],
  "customQuality": [
    imageQualityCharacteristic,
    imageQualityCharacteristic,
    imageQualityCharacteristic
  ],
  "outputImageParams": outputImageParams,
  "onlyCentralFace": true,
};
var detectFacesRequest = {
  "tag": "test",
  // "scenario": "CropCentralFace",
  "image": img1,
  "configuration": detectFacesConfig,
};
var detectFacesBackendException = {
  "code": 2,
  "message": "test",
};
var detectFacesException = {
  "code": 0,
  "message": "In process already.",
  "underlyingError": detectFacesBackendException
};
var detectFacesResponse = {
  "detection": detectFaceResult,
  "allDetections": [detectFaceResult, detectFaceResult, detectFaceResult],
  "scenario": "CropCentralFace",
  "error": detectFacesException,
};

var faceCaptureConfig = {
  "copyright": true,
  "cameraSwitchEnabled": false,
  "closeButtonEnabled": true,
  "torchButtonEnabled": false,
  "vibrateOnSteps": true,
  "cameraPositionAndroid": 0,
  "cameraPositionIOS": 1,
  "screenOrientation": [0, 1],
  "timeout": 0.5,
  "holdStillDuration": 1.5,
};
var faceCaptureImage = {
  "image": img1,
  "imageType": 1,
  "tag": "test",
};
var faceCaptureException = {
  "code": 0,
  "message": "Cancelled by user.",
};
var faceCaptureResponse = {
  "image": faceCaptureImage,
  "error": faceCaptureException,
};

var faceSDKVersion = {
  "api": "test1",
  "core": "test2",
  "coreMode": "test3",
};
var initConfig = {
  "license": img1,
  "licenseUpdate": true,
};
var licenseException = {
  "code": 0,
  "message": "",
};
var initException = {
  "code": 0,
  "message": "In process already.",
  "underlyingError": licenseException
};

var livenessConfig = {
  "copyright": true,
  "cameraSwitchEnabled": false,
  "closeButtonEnabled": true,
  "torchButtonEnabled": false,
  "vibrateOnSteps": true,
  "cameraPositionAndroid": -1,
  "cameraPositionIOS": 1,
  "screenOrientation": [0, 1],
  "locationTrackingEnabled": true,
  "attemptsCount": 2,
  "recordingProcess": 0,
  "livenessType": 1,
  "tag": "test",
  "skipStep": [0, 1],
  "metadata": customJson,
};
var livenessBackendException = {
  "code": 200,
  "message": "No license",
};
var livenessException = {
  "code": 0,
  "message": "FaceSDK Core is not initialized",
  "underlyingError": livenessBackendException
};
var livenessResponse = {
  "image": img1,
  "liveness": 0,
  "tag": "test",
  "transactionId": "test1",
  "estimatedAge": 1,
  "error": livenessException,
};
var livenessNotification = {
  "status": 0,
  "response": livenessResponse,
};

var matchFacesConfig = {
  "processingMode": 0,
};
var matchFacesImage = {
  "image": img1,
  "imageType": 1,
  "detectAll": true,
  "identifier": "test"
};
var matchFacesRequest = {
  "images": [matchFacesImage, matchFacesImage, matchFacesImage],
  "outputImageParams": outputImageParams,
  "tag": "test",
  "metadata": customJson,
};
var matchFacesDetectionFace = {
  "faceIndex": 0,
  "landmarks": [point, point, point],
  "faceRect": rect,
  "rotationAngle": 0.5,
  "originalRect": rect,
  "crop": img1,
};
var matchFacesBackendException = {"code": 0, "message": "Image is empty."};
var matchFacesException = {
  "code": 0,
  "message": "Image is empty.",
  "underlyingError": matchFacesBackendException,
};
var matchFacesDetection = {
  "imageIndex": 0,
  "image": matchFacesImage,
  "faces": [
    matchFacesDetectionFace,
    matchFacesDetectionFace,
    matchFacesDetectionFace
  ],
  "error": matchFacesException,
};
var comparedFace = {
  "imageIndex": 0,
  "image": matchFacesImage,
  "faceIndex": 1,
  "face": matchFacesDetectionFace,
};
var comparedFacesPair = {
  "first": comparedFace,
  "second": comparedFace,
  "similarity": 0.5,
  "score": 1.5,
  "error": matchFacesException,
};
var matchFacesResponse = {
  "results": [comparedFacesPair, comparedFacesPair, comparedFacesPair],
  "detections": [matchFacesDetection, matchFacesDetection, matchFacesDetection],
  "tag": "test",
  "error": matchFacesException,
};
var comparedFacesSplit = {
  "matchedFaces": [comparedFacesPair, comparedFacesPair, comparedFacesPair],
  "unmatchedFaces": [comparedFacesPair, comparedFacesPair, comparedFacesPair],
};

var editGroupPersonsRequest = {
  "personIdsToAdd": ["test1", "test2", "test3"],
  "personIdsToRemove": ["test4", "test5", "test6"],
};
var imageUpload = {"imageData": img1};
var person = {
  "name": "test1",
  "updatedAt": "1969-07-20 20:18:04.000",
  "groups": ["test1", "test2", "test3"],
  "id": "test3",
  "metadata": customJson,
  "createdAt": "1969-07-20 20:18:05.000",
};
var personGroup = {
  "name": "test1",
  "id": "test3",
  "metadata": customJson,
  "createdAt": "1969-07-20 20:18:04.000",
};
var personImage = {
  "path": "test",
  "url": "test1",
  "contentType": "test2",
  "id": "test3",
  "metadata": customJson,
  "createdAt": "1969-07-20 20:18:04.000",
};
var searchPersonDetection = {
  "landmarks": [point, point, point],
  "rect": rect,
  "crop": img1,
  "rotationAngle": 0.5,
};
var searchPersonImage = {
  "similarity": 0.5,
  "distance": 1.5,
  "path": "test",
  "url": "test1",
  "contentType": "test2",
  "id": "test3",
  "metadata": customJson,
  "createdAt": "1969-07-20 20:18:04.000",
};
var searchPerson = {
  "images": [searchPersonImage, searchPersonImage, searchPersonImage],
  "detection": searchPersonDetection,
  "name": "test1",
  "updatedAt": "1969-07-20 20:18:04.000",
  "groups": ["test1", "test2", "test3"],
  "id": "test3",
  "metadata": customJson,
  "createdAt": "1969-07-20 20:18:05.000",
};
var searchPersonRequest = {
  "imageUpload": imageUpload,
  "groupIdsForSearch": ["test1", "test2", "test3"],
  "threshold": 0.5,
  "limit": 1,
  "detectAll": true,
  "outputImageParams": outputImageParams,
};
