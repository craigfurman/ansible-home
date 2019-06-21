#!/usr/bin/env bash
set -euo pipefail

brew update
brew upgrade --ignore-pinned
brew cask upgrade --greedy
brew cleanup
