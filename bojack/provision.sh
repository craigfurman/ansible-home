#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -y \
  apt-transport-https \
  build-essential \
  direnv \
  fzf \
  jq \
  neovim \
  ripgrep \
  zsh

# TODO
#
# - ssh: (multipass only) copy ssh key over, so that we can use agent forwarding
# - gpg: document export/import keys
#
# ╰─$ cat ~/.gnupg/gpg-agent.conf
# default-cache-ttl 34560000
# max-cache-ttl 34560000
#
# sudo dpkg-reconfigure --priority=low unattended-upgrades
#
# /etc/apt/apt.conf.d/50unattended-upgrades:
# - remove Unattended-Upgrade::Allowed-Origins
# Unattended-Upgrade::Origins-Pattern {
#   "o=*";
# }
#
# sudo chsh -s $(which zsh) $(whoami)
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
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# copy init.vim over and review changes
#
# gitconfig (and machine specific)
#
# ripgreprc
#
# Vagrant only, not needed for multipass
# sudo dpkg-reconfigure tzdata
# sudo timedatectl set-ntp true
#
# Databases:
# postgres: https://www.postgresql.org/download/linux/ubuntu/
# sudo apt-get installp postgresql-9.8
# sudo apt-get install redis-server
#
# docker: https://docs.docker.com/engine/install/ubuntu
# sudo usermod -aG docker $(whoami)
#
# kitty +kitten ssh # to install terminfo?
#
# Install gcloud: https://cloud.google.com/sdk/docs/install#deb
