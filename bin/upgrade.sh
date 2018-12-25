#!/usr/bin/env bash
set -euo pipefail

cat "$(dirname "$0")/upgrade__$(uname).sh"
