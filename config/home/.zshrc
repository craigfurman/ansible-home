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

# oh-my-zsh
plugins=(git go kubectl zsh-nvm)
if [ "$(uname)" = "Linux" ]; then
  plugins+=(man systemd)
fi

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

# General aliases
alias ll='ls -alh'
alias diff='diff --color=auto'
alias viknownhosts='vim ~/.ssh/known_hosts'

# Env vars
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export XZ_OPT="-T0 -0"
export MAKEFLAGS="-j$(nproc)"

# Vim
export EDITOR=nvim
alias vim=nvim
alias vimdiff="nvim -d"

# Go
export GOPATH=$HOME/workspace/go
export PATH=$GOPATH/bin:$HOME/languages/go/1.13.5/go/bin:$PATH

# Ruby
alias be="bundle exec"

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# rg
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# fzf
export FZF_DEFAULT_COMMAND='rg --smart-case --hidden --no-ignore-vcs --files --glob !.git --glob !vendor'

# direnv
eval "$(direnv hook zsh)"
alias da="direnv allow"

# ssh authentication via gpg
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

# Github
alias mkpr="hub pull-request"

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
  local should_exit=0

  for repo in $(ls); do
    if ! git -C "${repo}" diff --exit-code > /dev/null ; then
      echo "diff found in ${repo}"
      should_exit=1
    fi

    local current_branch="$(git -C "${repo}" rev-parse --abbrev-ref HEAD)"
    if [ "${current_branch}" != "master" ]; then
      echo "${repo} is on ${current_branch}, not master"
      should_exit=1
    fi
  done

  if [ "${should_exit}" -ne 0 ]; then
    return 1
  fi

  ls | xargs -P0 -I% git -C % pull
}

source ~/.zshrc_os_specific

if [ -f ~/.zshrc_machine_specific ]; then
  source ~/.zshrc_machine_specific
fi

if [ -f ~/.zshrc_secrets ]; then
  source ~/.zshrc_secrets
fi
