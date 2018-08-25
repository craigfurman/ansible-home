#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=../lib/shell-helpers.sh
source "$(dirname "$0")/../lib/shell-helpers.sh"

main() {
  check_symlinks
  install_bootstrap_packages

  MAKEFLAGS="-j$(cpu_count)"
  export MAKEFLAGS

  cmd="ansible-playbook"
  if [ -n "${ANSIBLE_FLAGS:-}" ]; then
    cmd="$cmd $ANSIBLE_FLAGS"
  fi
  if [ -z "${PASSWORDLESS_SUDO:-}" ]; then
    cmd="$cmd --ask-become-pass"
  fi

  tags="$(tags)"

  log "Running Ansible with tags $tags"
  $cmd -i localhost, --con local --tags "$tags" "$(dirname "$0")/../ansible/playbook.yml"
}

cpu_count() {
  if command -v nproc > /dev/null 2>&1 ; then
    nproc
    return 0
  fi

  sysctl -n hw.ncpu
}

tags() {
  if [ -n "${ANSIBLE_TAGS:-}" ]; then
    echo "$ANSIBLE_TAGS"
    return 0
  fi

  jq -r ".[\"$(hostname)\"] | join(\",\")" "$(dirname "$0")/../machines.json"
}

install_bootstrap_packages() {
  log "Installing bootstrap packages"

  install_package ansible
  install_package jq
}

install_package() {
  package=$1
  if command -v "$package" > /dev/null 2>&1 ; then
    return 0
  fi

  log "Installing $package"

  if command -v pacman > /dev/null 2>&1 ; then
    sudo pacman -S --needed --noconfirm "$package"
  else
    echo "no supported package manager found"
    return 1
  fi
}

check_symlinks() {
  log "Checking expected symlinks"

  if [ -e ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    echo "$HOME/.zshrc is not a symlink, stowing dotfiles will fail later. try removing it for now."
    return 1
  fi
}

main
