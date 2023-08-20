#!/bin/bash

# Get the current image tag from the Docker Compose file
current_tag=$(grep -oP 'image: ubuntu:\K\d+\.\d+' docker-compose.yml)

# Increment the tag by 1
new_tag=$((current_tag + 1))

# Build the Docker image with the new tag
docker build -t ubuntu:${new_tag} .

# Update the Docker Compose file with the new image tag
sed -i "s|image: ubuntu:.\\+|image: ubuntu:${new_tag}|" docker-compose.yml

echo "Docker image built and Compose file updated with new tag: ${new_tag}"

