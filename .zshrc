export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

case ${OSTYPE} in
	darwin*)
		 export PYENV_ROOT=/usr/local/var/pyenv
		 if [ -x "`which pyenv`" ]; then
			 eval "$(pyenv init -)"
		 fi


			alias cot='open $1 -a /Applications/CotEditor.app '   	
		;;
	linux*)
		;;
esac

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias lc='colorls -lA --sd'

# define environment variable
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH

export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# define alias
alias g='git'
alias gs='git status'
alias ga='git add'
alias gl='glt log'
alias gp='git push'
alias gc='git commit'

if type "nvim" > /dev/null 2>&1; then
	alias v="nvim"
	alias vi="nvim"
	alias vim="nvim"
fi

# alias

TERM=xterm-256color
autoload -Uz colors
autoload -Uz compinit
colors
compinit

zplug "bhilburn/powerlevel9k", use:"powerlevel9k.zsh-theme"

source ${HOME}/dotfiles/tony_config.zsh

if ! zplug check --verbose; then
  zplug install
fi

zplug load
