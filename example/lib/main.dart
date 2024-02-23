import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_face_api/face_api.dart' hide Image;
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var image1 = new MatchFacesImage();
  var image2 = new MatchFacesImage();
  var img1 = Image.asset('assets/images/portrait.png');
  var img2 = Image.asset('assets/images/portrait.png');
  String _similarity = "nil";
  String _liveness = "nil";

  Future<void> initPlatformState() async {
    var onInitialized = (json) {
      var response = jsonDecode(json);
      if (!response["success"]) {
        print("Init failed: ");
        print(json);
      } else {
        print("Init complete");
      }
    };
    initialize(onInitialized);
  }

  // If 'assets/regula.license' exists, init using license(enables offline match)
  // otherwise init without license.
  Future<void> initialize(onInit(dynamic response)) async {
    var licenseData = await loadAssetIfExists("assets/regula.license");
    if (licenseData != null) {
      var config = InitializationConfiguration();
      config.license = base64Encode(licenseData.buffer.asUint8List());
      FaceSDK.initializeWithConfig(config.toJson()).then(onInit);
    } else
      FaceSDK.initialize().then(onInit);
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    const EventChannel('flutter_face_api/event/video_encoder_completion')
        .receiveBroadcastStream()
        .listen((event) {
      var completion = VideoEncoderCompletion.fromJson(json.decode(event))!;
      print("VideoEncoderCompletion:");
      print("    success:  ${completion.success}");
      print("    transactionId:  ${completion.transactionId}");
    });
    const EventChannel('flutter_face_api/event/onCustomButtonTappedEvent')
        .receiveBroadcastStream()
        .listen((event) {
      print("Pressed button with id: $event");
    });
    const EventChannel('flutter_face_api/event/livenessNotification')
        .receiveBroadcastStream()
        .listen((event) {
      var notification = LivenessNotification.fromJson(json.decode(event));
      print("LivenessProcessStatus: ${notification!.status}");
    });
  }

  showAlertDialog(BuildContext context, bool first) => showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(title: Text("Select option"), actions: [
            TextButton(
                child: Text("Use gallery"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  ImagePicker().pickImage(source: ImageSource.gallery).then(
                      (value) => {
                            setImage(
                                first,
                                io.File(value!.path).readAsBytesSync(),
                                ImageType.PRINTED)
                          });
                }),
            TextButton(
                child: Text("Use camera"),
                onPressed: () {
                  FaceSDK.presentFaceCaptureActivity().then((result) {
                    var response =
                        FaceCaptureResponse.fromJson(json.decode(result))!;
                    if (response.image != null &&
                        response.image!.bitmap != null)
                      setImage(
                          first,
                          base64Decode(
                              response.image!.bitmap!.replaceAll("\n", "")),
                          ImageType.LIVE);
                  });
                  Navigator.pop(context);
                })
          ]));

  setImage(bool first, Uint8List? imageFile, int type) {
    if (imageFile == null) return;
    setState(() => _similarity = "nil");
    if (first) {
      image1.bitmap = base64Encode(imageFile);
      image1.imageType = type;
      setState(() {
        img1 = Image.memory(imageFile);
        _liveness = "nil";
      });
    } else {
      image2.bitmap = base64Encode(imageFile);
      image2.imageType = type;
      setState(() => img2 = Image.memory(imageFile));
    }
  }

  clearResults() {
    setState(() {
      img1 = Image.asset('assets/images/portrait.png');
      img2 = Image.asset('assets/images/portrait.png');
      _similarity = "nil";
      _liveness = "nil";
    });
    image1 = new MatchFacesImage();
    image2 = new MatchFacesImage();
  }

  matchFaces() {
    if (image1.bitmap == null ||
        image1.bitmap == "" ||
        image2.bitmap == null ||
        image2.bitmap == "") return;
    setState(() => _similarity = "Processing...");
    var request = new MatchFacesRequest();
    request.images = [image1, image2];
    FaceSDK.matchFaces(jsonEncode(request)).then((value) {
      var response = MatchFacesResponse.fromJson(json.decode(value));
      FaceSDK.matchFacesSimilarityThresholdSplit(
              jsonEncode(response!.results), 0.75)
          .then((str) {
        var split =
            MatchFacesSimilarityThresholdSplit.fromJson(json.decode(str));
        setState(() => _similarity = split!.matchedFaces.length > 0
            ? ((split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2) +
                "%")
            : "error");
      });
    });
  }

  liveness() => FaceSDK.startLiveness().then((value) {
        var result = LivenessResponse.fromJson(json.decode(value));
        if (result!.bitmap == null) return;
        setImage(true, base64Decode(result.bitmap!.replaceAll("\n", "")),
            ImageType.LIVE);
        setState(() => _liveness =
            result.liveness == LivenessStatus.PASSED ? "passed" : "unknown");
      });

  Future<ByteData?> loadAssetIfExists(String path) async {
    try {
      return await rootBundle.load(path);
    } catch (_) {
      return null;
    }
  }

  Widget createButton(String text, VoidCallback onPress) => Container(
        child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
            ),
            onPressed: onPress,
            child: Text(text)),
        width: 250,
      );

  Widget createImage(image, VoidCallback onPress) => Material(
          child: InkWell(
        onTap: onPress,
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(height: 150, width: 150, image: image),
          ),
        ),
      ));

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  createImage(img1.image, () => showAlertDialog(context, true)),
                  createImage(
                      img2.image, () => showAlertDialog(context, false)),
                  Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  createButton("Match", () => matchFaces()),
                  createButton("Liveness", () => liveness()),
                  createButton("Clear", () => clearResults()),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Similarity: " + _similarity,
                              style: TextStyle(fontSize: 18)),
                          Container(margin: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                          Text("Liveness: " + _liveness,
                              style: TextStyle(fontSize: 18))
                        ],
                      ))
                ])),
      );
}
