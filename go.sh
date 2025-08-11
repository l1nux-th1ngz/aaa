#!/bin/bash

# Download
wget https://go.dev/dl/go1.24.6.linux-amd64.tar.gz

# Out with the old in with the new
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.6.linux-amd64.tar.gz

# Set variables
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/Go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc

# Source
source ~/.bashrc

# Create Go workspace directory
mkdir -p $GOPATH/src

echo "Go has been installed"
