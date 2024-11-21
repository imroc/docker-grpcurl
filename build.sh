#!/bin/bash

IMAGE="$1"

if [[ "$IMAGE" == "" ]]; then
  echo "need an image"
  exit 1
fi

VERSION="$(cat VERSION)"
MAJOR_MINOR="$(echo $VERSION | cut -d '.' -f1,2)"
MAJOR="$(echo $VERSION | cut -d '.' -f1)"
docker buildx build --push --build-arg VERSION=$VERSION \
  --platform linux/amd64,linux/arm64,linux/ppc64le,linux/s390x,linux/riscv64 \
  -t $IMAGE:$VERSION \
  -t $IMAGE:$MAJOR_MINOR \
  -t $IMAGE:$MAJOR \
  -t $IMAGE:latest \
  .
