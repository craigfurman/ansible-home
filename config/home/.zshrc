# Uncomment this and the bottom line to enable profiling
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# homebrew
__brew_prefix_pre_shellenv=/usr/local
if [ -d /opt/homebrew ]; then
  __brew_prefix_pre_shellenv=/opt/homebrew
fi

# https://github.com/Homebrew/brew/issues/11883
unset HOMEBREW_SHELLENV_PREFIX

eval "$("$__brew_prefix_pre_shellenv/bin/brew" shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1

# oh-my-zsh
plugins=(docker git golang)
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# asdf-vm
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# General aliases
alias ll='ls -alh'
alias diff='diff --color=auto'
alias viknownhosts='vim ~/.ssh/known_hosts'

# Env vars
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export XZ_OPT="-T0 -0"
export MAKEFLAGS="-j$(nproc)"
export GPG_TTY=$(tty)

# GNUtils
for gnutil in coreutils grep gnu-tar gnu-sed gawk findutils make ; do
  export PATH="$HOMEBREW_PREFIX/opt/$gnutil/libexec/gnubin:$PATH"
  export MANPATH="$HOMEBREW_PREFIX/opt/$gnutil/libexec/gnuman:$MANPATH"
done

# fzf
source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"
source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

# More brew PATH
export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"
export MANPATH="$HOMEBREW_PREFIX/opt/curl/share/man:$MANPATH"

# Vim
export EDITOR=nvim
alias vim=nvim
alias vimdiff="nvim -d"

# git
alias git443='GIT_SSH_COMMAND="ssh -F ~/.ssh/config_altssh" git'

# Go
export GOPATH=$HOME/workspace/go
export PATH=$GOPATH/bin:$PATH

# Ruby
alias be="bundle exec"

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# rg
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# fzf
export FZF_DEFAULT_COMMAND='rg --smart-case --hidden --files --glob !.git'

# direnv
eval "$(asdf exec direnv hook zsh)"
direnv() { asdf exec direnv "$@"; }
alias da="direnv allow"

# Github
alias mkpr="hub pull-request"

# tanka
complete -o nospace -C $(which tk) tk

# krew
# See https://krew.sigs.k8s.io/docs/user-guide/setup/install/ for installation
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# gcloud
source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# functions
test_terminal_colors_fonts() {
  echo -e "\e[1mbold\e[0m"
  echo -e "\e[3mitalic\e[0m"
  echo -e "\e[4munderline\e[0m"
  echo -e "\e[9mstrikethrough\e[0m"
  echo -e "\e[31mHello World\e[0m"
  echo -e "\x1B[31mHello World\e[0m"
  awk 'BEGIN{
      s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
      for (colnum = 0; colnum<77; colnum++) {
          r = 255-(colnum*255/76);
          g = (colnum*510/76);
          b = (colnum*255/76);
          if (g>255) g = 510-g;
          printf "\033[48;2;%d;%d;%dm", r,g,b;
          printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
          printf "%s\033[0m", substr(s,colnum+1,1);
      }
      printf "\n";
  }'
}

gclone() {
  local loc="$(echo "$1" | sed 's/^git@//g' | sed 's/^https:\/\///g' | sed 's/\.git$//g' | sed 's/:/\//g')"
  cd ~/workspace
  git clone "$1" "$loc"
  cd "$loc"
}

killp() {
  local sig="${1:--TERM}"
  kill "${sig}" "$(ps -ef | fzf | awk '{print $2}')"
}

rmknownhost() {
  sed -i "${1}d" ~/.ssh/known_hosts
}

gitpulldir() {
  for repo in $(find -maxdepth 1 -mindepth 1 -type d); do
    if ! git -C "${repo}" diff --exit-code > /dev/null ; then
      echo "warning: diff found in ${repo}"
      continue
    fi

    local current_branch="$(git -C "${repo}" rev-parse --abbrev-ref HEAD)"
    if [ "${current_branch}" != "master" ]; then
      echo "warning: ${repo} is on ${current_branch}, not master"
      continue
    fi

    (
      echo "${repo}"
      git -C "${repo}" pull
    ) &
  done

  wait
}

viewcert() {
  yes | openssl s_client -connect "${1}:${2:-443}" | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509  -text -noout
}

kube_namespace() {
  ns=$(kubectl config view --minify --output jsonpath='{..namespace}')
  if [ "${ns:-}" = "" ]; then
    ns="default"
  fi
  echo "$ns"
}

# A lot like kube-ps1, but not loaded with every shell. It was slowing down my
# shell startup time too much, even with "kubeoff".
kprompt() {
  PREKUBE_PROMPT=$PROMPT
  PROMPT=$(echo $PROMPT | sed -E '1 s/$/<⎈ $(kubectl config current-context)|$(kube_namespace)>/')
}
kunprompt() {
  PROMPT=$PREKUBE_PROMPT
}

# https://github.com/kubernetes/kubernetes/issues/59078#issuecomment-363384825
function kubectl() {
  if ! type __start_kubectl >/dev/null 2>&1; then
    source <(command kubectl completion zsh)
  fi

  command kubectl "$@"
}
alias k='kubectl'

if [ -f ~/.zshrc_machine_specific ]; then
  source ~/.zshrc_machine_specific
fi

if [ -f ~/.zshrc_secrets ]; then
  source ~/.zshrc_secrets
fi

# Uncomment this and the top line to enable profiling
# zprof
