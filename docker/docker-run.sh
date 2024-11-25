#!/bin/bash
if [ ! -e .env ]; then
    echo USERNAME= >> .env
    echo PASSWORD= >> .env
    echo NODE_ENV=production >> .env
    echo TZ=Asia/Tokyo >> .env
    echo LOG_LEVEL=INFO >> .env
fi
docker run --name mydns --env-file .env --mount type=bind,src=./logs/,dst=/app/logs/ --init --rm Knu334/mydns:latest
