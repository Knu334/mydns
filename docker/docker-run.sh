docker run --name ddns --env-file .env --mount type=bind,src=./logs/,dst=/app/logs/ --init --rm ddns:latest