#!/bin/bash

dir="XCFrameworks"

for entry in "$dir"/*.xcframework
do
  fileName=$(basename "$entry")
  name="${fileName%.*}"
  cd XCFrameworks/$name.xcframework/macos-arm64_x86_64/$name.framework

  mkdir -p Versions/A

  mv $name Versions/A/$name
  mv Info.plist Versions/A/Info.plist
  mv Headers Versions/A/Headers
  mv Modules Versions/A/Modules
  
  ln -s Versions/A/$name $name
  ln -s Versions/A/Headers Headers
  ln -s Versions/A/Info.plist Info.plist
  ln -s Versions/A/Modules Modules

  ln -s Versions/A Versions/Current

  cd -
done
