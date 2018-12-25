#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=../shell_helpers/shell-helpers.sh
source "$(dirname "$0")/../shell_helpers/shell-helpers.sh"

log "Updating pacman packages"
sudo pacman -Syu --noconfirm

# Usually, desktop builds AUR packages, laptop just pulls them from Google Drive
if [ -n "${AUR_BUILDER:-}" ]; then
  log "Updating AUR packages"
  "$(dirname "$0")/aur-upgrade.sh"
else
  log "AUR_BUILDER not set: will not build updated AUR packages on this machine"
fi

log "Cleaning pacman cache"
sudo pacman -Sc --noconfirm

log "Locating pacnew files"
sudo updatedb
sudo locate --existing --regex '\.pac(new|save)$'
