# ansible-home

My Arch Linux config.

## Known limitations

1. Didn't attempt to install google-musicmanager from AUR due to having to build qtwebkit in a clean chroot, which takes over an hour. Leaving this as a manual step.

## TODO

1. Font config
1. Rust
1. ngrok

### Vim
1. ctrl+p fzf file picker
1. ,b recent buffers
1. autocomplete brackets
1. vim-go
1. rust-vim
1. enter for save
1. funky-fresh colorscheme
1. NERDTree (\, |, r all work)
1. version control .vimrc
1. version control ~/.config/nvim/init.vim
1. space noh
1. git views
1. seamless tmux
1. golang noexpandtab
1. First tab on a line doesn't turn into spaces
1. 50-char max git commit messages

## First run
1. `bash -c "$(curl -sSL https://raw.githubusercontent.com/craigfurman/ansible-home/master/bootstrap.sh)"`
1. Check limitations and TODO sections
1. In tmux, prefix+I to install plugins.

## Subsequent runs
1. `run.sh`
