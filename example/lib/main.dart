import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:image_picker/image_picker.dart';

var faceSdk = FaceSDK.instance;
MatchFacesImage? image1;
MatchFacesImage? image2;

void init() async {
  if (!await initialize()) return;
  setStatus("Ready");
}

void startFaceCapture(int position) async {
  var image = (await faceSdk.startFaceCapture()).image;
  if (image == null) return;
  setImage(image.image, image.imageType, position);
}

void startLiveness() async {
  var result = await faceSdk.startLiveness(
    config: LivenessConfig(
      skipStep: [LivenessSkipStep.ONBOARDING_STEP],
    ),
    notificationCompletion: (notification) {
      print(notification.status);
    },
  );
  if (result.image == null) return;
  setImage(result.image!, ImageType.LIVE, 1);
  setLivenessStatus(result.liveness.name.toLowerCase());
}

void matchFaces() async {
  if (image1 == null || image2 == null) {
    setStatus("Both images required!");
    return;
  }
  setStatus("Processing...");
  var request = MatchFacesRequest([image1!, image2!]);
  var response = await faceSdk.matchFaces(request);
  var split = await faceSdk.splitComparedFaces(response.results, 0.75);
  var match = split.matchedFaces;
  setSimilarityStatus("failed");
  if (match.isNotEmpty) {
    setSimilarityStatus((match[0].similarity * 100).toStringAsFixed(2) + "%");
  }
  setStatus("Ready");
}

void getImage(int position) async {
  var source = await chooseOption();
  if (source == null) return;
  if (source) {
    startFaceCapture(position);
  } else {
    var image = await pickImage();
    if (image == null) return;
    setImage(image, ImageType.PRINTED, position);
  }
}

void setImage(Uint8List bytes, ImageType type, int number) {
  setSimilarityStatus("null");
  var mfImage = MatchFacesImage(bytes, type);
  if (number == 1) {
    image1 = mfImage;
    uiImage1 = Image.memory(bytes);
    setLivenessStatus("null");
  }
  if (number == 2) {
    image2 = mfImage;
    uiImage2 = Image.memory(bytes);
  }
}

// If 'assets/regula.license' exists, init using license(enables offline match)
// otherwise init without license.
Future<bool> initialize() async {
  setStatus("Initializing...");

  InitConfig? config = null;
  try {
    config = InitConfig(await rootBundle.load("assets/regula.license"));
  } catch (_) {}
  var (success, error) = await faceSdk.initialize(config: config);

  if (error != null) {
    setStatus(error.message);
    print("${error.code}: ${error.message}");
  }
  return success;
}

// --------------------------------------------------------------------------------------------------------------------

var status = "Loading...";
void setStatus(String? s) {
  if (s != null) {
    MyAppState.update(() => status = s);
  }
}

var liveness = "null";
void setLivenessStatus(String? s) {
  if (s != null) {
    MyAppState.update(() => liveness = s);
  }
}

var similarity = "null";
void setSimilarityStatus(String? s) {
  if (s != null) {
    MyAppState.update(() => similarity = s);
  }
}

var uiImage1 = Image.asset('assets/images/portrait.png');
void setUiImage1(Uint8List? data) {
  if (data != null) {
    MyAppState.update(() => uiImage1 = Image.memory(data));
  }
}

var uiImage2 = Image.asset('assets/images/portrait.png');
void setUiImage2(Uint8List? data) {
  if (data != null) {
    MyAppState.update(() => uiImage2 = Image.memory(data));
  }
}

void clearResults() {
  setStatus("Ready");
  setSimilarityStatus("null");
  setLivenessStatus("null");
  MyAppState.update(() {
    uiImage1 = Image.asset('assets/images/portrait.png');
    uiImage2 = Image.asset('assets/images/portrait.png');
  });
  image1 = null;
  image2 = null;
}

List<Widget> customHeader() => [
      header([label(status)]),
      header(top: false, [
        Row(children: [
          Expanded(child: label("Similarity: $similarity", small: true)),
          Expanded(child: label("Liveness: $liveness", small: true))
        ])
      ])
    ];

List<Widget> ui() => [
      Expanded(
        child: Row(children: [
          Expanded(child: image(uiImage1, () => getImage(1))),
          Expanded(child: image(uiImage2, () => getImage(2))),
        ]),
      ),
      Column(children: [
        Row(children: [
          Expanded(child: button("Match", () => matchFaces())),
          Expanded(child: button("Liveness", () => startLiveness())),
        ]),
        Row(children: [
          Expanded(child: button("Clear", () => clearResults())),
        ])
      ]),
    ];

Widget image(Image image, VoidCallback onTap) => Container(
    padding: EdgeInsets.all(5),
    child: GestureDetector(onTap: onTap, child: Image(image: image.image)));

Widget button(String text, VoidCallback onPressed) => Padding(
    padding: EdgeInsets.all(5),
    child: SizedBox(
      height: 40,
      child: FilledButton(onPressed: onPressed, child: Text(text)),
    ));

Widget label(String text, {bool small = false}) => Text(text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: small ? 15 : 18,
      fontWeight: FontWeight.w600,
    ));

Widget header(List<Widget> children, {bool top = true}) => Container(
    padding: EdgeInsets.only(top: top ? 70 : 13),
    color: Colors.black.withValues(alpha: 0.03),
    child: Column(children: [
      ...children,
      Container(
        margin: EdgeInsets.only(top: 13),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromRGBO(0, 0, 0, 0.075),
        ),
      ),
    ]));

// --------------------------------------------------------------------------------------------------------------------

Future<Uint8List?> pickImage() async {
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file == null) return null;
  return await file.readAsBytes();
}

Future<bool?> chooseOption() async {
  return await showDialog(
    context: MyAppState.instance.context,
    builder: (context) => Theme(
      data: ThemeData(colorScheme: MyAppState.theme),
      child: AlertDialog(title: Text("Select option"), actions: [
        TextButton(
          child: Text("Use gallery"),
          onPressed: () => Navigator.pop(context, false),
        ),
        TextButton(
          child: Text("Use camera"),
          onPressed: () => Navigator.pop(context, true),
        )
      ]),
    ),
  );
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    instance = this;

    init();
  }

  @override
  Widget build(_) => MaterialApp(
      theme: ThemeData(colorScheme: theme),
      home: Scaffold(
        body: Column(children: [
          ...customHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ui(),
              ),
            ),
          )
        ]),
      ));

  static final theme = ColorScheme.fromSwatch(accentColor: Color(0xFF4285F4));
  static late MyAppState instance;
  static update(VoidCallback state) => {instance.setState(state)};
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MyAppState();
  }
}

void main() => runApp(new MaterialApp(home: new MyApp()));
