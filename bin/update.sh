#!/usr/bin/env bash
set -euo pipefail

log() {
  echo "----------------------------------"
  echo "$1"
  echo "----------------------------------"
  echo
}

log "Updating pacman packages"
sudo pacman -Syu

log "Updating AUR packages"
"$(dirname "$0")/aur-upgrade.sh"

log "Cleaning pacman cache"
sudo pacman -Sc

log "Locating pacnew files"
sudo updatedb
sudo locate --existing --regex '\.pac(new|save)$'
