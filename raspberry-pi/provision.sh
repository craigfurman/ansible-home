#!/usr/bin/env bash
set -euo pipefail

ansible-playbook -i tiny-rick.local, "$(dirname "$0")/ansible-playbook.yml"
