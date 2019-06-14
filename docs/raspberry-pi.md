# raspberry-pi

## TODO

1. Unattended upgrades (with a way to know when the pi needs a reboot). Ensure Docker is
   upgraded with unattended upgrades.

## Initial setup

Download the latest [Raspbian Lite](https://www.raspberrypi.org/downloads/raspbian/).

`dd bs=4M if=2018-11-13-raspbian-stretch.img of=/dev/sdX conv=fsync`. This image contains
boot and root partitions, and a bootloader.
[Source](https://www.raspberrypi.org/documentation/installation/installing-images/linux.md).

As tempting as it may be, don't resize the root partition and filesystem to take up the
rest of the SD card. This is automatically done by Raspbian on first boot.

Mount the boot partition and `touch <boot mountpoint>/ssh`. This avoids ever having to
plug the pi into a monitor and keyboard just to enable the ssh service. openssh-server is
already installed in the image.
[Source](https://www.raspberrypi.org/documentation/remote-access/ssh/).

Unmount any mounted SD card partitions, pop the card into the PI, and put it somewhere
unobtrusive where it has power and ethernet.

Log in: Inital credentials are pi/raspberry. Immediately change pi's password with passwd.
This is also a good time to `ssh-copy-id` my public key to the pi. pi is a passwordless
sudoer.

Change the hostname: `sudo hostnamectl set-hostname tiny-rick`. Change the hostname ->
loopback entry in /etc/hosts.

Give the pi a static IP. I want to use it as a DNS server, so I can't have my router
moving it around.

## Notes

After first boot, /etc/localtime was already a symlink to
/usr/share/zoneinfo/Europe/London.
