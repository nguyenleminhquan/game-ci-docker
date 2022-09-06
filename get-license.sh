#!/bin/bash

UNITY_VERSION=ubuntu-2018.3.7f1
IMAGE=unityci/editor
IMAGE_VERSION=1.0.1
DOCKER_IMAGE=$IMAGE:$UNITY_VERSION-android-$IMAGE_VERSION
LICENSE=$(base64 Unity_v2018.x.ulf)

docker run -it --rm \
  -e "UNITY_LICENSE=$LICENSE" \
  -e "UNITY_USERNAME=quannlm@vng.com.vn" \
  -e "UNITY_PASSWORD=nRmlmq.2o01/,unity" \
  -e "TEST_PLATFORM=linux" \
  -w /project/ \
  -v "$(pwd):/project/" \
  $DOCKER_IMAGE \
  bash