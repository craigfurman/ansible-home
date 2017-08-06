#!/bin/bash
set -euo pipefail

tags() {
  if [[ "$(hostname)" == *desktop* ]]; then
    echo "desktop"
    return 0
  elif [[ "$(hostname)" == *laptop* ]]; then
    echo "laptop"
    return 0
  else
    echo "unrecognised hostname: $(hostname)" >&2
    exit 1
  fi
}

(
cd "$(dirname "$0")"
ansible-playbook --ask-become-pass -i localhost, --con local --tags "$(tags)" playbook.yml
)
