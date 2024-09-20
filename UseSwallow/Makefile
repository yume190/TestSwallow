
.PHONY: prebuilt
prebuilt:
	scipio prepare \
		--support-simulators \
		--framework-type dynamic \
		--configuration debug \
		--overwrite

list:
	tree -L1 XCFrameworks/Swallow.xcframework

type:
	file XCFrameworks/Swallow.xcframework/ios-arm64/Swallow.framework/Swallow 
	@echo "------"
	file XCFrameworks/Swallow.xcframework/ios-arm64_x86_64-simulator/Swallow.framework/Swallow 
	@echo "------"
	file XCFrameworks/Swallow.xcframework/macos-arm64_x86_64/Swallow.framework/Swallow 
	@echo "------"
	file XCFrameworks/Swallow.xcframework/tvos-arm64/Swallow.framework/Swallow 
	@echo "------"
	file XCFrameworks/Swallow.xcframework/tvos-arm64_x86_64-simulator/Swallow.framework/Swallow 
	@echo "------"
	file XCFrameworks/Swallow.xcframework/watchos-arm64_arm64_32_armv7k/Swallow.framework/Swallow 
	@echo "------"
	file XCFrameworks/Swallow.xcframework/watchos-arm64_x86_64-simulator/Swallow.framework/Swallow 




.PHONY: patch
patch:
	./patch.sh

.PHONY: clean
clean:
	-rm -Rf XCFrameworks
	-rm -Rf .build
	-rm -Rf FakeSwallow/.build
	-rm -Rf FakeSwallowPrebuilt/.build

.PHONY: test
test: clean gen patch
	swift run
	USE_PREBUILT=1 swift run

symbol:
	-nm XCFrameworks/Swallow.xcframework/macos-arm64_x86_64/Swallow.framework/Swallow | grep swallow
	-nm XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/FoundationX | grep swallow

link:
	-otool -L XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/FoundationX | grep swallow
	-otool -L XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/FoundationX | grep Swallow