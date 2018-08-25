#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=../lib/shell-helpers.sh
source "$(dirname "$0")/../lib/shell-helpers.sh"

log "Updating pacman packages"
sudo pacman -Syu

log "Updating AUR packages"
"$(dirname "$0")/aur-upgrade.sh"

log "Cleaning pacman cache"
sudo pacman -Sc

log "Locating pacnew files"
sudo updatedb
sudo locate --existing --regex '\.pac(new|save)$'
