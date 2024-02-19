# ansible-home

Configuration and automation for my various computers.

## Usage

```
ansible-playbook -i inventory/lakitu --vault-password-file <vault-password-file> lakitu.yml
```

Replace inventory and playbook as appropriate.

Append `-K` when running tasks that require root.

### Upgrading laptops

1. `brew_upgrade`
1. Run ansible as normal.

### Upgrading morty

1. As root: `pacman -Syu --noconfirm && pacman -Sc --noconfirm`
1. Run ansible against morty over ssh.

## First run

Secrets are encrypted with ansible-vault, and are kept in a private repository.
Clone the secrets repository into the checkout of this repository.

### macOS

1. Install Homebrew
   1. This should install xcode command line tools automatically. If not, run
      `xcode-select --install`.
1. `brew install ansible`
1. Run ansible as normal.

## Manual setup

Ironically for an automation repo, I currently configure a few things on my
mac(s) via the GUI. I figure that if these settings move / change their options
/ and removed, it'll be easier to learn that through the GUI.

A lot of this is automatable (<https://mths.be/macos> /
<https://github.com/mathiasbynens/dotfiles/blob/master/.macos>), and I might
crib from that in the future.

Unless otherwise spelt out, start in "System Preferences":

1. General
   1. Appearance: auto
1. Sharing
   1. Change computer name
1. Desktop & Dock
   1. automatically hide the dock
   1. Click wallpaper to reveal desktop - "only in stage manager"
1. Users and Groups
   1. Login items: add flycut.
1. Security and privacy
   1. General: require password immediately after sleep begins.
   1. Filevault: yes
   1. Accessibility: allow flycut to control the computer.
1. Sound
   1. Disable startup sound
1. Keyboard
   1. Key repeat fastest, delay until repeat shortest.
   1. Turn off keyboard backlight after 5s
   1. Remap caps lock to escape.
   1. Extra maps for PC keyboard. Set to ISO, swap option and command
   1. Use standard function keys on external keyboards
   1. Shortcuts -> Input sources -> disable ^-space for "previous input source" -
      it's my tmux prefix.
   1. Disable smart quotes
1. Trackpad
   1. Allow tap to click
   1. Scroll and zoom: untick natural scroll
1. Displays
   1. On the pro 16", default scaling seems sensible: looks like 1792x1120, on
      the 3072x1920 screen.
   1. Enable night shift
1. Battery
   1. Power adapter: prevent computer from sleeping automatically
1. Spotlight
   1. Privacy: exclude ~/workspace to avoid mds_stores doing work every time I
      compile things.
1. TouchID for sudo (personal laptop only)
   1. Add `auth sufficient pam_tid.so` to 2nd line of `/etc/pam.d/sudo`
   1. Set up <https://github.com/fabianishere/pam_reattach>
   1. This appears to be reset by certain OS updates, so I don't actually tend
      to have this enabled.
