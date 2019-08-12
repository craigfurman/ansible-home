#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=../shell_helpers/shell-helpers.sh
source "$(dirname "$0")/../shell_helpers/shell-helpers.sh"

log "Updating pacman packages"
sudo pacman -Syu --noconfirm

log "Updating AUR packages"
"$(dirname "$0")/aur-upgrade.sh"

log "Cleaning pacman cache"
sudo pacman -Sc --noconfirm

log "Locating pacnew files"
sudo updatedb
sudo locate --existing --regex '\.pac(new|save)$'
