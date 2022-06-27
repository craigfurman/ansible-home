# vi: ft=ruby

brew 'azure-cli'
brew 'gh'
brew 'git-trim'
brew 'graphviz'
brew 'k3d'
brew 'pinentry-mac'
brew 'postico'
brew 'python'
brew 'redis', restart_service: :changed
brew 'stern'

# TODO must manually pin icu4c to whatever gets installed by postgres. There are
# no `@` versions for icu4c
brew 'postgresql@13', link: true, restart_service: :changed # brew pin postgresql@13

tap 'universal-ctags/universal-ctags'
brew 'universal-ctags', args: ['HEAD']

# casks
cask 'aws-vault'
cask 'intel-power-gadget' # for istat-menus CPU frequency monitoring
cask 'notion'
cask 'vagrant'
cask 'virtualbox'
cask 'visual-studio-code'

# mac app store
# Be focused
