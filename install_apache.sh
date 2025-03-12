#!/bin/bash

# Update the package index
sudo apt update -y

# Upgrade installed packages (optional but recommended)
sudo apt upgrade -y

# Install Apache web server
sudo apt install apache2 -y

# Start and enable Apache to start automatically at boot
sudo systemctl start apache2
sudo systemctl enable apache2

# Check the status of Apache
sudo systemctl status apache2

# Create a simple webpage
echo "Hello World from $(hostname -f)" | sudo tee /var/www/html/index.html
