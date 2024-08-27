// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HurdlrSDK",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HurdlrSDK",
            targets: ["HurdlrSDK"]),
    ],
    targets: [
        //note: this is for a local binary target. Once hosted, binary targets must be pointed to by url with a valid checksum.
        // see https://developer.apple.com/documentation/xcode/creating-a-standalone-swift-package-with-xcode for more info
        .binaryTarget(
            name: "HurdlrSDK",
            path: "HurdlrSDK.xcframework"
        )
    ]
)
