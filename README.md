# ansible-home

My Arch Linux config.

## TODO

1. Aurutils stuff
1. Font config
1. macos: gpg-agent.conf
1. Automate ~/bin symlinkery?

## First run
1. `bash -c "$(curl -sSL https://raw.githubusercontent.com/craigfurman/ansible-home/master/bootstrap.sh)"`
1. This might fail the first time due to PGP signatures for an AUR package not
   being verified. I didn't want to automate the receiving of PGP keys, as this
   feels like it would defeat the point of PGP. Use `gpg --recv-keys <key>` if
   happy to import the key.
1. Check limitations and TODO sections
1. In tmux, prefix+I to install plugins.
1. `~/.vim/update`

## Subsequent runs
1. `run.sh`
1. In tmux, prefix+U to update plugins.
1. `vim-update`
