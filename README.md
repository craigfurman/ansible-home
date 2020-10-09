# ansible-home

Configures my laptop / desktop / media server, which all run Arch Linux, my macOS laptop,
and my raspberry pi.

## Usage

For laptops, desktops etc, where ansible will be run locally after cloning this
repository:

```
ansible-playbook -i inventory/pcs --vault-password-file <vault-password-file> pcs.yml
```

To configure servers over ssh:

```
ansible-playbook -i inventory/servers --vault-password-file <vault-password-file> servers.yml
```

### Upgrading

Laptops, desktops etc: `bin/upgrade`.

Servers - no automation yet.

## TODO

1. libva-intel-driver on laptop
1. Split Arch package host into own role
1. gpg-agent.conf

## First run

Like any automation around personal laptops, snowflakes can be hard to avoid compared to
servers. Since I last rearranged all the code, it's almost inevitable that a new machine
will fail to converge somehow.

Secrets are encrypted with ansible-vault, and are kept in a private repository.
Clone the secrets repository into the checkout of this repository.

### Arch Linux

AUR packages are kept on a network share, which must be mounted. See Google doc.

### macOS

I only use macOS for my work at GitLab, and the config and instructions are
specific to that.

Before running ansible (which won't even be installed):

1. Install Homebrew
1. `cd macos && brew bundle`

After running ansible:

1. [Set up gpg-agent with YubiKey and ssh](https://gitlab.com/gitlab-com/runbooks/blob/master/howto/yubikey.md)

### Raspberry pi

See [first setup instructions](docs/raspberry-pi.md).
