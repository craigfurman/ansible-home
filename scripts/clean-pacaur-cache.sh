#!/usr/bin/env bash
set -euo pipefail

cache_dir=~/.cache/pacaur
for aur_pkg in $cache_dir/*
do
  git -C "$aur_pkg" clean -fd
done

rm -f "$cache_dir"/**/*.z
