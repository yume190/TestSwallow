prebuilt:
	scipio prepare \
		--support-simulators \
		--framework-type dynamic \
		--configuration debug \
		--overwrite

list:
	tree -L1 XCFrameworks/_CSV.xcframework

type:
	file XCFrameworks/_CSV.xcframework/ios-arm64/_CSV.framework/_CSV
	@echo "-----"
	file XCFrameworks/_CSV.xcframework/ios-arm64_x86_64-simulator/_CSV.framework/_CSV
	@echo "-----"
	file XCFrameworks/_CSV.xcframework/macos-arm64_x86_64/_CSV.framework/_CSV