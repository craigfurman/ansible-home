#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -y \
  apt-transport-https \
  build-essential \
  direnv \
  fzf \
  jq \
  neovim \
  postgresql-9.6 \
  redis-server \
  ripgrep \
  zsh

# TODO
#
# - gpg: document export/import keys, keychain for passphrase
#
# sudo dpkg-reconfigure --priority=low unattended-upgrades
#
# /etc/apt/apt.conf.d/50unattended-upgrades:
# - remove Unattended-Upgrade::Allowed-Origins
# Unattended-Upgrade::Origins-Pattern {
#   "o=*";
# }
#
# sudo chsh -s $(which zsh) vagrant
#
# git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
#
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# install tpm plugins
#
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
# .asdfrc
# go, node plugins
# global .tool-versions with go
#
# ansible-ise ~/.zshrc_machine_specific
#
# sudo dpkg-reconfigure tzdata
#
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# copy init.vim over and review changes
#
# gitconfig (and machine specific)
#
# ripgreprc
#
# sudo timedatectl set-ntp true
#
# postgres: https://www.postgresql.org/download/linux/ubuntu/
#
# docker: https://docs.docker.com/engine/install/ubuntu
# sudo usermod -aG docker $(whoami)
#
# kitty +kitten ssh # to install terminfo?
