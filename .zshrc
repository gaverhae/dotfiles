# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose false
zstyle :compinstall filename '/Users/gary/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory autocd beep extendedglob nomatch
unsetopt notify
bindkey -v
# End of lines configured by zsh-newuser-install

source ~/.env_vars
source ~/.bash_aliases

unsetopt sharehistory
bindkey '^?' backward-delete-char
autoload history-search-end
zle -N history-beginning-search-backward-end \
    history-search-end
zle -N history-beginning-search-forward-end \
    history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

setopt incappendhistory histignorealldups histfindnodups

autoload -U colors
colors

foreach cmd (locate find wget)
    alias $cmd="noglob $cmd"
end


function hg_prompt_info {
    hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<\
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

setopt PROMPT_SUBST
PROMPT=$'%{$fg[green]%}[%T]%{$reset_color%}%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%~%{$reset_color%}$(hg_prompt_info)
%{$fg_bold[yellow]%}[%h]%{$reset_color%}$ '

#export GPG_AGENT_INFO_FILE=$HOME/.gpg-agent-info
#gpg-agent --daemon --enable-ssh-support --write-env-file "${GPG_AGENT_INFO_FILE}"
#
#if [ -f "${GPG_AGENT_INFO_FILE}" ]; then
#    . "${GPG_AGENT_INFO_FILE}"
#    export GPG_AGENT_INFO
#    export SSH_AUTH_SOCK
#    export SSH_AGENT_PID
#fi

if [ $EUID -ne 0 ] ; then
    envfile="$HOME/.gnupg/gpg-agent.env"
    if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
        eval "$(cat "$envfile")"
    else
        eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
    fi
    export GPG_AGENT_INFO  # the env file does not contain the export statement
    export SSH_AUTH_SOCK   # enable gpg-agent for ssh
fi

export GPG_TTY=$(tty)

export JAVA_HOME=$(/usr/libexec/java_home)
