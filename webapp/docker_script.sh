#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Navigate to the project directory
cd /LMS/webapp  # Update this path to your project directory

# Verify the current directory
echo "Current Directory: $(pwd)"

# List files to verify the presence of Dockerfile and other files
echo "Listing files in $(pwd):"
ls -la

# Build the Docker image
echo "Building Docker image..."
docker build -t claxmih/lms .

echo "Docker image built successfully."
