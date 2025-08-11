#!/bin/bash

# Install Go
sudo apt -y install golang

# Set environment variables
echo 'export GOROOT=/usr/lib/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/Go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc

# Source the .bashrc file to apply changes permanently
# Note: This will only affect the current shell session. 
# To apply changes in new terminal sessions, you need to restart the terminal or run the source command manually.
source ~/.bashrc

# Create Go workspace directory
mkdir -p $GOPATH/src

echo "Go has been installed"
