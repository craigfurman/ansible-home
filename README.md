# ansible-home

Configuration and automation for my various personal computers.

## Usage

```
ansible-playbook -i inventory/lakitu --vault-password-file <vault-password-file> lakitu.yml
```

Replace inventory and playbook as appropriate.

### Upgrading laptops

1. `bin/upgrade`
1. Run ansible as normal.

### Upgrading morty

1. As root: `pacman -Syu --noconfirm && pacman -Sc --noconfirm`
1. Run ansible against morty over ssh.

## First run

Secrets are encrypted with ansible-vault, and are kept in a private repository.
Clone the secrets repository into the checkout of this repository.

### Arch Linux

1. `sudo pacman -S ansible`
1. Run ansible as normal.

### macOS

1. Install Homebrew
1. `cd macos && brew bundle`
1. Run ansible as normal.
