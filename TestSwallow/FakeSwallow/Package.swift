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

                "CTarget",
                // "CppTarget",
                "ObjcTarget",
                "ObjcppTarget",
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

        // POC Part
        .target(name: "LonelyTarget"),
        .target(name: "CTarget"),
        // .target(name: "CppTarget"),
        .target(name: "ObjcTarget"),
        .target(name: "ObjcppTarget"),

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
