# ansible-home

This is probably totally un-idiomatic Ansible. Ideally, these playbooks will only install stuff, configuration lives in my [dotfiles repo](https://github.com/craigfurman/home).

## Todo
* Google music manager (https://dl.google.com/linux/direct/google-musicmanager-beta_current_amd64.deb)
* vagrant-vbox-snapshot Vagrant plugin
* transmission ppa
* rethink apt packages and ppas
* docker installation process has changed

## Running
1. `bash -c "$(curl -sSL https://raw.githubusercontent.com/craigfurman/ansible-home/master/bootstrap.sh)"`
1. Install Ruby using `ruby-install`

## Ubuntu desktop stuff

### Get a newer kernel and graphics stack

`sudo apt-get install --install-recommends linux-generic-hwe-16.04 xserver-xorg-hwe-16.04`

### Fix text scaling issues

1. In screen display settings, adjust scale factor as appropriate.
1. In `/usr/share/applications/google-chrome.desktop`, add `--force-device-scale-factor=n` to each `Exec=` line. [Source](http://stackoverflow.com/questions/37935305/how-to-fix-chromium-hidpi-scaling)
