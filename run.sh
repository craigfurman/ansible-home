#!/bin/bash
set -euo pipefail

supplied_tags="${1:-}"

main() {
  check_zshrc
  install_python

  cd "$(dirname "$0")"

  MAKEFLAGS="-j$(cpu_count)"
  export MAKEFLAGS
  tags=$(tags)

  cmd="ansible-playbook"
  if [ -z "${PASSWORDLESS_SUDO:-}" ]; then
    cmd="$cmd --ask-become-pass"
  fi
  $cmd -i localhost, --con local --tags "$tags" playbook.yml
}

cpu_count() {
  if which nproc > /dev/null 2>&1 ; then
    nproc
    return 0
  fi

  sysctl -n hw.ncpu
}

tags() {
  if [ -n "${supplied_tags:-}" ]; then
    echo "$supplied_tags"
    return 0
  fi

  if [[ "$(hostname)" == "craig-desktop" ]]; then
    echo "archlinux-headless,common-headless,archlinux-gnome,archlinux-media-server"
    return 0
  elif [[ "$(hostname)" == "craig-laptop" ]]; then
    echo "archlinux-headless,common-headless,archlinux-gnome"
    return 0
  else
    echo "unrecognised hostname: $(hostname). Usage: run.sh <comma separated tags>. Supported tags: common-headless,archlinux-headless,archlinux-gnome,archlinux-media-server" >&2
    return 1
  fi
}

install_python() {
  if which python > /dev/null 2>&1 ; then
    return 0
  fi

  echo "installing python..."

  if which pacman > /dev/null 2>&1 ; then
    sudo pacman -S --needed --noconfirm python
  else
    echo "no supported package manager found"
    exit 1
  fi
}

check_zshrc() {
  if [ -e ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    echo "$HOME/.zshrc is not a symlink, stowing dotfiles will fail later. try removing it for now."
    return 1
  fi
}

main
