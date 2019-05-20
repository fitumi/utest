#! /bin/bash -x
/Applications/Unity/Unity.app/Contents/MacOS/Unity -batchmode -createManualActivationFile -logfile

mv Unity_v2018.3.8f1.alf Unity_v2018.x.ulf

/Applications/Unity/Unity.app/Contents/MacOS/Unity -batchmode -manualLicenseFile Unity_v2018.x.ulf -logfile


project="Hexed"

echo "Attempting to build $project for OS X"
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath $(pwd) \
  -buildOSXUniversalPlayer "$(pwd)/Build/osx/$project.app" \
  -quit


echo 'Logs from build'
cat $(pwd)/unity.log
