#!/usr/bin/env bash
set -euo pipefail

# I'm not sure whether to be proud of, or horrified by, this.
clean_outdated_aur_packages() {
  comm -3 \
    <(tar -tvf *.db 2>/dev/null | awk '{print $6}' | grep -E '.+/$' | sed 's/\///g' | sort) \
    <(ls | grep pkg.tar.xz | sed 's/\-any\.pkg\.tar\.xz//g' | sed 's/\-x86_64\.pkg\.tar\.xz//g' | sort) \
    | xargs -L1 -I% bash -c 'rm %*'
}

auroot=/media/morty/aur-packages
cd "$auroot"
aur sync --database craig --root "$auroot" --no-confirm --no-view -u
clean_outdated_aur_packages
