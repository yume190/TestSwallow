mkdir -p Versions/A
mv XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/* Versions/A
mv Versions XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/
ln -s XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/Versions/A/FoundationX XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/FoundationX

mkdir -p Versions/A
mv XCFrameworks/Swallow.xcframework/macos-arm64_x86_64/Swallow.framework/* Versions/A
mv Versions XCFrameworks/Swallow.xcframework/macos-arm64_x86_64/Swallow.framework
ln -s XCFrameworks/Swallow.xcframework/macos-arm64_x86_64/Swallow.framework/Versions/A/Swallow XCFrameworks/Swallow.xcframework/macos-arm64_x86_64/Swallow.framework/Swallow