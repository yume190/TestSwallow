// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FakeSwallow",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FakeSwallow",
            targets: [
                "Swallow",
                "FoundationX",
                "_PythonString",
            ]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Swallow"
        ),

        .target(
            name: "_PythonString"
        ),

        .target(
            name: "FoundationXDependency"
        ),

        .target(
            name: "FoundationX",
            dependencies: [
                "Swallow",
                "FoundationXDependency",
            ]
        ),

        .testTarget(
            name: "TempTests",
            dependencies: [
                "FoundationX",
                "Swallow",
                "_PythonString",
            ]
        ),
    ]
)
