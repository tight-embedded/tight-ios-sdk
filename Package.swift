// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Hurdlr",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Hurdlr",
            targets: ["HurdlrWrapperTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bugsnag/bugsnag-cocoa.git", exact: "6.30.1"),
    ],
    targets: [
        .binaryTarget(
            name: "Hurdlr",
            path: "Hurdlr.xcframework"
        ),
        .target(
            name: "HurdlrWrapperTarget",
            dependencies: [
                .target(name: "Hurdlr"),
                .product(name: "Bugsnag", package: "bugsnag-cocoa")
            ],
            path: "HurdlrWrapperTarget"
        )
    ]
)
