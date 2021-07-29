import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter_face_api/face_api.dart' as Regula;
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var image1 = new Regula.Image();
  var image2 = new Regula.Image();
  var img1 = Image.asset('assets/images/portrait.png');
  var img2 = Image.asset('assets/images/portrait.png');
  String _similarity = "nil";
  String _liveness = "nil";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {}

  showAlertDialog(BuildContext context, bool first) => showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(title: Text("Select option"), actions: [
            // ignore: deprecated_member_use
            FlatButton(
                child: Text("Use gallery"),
                onPressed: () {
                  ImagePicker().getImage(source: ImageSource.gallery).then(
                      (value) => setImage(
                          first,
                          io.File(value.path).readAsBytesSync(),
                          Regula.ImageType.IMAGE_TYPE_PRINTED));
                  Navigator.pop(context);
                }),
            // ignore: deprecated_member_use
            FlatButton(
                child: Text("Use camera"),
                onPressed: () {
                  Regula.FaceSDK.presentFaceCaptureActivity().then((result) =>
                      setImage(
                          first,
                          base64Decode(Regula.FaceCaptureResponse.fromJson(
                                  json.decode(result))
                              .image
                              .bitmap
                              .replaceAll("\n", "")),
                          Regula.ImageType.IMAGE_TYPE_LIVE));
                  Navigator.pop(context);
                })
          ]));

  setImage(bool first, List<int> imageFile, int type) {
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
    image1 = new Regula.Image();
    image2 = new Regula.Image();
  }

  matchFaces() {
    if (image1 == null ||
        image1.bitmap == null ||
        image1.bitmap == "" ||
        image2 == null ||
        image2.bitmap == null ||
        image2.bitmap == "") return;
    setState(() => _similarity = "Processing...");
    var request = new Regula.MatchFacesRequest();
    request.images = [image1, image2];
    Regula.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
      var response = Regula.MatchFacesResponse.fromJson(json.decode(value));
      var matchedFaces = response.matchedFaces;
      setState(() => _similarity = matchedFaces.length > 0
          ? ((matchedFaces[0].similarity * 100).toStringAsFixed(2) + "%")
          : "error");
    });
  }

  liveness() => Regula.FaceSDK.startLiveness().then((value) {
        var result = Regula.LivenessResponse.fromJson(json.decode(value));
        setImage(true, base64Decode(result.bitmap.replaceAll("\n", "")),
            Regula.ImageType.IMAGE_TYPE_LIVE);
        setState(
            () => _liveness = result.liveness == 0 ? "passed" : "unknown");
      });

  Widget createButton(String text, VoidCallback onPress) => Container(
        // ignore: deprecated_member_use
        child: FlatButton(
            color: Color.fromARGB(50, 10, 10, 10),
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
