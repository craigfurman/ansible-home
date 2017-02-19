# ansible-home

This is probably totally un-idiomatic Ansible. Ideally, these playbooks will only install stuff, configuration lives in my [dotfiles repo](https://github.com/craigfurman/home).

## Todo
* rtl8812au-dkms (wifi adapter driver) for desktop only
* Google music manager (https://dl.google.com/linux/direct/google-musicmanager-beta_current_amd64.deb)
* vagrant-vbox-snapshot Vagrant plugin
* transmission ppa
* rethink apt packages and ppas
* docker installation process has changed
* Install/update Luan's vim congiguration

## Running
1. `bash -c "$(curl -sSL https://raw.githubusercontent.com/craigfurman/ansible-home/master/bootstrap.sh)"`
1. Install Ruby using `ruby-install`
1. Install [vim configuration](https://github.com/luan/vimfiles)
