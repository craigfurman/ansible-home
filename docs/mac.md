# mac

## Initial setup

Configure keyboards and mouse:

1. Ensure external keyboard properly configured as either ISO or ANSI.
   Currently, my UK PC keyboard is ISO. The built-in US keyboard is ANSI. If not
   sure, this can be reset later using `sudo open
   /System/Library/CoreServices/KeyboardSetupAssistant.app/Contents/MacOS/KeyboardSetupAssistant`
1. Input sources -> Add British PC layout
1. You might now need to disable c-space shortcut that switches input source
1. All keyboards: remap caps lock to escape
1. Windows keyboards: swap super (cmd) and option (alt).

Install Homebrew. `cd macos && brew bundle`.

Run ansible:

```
ansible-playbook --vault-password-file=ansible-home-secrets/ansible_vault_password \
  -i inventory/pcs pcs.yml
```
