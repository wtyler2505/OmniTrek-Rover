#!/bin/bash
# Script to set up development environment for OmniTrek Rover

echo "Setting up development environment for OmniTrek Rover..."

# Update system
sudo apt update
sudo apt upgrade -y

# Install essential development tools
sudo apt install git python3-pip python3-venv python3-dev build-essential -y

# Install additional useful tools
sudo apt install htop iotop ncdu net-tools -y

# Add user to dialout group for serial device access
sudo usermod -a -G dialout $USER

# Create project directories
mkdir -p ~/omnitrek_project/src/{arduino,python,config}

# Set up Python virtual environment
cd ~/omnitrek_project
python3 -m venv venv
source venv/bin/activate

# Install Python dependencies
pip install pynput pyserial numpy matplotlib

# Create requirements.txt
pip freeze > src/python/requirements.txt

echo "Development environment setup complete!"
echo "Note: You need to log out and back in for dialout group membership to take effect."
