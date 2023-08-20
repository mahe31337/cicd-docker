#!/bin/bash

# Get the current image tag from the Docker Compose file
current_tag=$(grep -oP 'ubuntu:\K\d+' docker-compose.yml)

# Increment the tag by 1
new_tag=$((current_tag + 1))

# Build the Docker image with the new tag
if docker build -t ubuntu:${new_tag} .; then
    sed -i "s|image: ubuntu:.\\+|image: ubuntu:${new_tag}|" docker-compose.yml
    
    echo "Docker image built and image name updated with new image: ubuntu:${new_tag}"
  else
  echo "Image build failed. Docker image not created."
fi

