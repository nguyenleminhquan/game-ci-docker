#!/bin/bash

UNITY_VERSION=2018.3.7f1
IMAGE=unityci/editor # https://hub.docker.com/r/unityci/editor
IMAGE_VERSION=1.0.1 # https://github.com/game-ci/docker/releases
DOCKER_IMAGE=$IMAGE:$UNITY_VERSION-android-$IMAGE_VERSION

docker run -it --rm \
  -e "UNITY_USERNAME=quannlm@vng.com.vn" \
  -e "UNITY_PASSWORD=nRmlmq.2o01/,unity" \
  -w /project/ \
  -v "$(pwd):/project" \
  $DOCKER_IMAGE \
  bash