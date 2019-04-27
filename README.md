# ansible-home

Configures my laptop / desktop / media server, which all run Arch Linux, my macOS laptop,
and my raspberry pi.

## Usage

For laptops, desktops etc, where ansible will be run locally after cloning this
repository:

```
ansible-playbook -i -pcs --vault-password-file <vault-password-file> pcs.yml
```

To configure servers over ssh:

```
ansible-playbook -i servers --vault-password-file <vault-password-file> servers.yml
```

### Upgrading

Laptops, desktops etc: `bin/upgrade.sh`.

Servers - no automation yet.

## TODO

1. Kitty: omz arrow doesn't display properly using Inconsolata on macOS
1. autokbisw from homebrew
1. global rubocop (macos only)
1. libva-intel-driver on laptop
1. Split Arch package host into own role
1. macos: gpg-agent.conf
1. When alacritty supports DRY config, split config file into parts

## First run

Like any automation around personal laptops, snowflakes can be hard to avoid compared to
servers. Since I last rearranged all the code, it's almost inevitable that a new machine
will fail to converge somehow.

Secrets are encrypted with ansible-vault, and are kept in a private repository.
Clone the secrets repository into the checkout of this repository.

### Arch Linux

Unless `~/aur-packages` has been bootstrapped from another Arch machine, you'll have to
comment out all the AUR packages sections. There is no flag to do this, as I'd expect not
to lose all of my Arch package caches on my various machines at once.

### macos

Before running ansible (which won't even be installed):

1. Install Homebrew
1. `cd macos && brew bundle`

Ensure that `/etc/ansible/ansible.cfg` exists and has the following contents:

```
[defaults]

gather_subset = !facter
```

I haven't investigated deeply, but this might only be necessary due to a clash with the
way puppet/munki are installed.

### Raspberry pi

See [first setup instructions](docs/raspberry-pi.md).
