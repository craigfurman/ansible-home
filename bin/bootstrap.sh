#!/usr/bin/env bash
set -euo pipefail

sudo pacman -S --needed git

mkdir -p ~/workspace
cd ~/workspace
git clone --recursive https://github.com/craigfurman/ansible-home.git
cd ansible-home
make
