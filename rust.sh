#!/bin/bash

# Remove
sudo apt -y remove --purge rustc

# Update
sudo apt update && sudo apt upgrade -y

# Install
sudo apt -y install curl build-essential gcc make

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile minimal --default-toolchain nightly

# Update rustup
rustup self update
rustup update

# Install
rustup install stable
rustup install nightly

# Set default
rustup default nightly

# Add rustfmt
rustup component add rustfmt

# Update PATH
export PATH="$HOME/.cargo/bin:$PATH"
source ~/.cargo/env

# Create Workspace Directory
mkdir -p ~/Rust

# Go to the Rust directory
cd ~/Rust

# Create source file
cat <<EOF > helloworld.rs
fn main() {
    println!("Hello World, this is a test provided by LinuxCapable.com");
}
EOF

# Compile
rustc helloworld.rs

# Run application
./helloworld

# Update Rust
rustup update

# Wait
wait

echo "Rust installation complete"
