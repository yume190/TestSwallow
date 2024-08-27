// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

func prebuiltTarget(name: String, dependencies: [Target.Dependency] = []) -> [Target] {
    return [
        .binaryTarget(
            name: name,
            path: "../XCFrameworks/\(name).xcframework"
        ),
        .target(
            name: "\(name)_Aggregation",
            dependencies: [
                .target(name: name),
            ] + dependencies
        ),
    ]
}
let targets = [
    prebuiltTarget(name: "Swallow"),
    prebuiltTarget(name: "_PythonString"),
    prebuiltTarget(name: "FoundationXDependency"),
    prebuiltTarget(
        name: "FoundationX",
        dependencies: [
            "Swallow_Aggregation",
            "FoundationXDependency_Aggregation",
        ]
    ),
].flatMap { $0 }

let testTargets: [Target] = [
    .testTarget(
        name: "TempTests",
        dependencies: [
            "Swallow_Aggregation",
            "FoundationX_Aggregation",   
            "_PythonString_Aggregation",
            
            // "FoundationX", 
        ]
    ),
]

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
                "Swallow_Aggregation",
                "FoundationX_Aggregation",
                "_PythonString_Aggregation",
                // "Swallow",
                // "FoundationX",
            ]),
    ],
    targets: targets + testTargets
)
