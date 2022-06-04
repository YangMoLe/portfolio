#!/bin/sh

# Stop script on first error
set -e

# Decode SSH key
echo "${SSH_KEY}" | base64 -d > ssh_key
chmod 600 ssh_key # private keys need to have strict permission to be accepted by SSH agent

# Add production server to known hosts
# echo "${SERVER_PUBLIC_KEY}" | base64 -d >> ~/.ssh/known_hosts

echo "Deploying via remote SSH"
ssh -i ssh_key "yangsudo@144.91.72.53" \
  "docker pull yangmole/portfolio-main:latest \
  && docker stop live-container \
  && docker rm live-container \
  && docker run --init -d --name portfolio-main -e VIRTUAL_HOST=yangmole.com -e LETSENCRYPT_HOST=yangmole.com -e VIRTUAL_PORT=80 --network net yangmole/portfolio-main:latest \
  && docker system prune -af" # remove unused images to free up space

echo "Successfully deployed, hooray!"


