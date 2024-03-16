#!/usr/bin/env bash

export LC_ALL=C

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/.. || exit

DOCKER_IMAGE=${DOCKER_IMAGE:-The-Neoxa-Endeavor/pointsd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/pointsd docker/bin/
cp $BUILD_DIR/src/points-cli docker/bin/
cp $BUILD_DIR/src/points-tx docker/bin/
strip docker/bin/pointsd
strip docker/bin/points-cli
strip docker/bin/points-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
