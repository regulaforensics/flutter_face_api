# How to build the demo application

1. Download or the clone current repository using the command `git clone https://github.com/regulaforensics/flutter_face_api.git.git`.
2. Execute `flutter pub get` within this directory.
3. Run the app: `flutter run`.

# How to use offline match
1. Place a license that supports offline match at `assets/regula.license`.
2. Change core with the following commands:
```bash
flutter pub remove flutter_face_core_basic
flutter pub add flutter_face_core_match
```
3. Turn off the internet and run the app.
