#!/bin/bash
docker build . --rm -f ./docker/Dockerfile -t ddns:latest --build-arg ARCH=