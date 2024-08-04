#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Print the current directory
echo "Current Directory: $(pwd)"

# List the contents of the current directory
echo "Listing current directory contents:"
ls -la

# Verify the Dockerfile is present
if [[ ! -f Dockerfile ]]; then
    echo "Dockerfile not found in $(pwd)"
    exit 1
fi

# Build the Docker image
echo "Building Docker image..."
docker build -t claxmih/lms .

echo "Docker image built successfully."