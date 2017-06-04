#!/bin/bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y python-pip libssl-dev git
pip install --user --upgrade pip
pip install --user --upgrade ansible

(
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/craigfurman/ansible-home.git
cd ansible-home
./run.sh
)
