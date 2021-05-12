# Mac setup

Ironically for an automation repo, I currently configure a few things on my work
Mac laptop via the GUI. I figure that if these settings move / change their
options / and removed, it'll be easier to learn that through the GUI.

A lot of this is automatable (<https://mths.be/macos> /
<https://github.com/mathiasbynens/dotfiles/blob/master/.macos>), and I might
crib from that in the future.

## TODO

1. The font smoothing setting appears to have been removed - review on external
   display. Looks good on laptop.
1. Bring back autokbisw, even though it's not maintained, or is `^-option-space`
   sufficient?
1. Widgets

## The settings

Unless otherwise spelt out, start in "System Preferences"

1. General
  1. Appearance: auto
1. Dock and menu bar
  1. automatically hide the dock
1. Users and Groups
  1. Login items: add flycut. Shiftit should have an option in its own settings
     to do this.
1. Security and privacy
  1. Filevault: yes
1. Sound
  1. Disable startup sound
1. Keyboard
  1. Key repeat fastest, delay until repeat shortest.
  1. Turn off keyboard backlight after 5s
  1. Remap caps lock to escape
  1. Use standard function keys on external keyboards
  1. Shortcuts -> Input sources -> disable ^-space for "previous input source" -
     it's my tmux prefix.
1. Trackpad
  1. Allow tap to click
  1. Scroll and zoom: untick natural scroll
1. Displays
  1. On the pro 16", default scaling seems sensible: looks like 1792x1120, on
     the 3072x1920 screen.
  1. Enable night shift
1. Battery
  1. Power adapter: prevent computer from sleeping automatically

## ssh

I currently use a dedicated ssh key per laptop. The one on my work Mac is the
only one I use for work, and is SSO-authorized for <https://github.com/snyk>.

```
ssh-keygen -t ed25519 -C 'craig@snyk'
```

Or whatever the state of the art type is. [GitHub's own
docs](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
are possibly a good place to look for this.

`~/.ssh/config.d/mac`, version-controlled in this repo, ensures that the
passphrase will be saved in the keychain.

## gpg

I use gpg to sign commits on my work Mac laptop only. The passphrase is stored
in the keychain by pinentry-mac (by ticking the relevent box on first pin
entry). `gpg-agent.conf` is version-controlled in this repo.
