## 6.2.487
# 6.2

#### Plugin:

* BREAKING CHANGE: whole FaceSDK plugin rewritten from scratch with focus on user experience and convenience. Migration instructions can be found [here](https://docs.regulaforensics.com/develop/face-sdk/migration-guides/v6.1-to-v6.2/flutter/).

# 3.1.0
### Added
* Added [LivenessResponse.guid](https://dev.regulaforensics.com/FaceSDK-iOS-Docs/Classes/RFSLivenessResponse.html#/c:objc(cs)RFSLivenessResponse(py)guid) – the id of the processing from the liveness service.
* **iOS**
  * Added `RegulaCommon` – the internal shared library for Regula SDK products
* **Android**:
  * Added possibility to intercept network connections between server and client to change HTTP request settings

### Fixed
* **iOS**:
  * Fixed copying of `debug-symbols`. Only correct ones are copied to the `xcframework`.
  * Fixed hold the `image` for `LivenessResponse` even when error happens.

### Changed
* Changed `hint.fit` for Spanish localization to `Coloque su rostro en el óvalo`.
* **iOS**:
  * Changed camera settings to match `DocumentReader`'s. Used settings: `isSmoothAutoFocusEnabled`, `.continuousAutoWhiteBalance` and `.continuousAutoExposure`.
* **Android**:
  * FaceCapture detection logic tweaked for better and easier photo capture

# 3.0.0
Flutter plugin that provides a solution for biometric verification by leveraging the power of Regula Face SDK Web Service. Biometric verification is the quickest and most reliable way to confirm any user’s identity and protect your business and your clients from fraud.

Features included: 
* Face Matching: Check the likelihood that two faces belong to the same person.
* Face Recognition: Automatically capture a photo with a person's face on it.
* Liveness Detection: Find out if the person on camera is alive.
