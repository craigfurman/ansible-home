# ansible-home

Configures my laptop / desktop / media server, which all run Arch Linux, my macOS laptop,
and my raspberry pi.

## Usage

Laptop example:

```
ansible-playbook -i inventory/craig-laptop --vault-password-file <vault-password-file> craig-laptop.yml
```

### Upgrading

Laptops, desktops etc: `bin/upgrade`.

Servers - no upgrade automation yet.

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
