// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_face_api",
    platforms: [.iOS("13.0")],
    products: [.library(name: "flutter-face-api", targets: ["flutter_face_api"])],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(
            url: "https://github.com/regulaforensics/FaceSDK-Swift-Package",
            exact: "9.9.4841-nightly"
        ),
    ],
    targets: [
        .target(
            name: "flutter_face_api",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "FaceSDK", package: "FaceSDK-Swift-Package"),
            ]
        ),
    ]
)
