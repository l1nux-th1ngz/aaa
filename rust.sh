#!/bin/sh

# Remove and purge existing Rust compiler
sudo apt -y remove --purge rustc

# Install rustup, the Rust toolchain installer
sudo apt -y install rustup

# Updat
rustup self update
rustup update

# Install
rustup install stable
rustup install nightly

# Set default toolchain
rustup default nightly

# Add rustfmt
rustup component add rustfmt

# Source 
source $HOME/.cargo/env

# Wait :)
wait

echo "Rust install complte''
