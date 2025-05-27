import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class _MyAppState extends State<MyApp> {
  var faceSdk = FaceSDK.instance;

  var _status = "nil";
  var _similarityStatus = "nil";
  var _livenessStatus = "nil";
  var _uiImage1 = Image.asset('assets/images/portrait.png');
  var _uiImage2 = Image.asset('assets/images/portrait.png');

  set status(String val) => setState(() => _status = val);
  set similarityStatus(String val) => setState(() => _similarityStatus = val);
  set livenessStatus(String val) => setState(() => _livenessStatus = val);
  set uiImage1(Image val) => setState(() => _uiImage1 = val);
  set uiImage2(Image val) => setState(() => _uiImage2 = val);

  MatchFacesImage? mfImage1;
  MatchFacesImage? mfImage2;

  void init() async {
    super.initState();
    if (!await initialize()) return;
    status = "Ready";
  }

  startLiveness() async {
    var result = await faceSdk.startLiveness(
      config: LivenessConfig(skipStep: [LivenessSkipStep.ONBOARDING_STEP]),
      notificationCompletion: (notification) {
        print(notification.status);
      },
    );
    if (result.image == null) return;
    setImage(result.image!, ImageType.LIVE, 1);
    livenessStatus = result.liveness.name.toLowerCase();
  }

  matchFaces() async {
    if (mfImage1 == null || mfImage2 == null) {
      status = "Both images required!";
      return;
    }
    status = "Processing...";
    var request = MatchFacesRequest([mfImage1!, mfImage2!]);
    var response = await faceSdk.matchFaces(request);
    var split = await faceSdk.splitComparedFaces(response.results, 0.75);
    var match = split.matchedFaces;
    similarityStatus = "failed";
    if (match.isNotEmpty) {
      similarityStatus = (match[0].similarity * 100).toStringAsFixed(2) + "%";
    }
    status = "Ready";
  }

  clearResults() {
    status = "Ready";
    similarityStatus = "nil";
    livenessStatus = "nil";
    uiImage2 = Image.asset('assets/images/portrait.png');
    uiImage1 = Image.asset('assets/images/portrait.png');
    mfImage1 = null;
    mfImage2 = null;
  }

  // If 'assets/regula.license' exists, init using license(enables offline match)
  // otherwise init without license.
  Future<bool> initialize() async {
    status = "Initializing...";
    var license = await loadAssetIfExists("assets/regula.license");
    InitConfig? config = null;
    if (license != null) config = InitConfig(license);
    var (success, error) = await faceSdk.initialize(config: config);
    if (!success) {
      status = error!.message;
      print("${error.code}: ${error.message}");
    }
    return success;
  }

  Future<ByteData?> loadAssetIfExists(String path) async {
    try {
      return await rootBundle.load(path);
    } catch (_) {
      return null;
    }
  }

  setImage(Uint8List bytes, ImageType type, int number) {
    similarityStatus = "nil";
    var mfImage = MatchFacesImage(bytes, type);
    if (number == 1) {
      mfImage1 = mfImage;
      uiImage1 = Image.memory(bytes);
      livenessStatus = "nil";
    }
    if (number == 2) {
      mfImage2 = mfImage;
      uiImage2 = Image.memory(bytes);
    }
  }

  Widget useGallery(int number) {
    return textButton("Use gallery", () async {
      Navigator.pop(context);
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setImage(File(image.path).readAsBytesSync(), ImageType.PRINTED, number);
      }
    });
  }

  Widget useCamera(int number) {
    return textButton("Use camera", () async {
      Navigator.pop(context);
      var response = await faceSdk.startFaceCapture();
      var image = response.image;
      if (image != null) setImage(image.image, image.imageType, number);
    });
  }

  Widget image(Image image, Function() onTap) => GestureDetector(
        onTap: onTap,
        child: Image(height: 150, width: 150, image: image.image),
      );

  Widget button(String text, Function() onPressed) {
    return Container(
      child: textButton(
        text,
        onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.black12),
        ),
      ),
      width: 250,
    );
  }

  Widget text(String text) => Text(text, style: TextStyle(fontSize: 18));
  Widget textButton(String text, Function() onPressed, {ButtonStyle? style}) =>
      TextButton(child: Text(text), onPressed: onPressed, style: style);

  setImageDialog(BuildContext context, int number) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Select option"),
          actions: [useGallery(number), useCamera(number)],
        ),
      );

  @override
  Widget build(BuildContext bc) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(_status))),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(bc).size.height / 8),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image(_uiImage1, () => setImageDialog(bc, 1)),
              image(_uiImage2, () => setImageDialog(bc, 2)),
              SizedBox(height: 15),
              button("Match", () => matchFaces()),
              button("Liveness", () => startLiveness()),
              button("Clear", () => clearResults()),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text("Similarity: " + _similarityStatus),
                  SizedBox(width: 20),
                  text("Liveness: " + _livenessStatus),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    init();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
