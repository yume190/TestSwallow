#  Use Fake Swallow XCFramework

---

## All Test

```bash
cd TestSwallow
make test
```

---

```bash
cd TestSwallow
scipio prepare --support-simulators
```

## Mac Framework

```bash
cd TestSwallow

cd XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/
mkdir -p Versions/A
# cp all to Versions/A
```

## Mac APP

code sign -> remove sanbox

---

## Package Generate(Design)

### Target

```swift
/// origin
.target(
    name: "FoundationX",
    dependencies: [
        "Swallow",
        "FoundationXDependency",
    ]
),

/// modified
.binaryTarget(
    name: "FoundationX",
    path: "../XCFrameworks/FoundationX.xcframework"
),
.target(
    name: "FoundationX_Aggregation",
    dependencies: [
        /// binary target
        "FoundationX",
        /// aggregate targets
        "Swallow_Aggregation",
        "FoundationXDependency_Aggregation",
    ]
),
```


### Target.Dependency

```swift
/// origin
dependencies: [
    .product(name: "FakeSwallow", package: "FakeSwallow"),

    "Swallow",
]

/// modified
dependencies: [
    .product(name: "FakeSwallow", package: "FakeSwallow"),
    /// aggregate target
    "Swallow_Aggregation",
]
```

### Product

```swift
/// origin
.library(
    name: "FakeSwallow",
    targets: [
        "Swallow",
        "FoundationX",
        "_PythonString",
    ]),

/// modified
.library(
    name: "FakeSwallow",
    targets: [
        /// aggregate targets
        "Swallow_Aggregation",
        "FoundationX_Aggregation",
        "_PythonString_Aggregation",
    ]),
```

### Dependencies(repo)

```swift
/// origin
.package(
    url: "https://github.com/vmanot/Swallow",
    revision: "97e1a308056eeae280d1a58179769ffe275952d2"
),
.package(path: "FakeSwallow"),

/// modified
.package(name: "Swallow", path: "path/to/swallowPrebuilt"),
.package(name: "FakeSwallow", path: "FakeSwallowPrebuilt"),
```

### Patch to root Package.swift

```swift
import Foundation

// ...

#if os(macOS)
if ProcessInfo.processInfo.environment["USE_PREBUILT"] != nil {
patch(in: &package)
}
#endif
private func patch(in package: inout Package) {
    package.dependencies = [
        // ...
    ]
}
```

### Usage

> USE_PREBUILT=1 swift run
