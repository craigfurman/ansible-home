# Uncomment this and the bottom line to enable profiling
# zmodload zsh/zprof

if [ -x /usr/libexec/path_helper ]; then
  unset PATH
  unset MANPATH
  eval `/usr/libexec/path_helper -s`
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

eval "$("$__brew_prefix_pre_shellenv/bin/brew" shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1

FPATH=$HOMEBREW_PREFIX/share/zsh-completions:$FPATH

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
alias notify_command_done="osascript -e 'display notification \"is finished\" with title \"Shell Command\"'"

# Env vars
export MAKEFLAGS="-j$(nproc)"
export GPG_TTY=$TTY

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
export PATH=$PATH:$GOPATH/bin

# java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# rust
[[ ! -f $HOME/.cargo/env ]] || source $HOME/.cargo/env

# Ruby
alias be="bundle exec"

# rg
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# fzf
export FZF_DEFAULT_COMMAND='rg --smart-case --hidden --files --glob !.git'

# direnv
export ASDF_DIRENV_BIN="$(command -v direnv)" # or `$(command -v direnv)` for system managed.
eval "$($ASDF_DIRENV_BIN hook zsh)"
alias da="direnv allow"

# Github
alias mkpr="hub pull-request"

# tanka
complete -o nospace -C $(which tk) tk

# AWS
complete -C '/usr/local/bin/aws_completer' aws

# gcloud
source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

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
  git clone --recursive "$1" "$loc"
  cd "$loc"
}

killp() {
  local sig="${1:--TERM}"
  ps -ef | fzf --multi | awk '{print $2}' | xargs kill "${sig}"
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

openproj() {
  local proj=$1
  local new_window_and_pane=$(tmux new-window -c "$proj" -P -F "#{window_id} #{pane_id}")
  local window_id=$(echo "$new_window_and_pane" | awk '{print $1}')
  local editor_pane=$(echo "$new_window_and_pane" | awk '{print $2}')
  local name="$(basename "$proj")"
  tmux rename-window -t "${window_id}" "$name"

  # quick-and-dirty layout: open a pane only to kill it later, giving the editor
  # pane the top 3/4 of the screen
  local spacer_pane=$(tmux split-window -v -P -F "#{pane_id}")
  local shell_pane=$(tmux split-window -c "$proj" -v -P -F "#{pane_id}")
  tmux kill-pane -t "${spacer_pane}"
  tmux send-keys -t "${editor_pane}" "vim" Enter
  tmux select-pane -t "${editor_pane}"
}

viewcert() {
  yes | openssl s_client -connect "${1}:${2:-443}" | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509  -text -noout
}

runInDir() {
  local dir=$1
  shift
  sh -c "cd $dir && $*"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment this and the top line to enable profiling
# zprof
