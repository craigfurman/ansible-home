#!/usr/bin/env bash
set -euo pipefail

brew update
brew upgrade
brew cask upgrade
brew cleanup
