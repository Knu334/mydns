#!/bin/bash
if [ ! -e .env ]; then
    echo USERNAME= >> .env
    echo PASSWORD= >> .env
    echo NODE_ENV=production >> .env
    echo TZ=Asia/Tokyo >> .env
    echo LOG_LEVEL=INFO >> .env
fi
docker build . -f ./docker/Dockerfile -t Knu334/mydns:latest --build-arg ARCH=
