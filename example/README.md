# How to build the demo application

1. Download or the clone current repository using the command `git clone https://github.com/regulaforensics/flutter_face_api.git.git`.
2. Run the following commands in Terminal:
```bash
$ cd example
# Install packages
$ flutter pub get
# Check that supported devices are running
$ flutter devices
# Run the app
$ flutter run
```

# How to use offine match
1. Place a license that supports offline match at `assets/regula.license`.
2. Change android and iOS bundle id if required by your license. You can do it either manually or using a utility `rename`. Install it with `flutter pub global activate rename` and run the following commands(replace `ANDROID_ID` and `IOS_ID` with actual ids):
```bash
rename setBundleId --targets android --value "ANDROID_ID"
rename setBundleId --targets ios --value "IOS_ID"
```
3. Change core with the following commands:
```bash
flutter pub remove flutter_face_core_basic
flutter pub add flutter_face_core_match
```
4. Turn off the internet and run the app.
