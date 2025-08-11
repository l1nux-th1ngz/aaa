#!/bin/bash

# Remove
sudo apt -y remove --purge rustc

# Install
sudo apt -y install rustup

# Update
rustup self update
rustup update

# Install toolchains
rustup install stable
rustup install nightly

# Set default toolchain
rustup default nightly

# Add rustfmt component
rustup component add rustfmt

# Source the cargo environment
source $HOME/.cargo/env

# Wait :)
wait

echo "Rust install complte''
