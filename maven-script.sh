#!/bin/bash

# Check if Maven is already installed
if command -v mvn &>/dev/null; then
    echo "Maven is already installed."
    exit 0
fi

# Update package index
sudo apt update

# Install prerequisites
sudo apt install -y openjdk-11-jdk-headless

# Download Maven
wget -q https://apache.osuosl.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz -O /tmp/apache-maven.tar.gz

# Extract Maven
sudo tar xf /tmp/apache-maven.tar.gz -C /opt

# Set up environment variables
echo "export PATH=\$PATH:/opt/apache-maven-3.8.3/bin" | sudo tee /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

# Verify installation
mvn -v

echo "Maven installation completed successfully."
