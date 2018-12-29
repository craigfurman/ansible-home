# ansible-home

Configures my laptop / desktop / media server, which all run Arch Linux, my macOS laptop,
and my raspberry pi.

## Usage

For laptops, desktops etc, where ansible will be run locally after cloning this
repository:

```
ansible-playbook -i $(hostname) pcs.yml
```

This basically abuses the ansible inventory file to switch configuration on hostname. I
used to use tags for this.

To configure servers over ssh:

```
ansible-playbook -i servers servers.yml
```

### Upgrading

Laptops, desktops etc: `bin/upgrade.sh`.

Servers - no automation yet.

## TODO

1. Kitty Linux: text matches background in certain circumstances: e.g. tmux + ssh to
   raspberry pi + htop.
1. Kitty: omz arrow doesn't display properly using Inconsolata on macOS
1. autokbisw from homebrew
1. global rubocop (macos only)
1. chromium-vaapi-bin, chromium-widevine everywhere, libva-intel-driver on laptop
1. Split Arch package host into own role
1. macos: gpg-agent.conf
1. When alacritty supports DRY config, split config file into parts

## First run

Like any automation around personal laptops, snowflakes can be hard to avoid compared to
servers. Since I last rearranged all the code, it's almost inevitable that a new machine
will fail to converge somehow.

Some variables are encrypted with Ansible Vault, so you'll need to supply the vault
password, either by `--ask-vault-pass`, `--vault-password-file`, or by setting
`vault_password_file` in `/etc/ansible/ansible.cfg`.

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
