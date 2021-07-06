#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -y \
  build-essential \
  direnv \
  fzf \
  neovim \
  zsh

# TODO
#
# - get fzf-vim working
# - gpg
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
#
# ansible-ise ~/.zshrc_machine_specific
#
# sudo dpkg-reconfigure tzdata
#
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# copy init.vim over and review changes
#
# kitty +kitten ssh # to install terminfo?
