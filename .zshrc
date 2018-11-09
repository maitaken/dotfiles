# Created by newuser for 5.6.2
export ZPLUG_HOME=/usr/local/opt/zplug
setopt IGNOREEOF

export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
eval "$(pyenv init -)"

export LC_ALL=ja_JP.UTF-8
export LANG=ja_JA.UTF-8

alias cot=' open $1 -a /Applications/CotEditor.app '

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

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

PROMPT="%{$fg[green]%}[%n]%(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
