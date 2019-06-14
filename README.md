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

1. libva-intel-driver on laptop
1. Split Arch package host into own role
1. gpg-agent.conf
1. ssh client config for Linux

## First run

Like any automation around personal laptops, snowflakes can be hard to avoid compared to
servers. Since I last rearranged all the code, it's almost inevitable that a new machine
will fail to converge somehow.

Secrets are encrypted with ansible-vault, and are kept in a private repository.
Clone the secrets repository into the checkout of this repository.

### Arch Linux

AUR packages are kept on a network share, which must be mounted. See Google doc.

### macos

Before running ansible (which won't even be installed):

1. Install Homebrew
1. `cd macos && brew bundle`

### Raspberry pi

See [first setup instructions](docs/raspberry-pi.md).
