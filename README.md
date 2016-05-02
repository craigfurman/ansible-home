# ansible-home

This is probably totally un-idiomatic Ansible. Ideally, these playbooks will only install stuff, configuration lives in my [dotfiles repo](https://github.com/craigfurman/home).

## Todo
* All the things in my drive doc.
* Latest home repo should be synced every time
* Google music manager (https://dl.google.com/linux/direct/google-musicmanager-beta_current_amd64.deb)
* vagrant-vbox-snapshot Vagrant plugin
* upgrade git apps: don't just install them once

## Running
1. `bash -c "$(curl -sSL https://raw.githubusercontent.com/craigfurman/ansible-home/master/bootstrap.sh)"`
1. Install Go using `whichgo`
1. Install Ruby using `ruby-install`
1. Install direnv with `make` (requires Go)
1. update vimfiles after installing Go
