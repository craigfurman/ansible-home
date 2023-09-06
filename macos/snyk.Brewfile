# vi: ft=ruby

brew 'azure-cli'
brew 'cmake'
brew 'gh'
brew 'git-trim'
brew 'graphviz'
brew 'k3d'
brew 'pinentry-mac'
brew 'python'
brew 'redis', restart_service: :changed
brew 'stern'
brew 'teleport'

# TODO must manually pin icu4c to whatever gets installed by postgres. There are
# no `@` versions for icu4c
brew 'postgresql@14', link: true, restart_service: :changed

tap 'universal-ctags/universal-ctags'
brew 'universal-ctags', args: ['HEAD']

# casks
cask 'aws-vault'
cask 'notion'
cask 'postico'
cask 'visual-studio-code'

# This VM tooling is on the naughty step for a bit
# cask 'vagrant'
# cask 'virtualbox'

# Came pre-installed on laptop, but after 1.5 years I had to remove and
# reinstall it due to an un-applyable update, apparently...
# cask 'zoom'

# mac app store
# Be focused
