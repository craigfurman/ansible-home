#!/usr/bin/env bash
set -euo pipefail

abs_linux=~/abs/linux
rm -rf "$abs_linux"
asp update

(
cd "$(dirname "$abs_linux")"
asp checkout linux
(
cd linux/repos/core-x86_64
sed -i s/pkgbase=linux/pkgbase=linux-userns/g PKGBUILD
sed -i 's/#\sCONFIG_USER_NS.*$/CONFIG_USER_NS=y/g' config.x86_64
updpkgsums
makepkg -s
)
)
