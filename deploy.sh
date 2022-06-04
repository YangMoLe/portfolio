#!/bin/sh

# Stop script on first error
set -e

echo "Deploying via remote SSH"
ssh "yangsudo@144.91.72.53" \
  "docker pull yangmole/portfolio-main:latest \
  && docker stop portfolio \
  && docker rm portfolio \
  && docker run --init -d --name portfolio -e VIRTUAL_HOST=yangmole.com -e LETSENCRYPT_HOST=yangmole.com -e VIRTUAL_PORT=80 --network net yangmole/portfolio-main:latest \
  && docker system prune -af" # remove unused images to free up space

echo "Successfully deployed, hooray!"


