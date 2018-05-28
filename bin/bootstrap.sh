#!/bin/bash
set -euo pipefail

sudo pacman -S --needed git ansible

cd ~/workspace
git clone --recursive https://github.com/craigfurman/ansible-home.git
cd ansible-home
make
