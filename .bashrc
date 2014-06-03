# If not running interactively, don't do anything
source ~/.env_vars

[ -z "$PS1" ] && return
export PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '


# History
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTCONTROL=ignoredups

# X Environment
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi
if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi
complete -cf sudo
