[[ $- != *i* ]] && return

shopt -s histappend
shopt -s autocd
shopt -s checkwinsize
set -o vi

HISTFILE=~/.bash_history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=10000
HISTFILESIZE=20000

PS1='\[\e[38;5;254;1m\][$?] \w $\[\e[0m\] '
PS2="> "

eval "$(thefuck --alias fk)"
export MANPAGER='nvim +Man!'
export GPG_TTY=$(tty)

# Use bash-completion, if available
# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion

# Activate aliases
[[ $PS1 && -f ~/.misc/.aliases ]] && . ~/.misc/.aliases

# import env vars
[[ -f ~/.bash_env ]] && . ~/.bash_env

[[ -e /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# Activate deno
. "/home/ayanaksha/.deno/env"
