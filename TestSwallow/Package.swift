// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

var package = Package(
    name: "TestSwallow",
    platforms: [
        // .iOS(.v13),
        .macOS(.v11),
        // .tvOS(.v13),
        // .watchOS(.v6)
    ],
    dependencies: [
//        .package(
//            url: "https://github.com/vmanot/Swallow",
//            revision: "97e1a308056eeae280d1a58179769ffe275952d2"
//        ),
        .package(path: "FakeSwallow"),
        // .package(name: "FakeSwallow", path: "FakeSwallowPrebuilt"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "TestSwallow",
            dependencies: [
                // .product(name: "Swallow", package: "Swallow"),
                .product(name: "FakeSwallow", package: "FakeSwallow"),
            ]
        ),
    ]
)

#if os(macOS)
if ProcessInfo.processInfo.environment["USE_PREBUILT_V2"] != nil {
    patch2(in: &package)
}
#endif
private func patch2(in package: inout Package) {
    package.dependencies = [
        .package(path: "XCFrameworks/packages/FakeSwallow"),
        // .package(name: "FakeSwallow", path: "XCFrameworks/packages/FakeSwallow"),
    ]
}


#if os(macOS)
if ProcessInfo.processInfo.environment["USE_PREBUILT"] != nil {
    patch(in: &package)
}
#endif
private func patch(in package: inout Package) {
    package.dependencies = [
        .package(name: "FakeSwallow", path: "FakeSwallowPrebuilt"),
    ]
}
