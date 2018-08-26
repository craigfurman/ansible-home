# ansible-home

Supports Arch Linux. macOS support in macos branch.

## Usage

`make`

## TODO

1. Unify mac and Linux config
1. Ansible-ize pacman.conf
1. Split Arch package host into own role
1. macos: gpg-agent.conf
1. When alacritty supports DRY config, split config file into parts

## First run

`bash -c "$(curl -sSL https://raw.githubusercontent.com/craigfurman/ansible-home/master/bin/bootstrap.sh)"`

This might fail the first time due to PGP signatures for an AUR package not being
verified. I didn't want to automate the receiving of PGP keys, as this feels like it would
defeat the point of PGP. Use `gpg --recv-keys <key>` if happy to import the key.
