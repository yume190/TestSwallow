#!/bin/bash

dir="XCFrameworks"

for entry in "$dir"/*.xcframework
do
  fileName=$(basename "$entry")
  name="${fileName%.*}"
  cd XCFrameworks/$name.xcframework/macos-arm64_x86_64/$name.framework

  mkdir -p Versions/A
  cp -r $name Versions/A/$name
  cp -r Headers Versions/A/Headers
  cp -r Info.plist Versions/A/Info.plist
  cp -r Modules Versions/A/Modules

  cd -
done
