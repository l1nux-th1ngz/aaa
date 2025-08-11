#!/bin/bash

set -e 
set -o pipefail  

# Update 
sudo apt update

# Install fnm
if ! command -v fnm >/dev/null 2>&1; then
    echo "Installing fnm (Fast Node Manager)..."
    curl -fsSL https://fnm.vercel.app/install | bash
    # Add fnm to shell profile for future sessions
    echo 'export PATH="$HOME/.local/share/fnm/fnm.sh:$PATH"' >> ~/.bashrc
    source ~/.bashrc
else
    echo "fnm is already installed."
fi

# Install nvm
if ! command -v nvm >/dev/null 2>&1; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
    # Load nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
    echo "nvm is already installed."
fi

# Load nvm into current shell
if command -v nvm >/dev/null 2>&1; then
    echo "Loading nvm..."
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install Node.js v22.x
TARGET_VERSION=22
if command -v nvm >/dev/null 2>&1; then
    echo "Installing Node.js v$TARGET_VERSION using nvm..."
    nvm install "$TARGET_VERSION"
else
    echo "Installing Node.js v$TARGET_VERSION using fnm..."
    fnm install "$TARGET_VERSION"
fi

# Prompt 
read -p "Would you like to install the latest Node.js version? (Y/n): " REPLY
if [[ "$REPLY" =~ ^[yY]$ ]]; then
    if command -v nvm >/dev/null 2>&1; then
        echo "Installing latest Node.js with nvm..."
        nvm install node
        nvm alias default node
    else
        echo "Installing latest Node.js with fnm..."
        fnm install latest
        fnm default latest
    fi
fi

# Set default
if command -v nvm >/dev/null 2>&1; then
    echo "Setting default Node.js version to v$TARGET_VERSION..."
    nvm alias default "$TARGET_VERSION"
else
    echo "Setting default Node.js version with fnm..."
    fnm default "$TARGET_VERSION"
fi

# Install NestJS CLI
echo "Installing NestJS CLI globally..."
sudo npm install -g @nestjs/cli

# Initialize
npm init -y

echo "Installation complete!"
