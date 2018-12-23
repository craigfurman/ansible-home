# ansible-home

Supports Arch Linux and macOS, although Linux has had more attention than macOS here.

## Usage

`make`

See "First run" section if this is the first run on a particular machine.

## TODO

1. Kitty Linux: text matches background in certain circumstances: e.g. tmux + ssh to
   raspberry pi + htop.
1. Kitty: omz arrow doesn't display properly using Inconsolata on macOS
1. autokbisw from homebrew
1. global rubocop (macos only)
1. chromium-vaapi-bin, chromium-widevine everywhere, libva-intel-driver on laptop
1. Ansible-ize pacman.conf
1. Split Arch package host into own role
1. macos: gpg-agent.conf
1. When alacritty supports DRY config, split config file into parts

## First run

### Arch Linux

`bash -c "$(curl -sSL https://raw.githubusercontent.com/craigfurman/ansible-home/master/bin/bootstrap.sh)"`

Note: this script only works on Linux. On macOS, you'll have to clone the repo and run
`make`.

This might fail the first time due to PGP signatures for an AUR package not being
verified. I didn't want to automate the receiving of PGP keys, as this feels like it would
defeat the point of PGP. Use `gpg --recv-keys <key>` if happy to import the key.

### macos

Ensure that `/etc/ansible/ansible.cfg` exists and has the following contents:

```
[defaults]

gather_subset = !facter
```

I haven't investigated deeply, but this might only be necessary due to a clash with the
way puppet/munki are installed.
