# ansible-home

Supports Arch Linux. macOS support in macos branch.

## Usage

1. `make`
1. In tmux, prefix+U to update plugins.
1. Run PlugUpdate in vim

## TODO

1. Automate installation of AUR packages on Arch machines
1. Split Arch package host into own role
1. macos: gpg-agent.conf
1. Review non-pacman packages, e.g. yamllint. Move to repo/aur versions if
   possible.

## First run

1. `bash -c "$(curl -sSL https://raw.githubusercontent.com/craigfurman/ansible-home/master/bin/bootstrap.sh)"`
1. This might fail the first time due to PGP signatures for an AUR package not
   being verified. I didn't want to automate the receiving of PGP keys, as this
   feels like it would defeat the point of PGP. Use `gpg --recv-keys <key>` if
   happy to import the key.
1. Check limitations and TODO sections
1. In tmux, prefix+I to install plugins.
1. Run PlugInstall in vim
