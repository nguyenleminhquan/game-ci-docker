#!/bin/bash

LICENSE=$(base64 Unity_v2018.x.ulf)
UNITY_VERSION=ubuntu-2018.3.7f1
IMAGE=unityci/editor
IMAGE_VERSION=1.0.1
DOCKER_IMAGE=$IMAGE:$UNITY_VERSION-android-$IMAGE_VERSION

docker run \
  -e "BUILD_NAME=ci" \
  -e "UNITY_LICENSE=$LICENSE" \
  -e "BUILD_TARGET=Android" \
  -e "UNITY_DIR=/" \
  -e "UNITY_USERNAME=quannlm@vng.com.vn" \
  -e "UNITY_PASSWORD=nRmlmq.2o01/,unity" \
  -w /project/ \
  -v "$(pwd):/project/" \
  $DOCKER_IMAGE \
  /bin/bash -c "/project/before-script.sh && /project/build.sh"
