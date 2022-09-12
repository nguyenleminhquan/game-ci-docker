#!/usr/bin/env bash

set -e
set -x

echo "Building for $BUILD_TARGET"

# --Template--
# export BUILD_PATH=$UNITY_DIR/Builds/$BUILD_TARGET/
# mkdir -p $BUILD_PATH

# --Custom--
export BUILD_PATH=/project/Builds/$BUILD_TARGET/
mkdir -p $BUILD_PATH

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' unity-editor \
  -projectPath $UNITY_DIR \
  -quit \
  -nographics \
  -buildTarget $BUILD_TARGET \
  -customBuildTarget $BUILD_TARGET \
  -customBuildName $BUILD_NAME \
  -customBuildPath $BUILD_PATH \
  -executeMethod BuildCommand.PerformBuild \
  -logFile /dev/stdout \
  -username "$UNITY_USERNAME" -password "$UNITY_PASSWORD" \
  -batchmode 

UNITY_EXIT_CODE=$?

if [ $UNITY_EXIT_CODE -eq 0 ]; then
  echo "Run succeeded, no failures occurred";
elif [ $UNITY_EXIT_CODE -eq 2 ]; then
  echo "Run succeeded, some tests failed";
elif [ $UNITY_EXIT_CODE -eq 3 ]; then
  echo "Run failure (other failure)";
else
  echo "Unexpected exit code $UNITY_EXIT_CODE";
fi

ls -la $BUILD_PATH
[ -n "$(ls -A $BUILD_PATH)" ] # fail job if build folder is empty
