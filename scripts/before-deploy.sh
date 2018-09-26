#!/bin/bash
set -e

if [[ $TRAVIS_OS_NAME != "osx" ]]; then
  npm run build
else
  brew install imagemagick
  # npm run build:cordova
  # npx cordova prepare ios
  # npm run gen:cordova-resources
  # npx cordova build ios
  # tar -czvf aeternity.app.tar.gz -C platforms/ios/build/emulator aeternity.app
fi
