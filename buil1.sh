#!/bin/bash

# Get the current image tag from the Docker Compose file
current_tag=$(grep -oP 'ubuntu:\K\d+' docker-compose.yml)

# Increment the tag by 1
new_tag=$((current_tag + 1))

# Build the Docker image with the new tag
if docker build -t ubuntu:${new_tag} .; then
  # Prompt user to proceed
  read -p "Image build successful. Do you want to run 'docker-compose up -d'? (yes/no): " choice
  if [ "$choice" == "yes" ]; then
    # Update the Docker Compose file with the new image tag
    sed -i "s|image: ubuntu:.\\+|image: ubuntu:${new_tag}|" docker-compose.yml
    
    # Run docker-compose up -d
    docker-compose up -d
    echo "Docker image built and container updated with new image: ubuntu:${new_tag}"
  else
    echo "Docker image built with new tag: ${new_tag}, but 'docker-compose up -d' not executed."
  fi
else
  echo "Image build failed. Docker image not created."
fi

