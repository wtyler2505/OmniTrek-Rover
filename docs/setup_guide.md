# Setup Guide

## Linux Mint Installation

The OmniTrek Rover uses Linux Mint 22.1 "Xia" Cinnamon Edition as its operating system. Refer to the comprehensive setup guide for detailed installation instructions.

## Development Environment Setup

### Required Software

- Git
- Python 3 with pip and venv
- Arduino IDE with ESP8266 support
- Windsurf IDE

### Installing Development Tools

```bash
# Essential development tools
sudo apt update
sudo apt install git python3-pip python3-venv python3-dev build-essential -y

# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Install SSH server for remote access
sudo apt install openssh-server -y
sudo systemctl enable ssh

# Configure firewall
sudo ufw allow ssh
sudo ufw enable

# Add user to dialout group for serial device access
sudo usermod -a -G dialout $USER
# (Log out and back in for this to take effect)
```

### Python Project Setup

```bash
# Create project directory
mkdir -p ~/omnitrek_project
cd ~/omnitrek_project

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install required packages
pip install pynput

# For system dependencies
sudo apt install python3-xlib -y
```
