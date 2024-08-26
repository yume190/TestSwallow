// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FakeSwallow",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        // .tvOS(.v13),
        // .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FakeSwallow",
            targets: [
                // "Swallow_Aggregation",
                // "FoundationX_Aggregation",
                "Swallow",
                "FoundationX",
            ]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.        
        .binaryTarget(
            name: "Swallow",
            path: "../XCFrameworks/Swallow.xcframework"
        ),
        .target(
            name: "Swallow_Aggregation",
            dependencies: [
                "Swallow",
            ]
        ),
        .binaryTarget(
             name: "FoundationX",
             path: "../XCFrameworks/FoundationX.xcframework"
        ),
        .target(
             name: "FoundationX_Aggregation",
             dependencies: [
                 "FoundationX",
                 "Swallow_Aggregation",
             ]
        ),
 
        .testTarget(
            name: "TempTests",
            dependencies: [
                "Swallow_Aggregation",
                "FoundationX_Aggregation",

                // "FoundationX",
                // "Swallow",
            ]
        ),
        
    ]
)
