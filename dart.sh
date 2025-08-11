#!/bin/bash

# Update
sudo apt update

# Install
sudo apt -y install apt-transport-https

# Add GPG key
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg

# Add  repository
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list

# Refresh
sudo apt-get update

# Install
sudo apt-get -y install dart

echo "Dart has been successfully installed!"
