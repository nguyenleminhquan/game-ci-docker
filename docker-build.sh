#!/usr/bin/env bash

set -e

LICENSE=$(base64 Unity_v2018.x.ulf)
UNITY_VERSION=
docker run \
  -e "BUILD_NAME=ci" \
  -e "UNITY_LICENSE=$LICENSE" \
  -e "BUILD_TARGET=android" \
  -e "UNITY_USERNAME=quannlm@vng.com.vn" \
  -e "UNITY_PASSWORD=nRmlmq.2o01/,unity" \
  -w /project/ \
  -v "$(pwd):/project/" \
  $IMAGE_NAME \
  /bin/bash -c "/project/before-script.sh && /project/build.sh"
