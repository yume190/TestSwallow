
.PHONY: gen
gen:
	scipio prepare \
		--support-simulators \
		--overwrite

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
	cd FakeSwallow && swift test
	cd FakeSwallowPrebuilt && swift test
	swift run
	USE_PREBUILT=1 swift run
	USE_PREBUILT_V2=1 swift run

symbol:
	-nm XCFrameworks/Swallow.xcframework/macos-arm64_x86_64/Swallow.framework/Swallow | grep swallow
	-nm XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/FoundationX | grep swallow

link:
	-otool -L XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/FoundationX | grep swallow
	-otool -L XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/FoundationX | grep Swallow