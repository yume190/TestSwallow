// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

var package = Package(
    name: "UseSwallow",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    dependencies: [
        .package(
            url: "https://github.com/PreternaturalAI/AI",
            branch: "main"
        ),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "UseSwallow",
            dependencies: [
                .product(name: "AI", package: "AI"),
            ]
        ),
    ]
)

private func patchToUsePrebuiltXcframeworks(in package: inout Package) {
    func patchMacro(_ target: Target, _ macro: String) {
        var settings = target.swiftSettings ?? []
        settings.append(.unsafeFlags([
            "-load-plugin-executable", "XCFrameworks/\(macro)#\(macro)"
        ]))
        target.swiftSettings = settings
    }

#if os(macOS)
    if ProcessInfo.processInfo.environment["USE_PREBUILT"] != nil {
        package.dependencies = [
            .package(path: "XCFrameworks/packages/AI"),
        ]
        for target in package.targets {
            if target.name == "UseSwallow" {
                patchMacro(target, "SwallowMacros")
            }
        }
    }
#endif
}
patchToUsePrebuiltXcframeworks(in: &package)