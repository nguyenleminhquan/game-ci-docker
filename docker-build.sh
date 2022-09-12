#!/usr/bin/env bash

set -e 

docker run -it --rm \
  -w /project/ \
  -v $(pwd):/project/ \
  -e "BUILD_NAME=GameCI" \
  -e "BUILD_TARGET=Android" \
  -e "UNITY_USERNAME=$1" \
  -e "UNITY_PASSWORD=$2" \
  -e "UNITY_DIR=/project" \
  unityci/editor:2020.3.6f1-android-1.0.1 \
  bash
