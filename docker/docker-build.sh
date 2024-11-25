#!/bin/bash
docker build . --rm -f ./docker/Dockerfile -t Knu334/mydns:latest --build-arg ARCH=