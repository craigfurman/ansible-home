#!/bin/bash
set -euo pipefail

sudo pacman -S --needed git ansible

(
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/craigfurman/ansible-home.git
cd ansible-home
./run.sh
)
