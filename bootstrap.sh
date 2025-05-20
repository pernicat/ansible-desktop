#!/usr/bin/env bash

set -e

# Colors for output
green="\033[0;32m"
red="\033[0;31m"
reset="\033[0m"

print() {
  echo -e "${green}[+] $1${reset}"
}

print "Updating package list and installing prerequisites..."
sudo apt update && sudo apt install -y \
  git \
  python3 \
  python3-pip \
  ansible

if [ ! -d "ansible-desktop" ]; then
  print "Cloning the ansible-desktop repository..."
  git clone https://your.repo/ansible-desktop.git
  cd ansible-desktop
else
  cd ansible-desktop
  print "Repository already exists. Pulling latest changes..."
  git pull
fi

print "Running the Ansible playbook..."
ansible-playbook -i inventory.ini playbook.yml

print "Done! You may want to reboot to apply all settings."
