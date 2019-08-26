# Created by newuser for 5.6.2
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
eval "$(pyenv init -)"

export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH

export LC_ALL=ja_JP.UTF-8
export LANG=ja_JA.UTF-8

if [ "$(uname)" = "Darwin" ]; then  
  alias cot='open $1 -a /Applications/CotEditor.app '
fi

alias ll='ls -l'

TERM=xterm-256color

autoload -Uz colors
colors
autoload -Uz compinit
compinit
autoload colors
colors

autoload -Uz vcs_info

setopt prompt_subst
setopt share_history
setopt histignorealldups
setopt IGNOREEOF

# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
# zstyle ':vcs_info:*' actionformats '[%b|%a]'

# RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
# precmd () { vcs_info }

# PROMPT="%{$fg[green]%}[%n]%(!.#.$) %{$reset_color%}"
# PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
# SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
# RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

# RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

zplug "bhilburn/powerlevel9k", use:"powerlevel9k.zsh-theme"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uE868  %Y-%m-%d}"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir vcs virtualenv)
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="green"
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=7

if ! zplug check --verbose; then
  zplug install
fi

zplug load
