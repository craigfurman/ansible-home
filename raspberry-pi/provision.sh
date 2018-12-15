#!/usr/bin/env bash
set -euo pipefail

# Create ~/ansible_vault_password if it doesn't already exist from the lastpass entry
ansible-playbook -i 192.168.0.105, --vault-password-file ~/ansible_vault_password \
  "$(dirname "$0")/ansible-playbook.yml"
