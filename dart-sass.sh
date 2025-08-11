#!/bin/bash

# Download
echo "Downloading dart-sass..."
wget https://github.com/sass/dart-sass/releases/download/1.90.0/dart-sass-1.90.0-linux-x64.tar.gz

# Extract
echo "Extracting dart-sass..."
sudo tar -xvzf dart-sass-1.90.0-linux-x64.tar.gz -C /opt/

# Install
echo "Running npm fund..."
npm fund

echo "Installing sass..."
sudo npm install -g sass

# Add to PATH
EXTRACTED_DIR="/opt/dart-sass-1.90.0-linux-x64"
echo "Adding dart-sass to PATH..."
echo "export PATH=\"$EXTRACTED_DIR:\$PATH\"" >> ~/.bashrc
source ~/.bashrc

# Create directorie
echo "Creating directories for Sass, CSS, and SCSS..."
mkdir -p Sass/CSS Sass/SCSS

# Cleanup
echo "Cleaning up..."
rm dart-sass-1.90.0-linux-x64.tar.gz

echo "dart-sass installed!"
