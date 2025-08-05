#
# ~/.bash_profile
#

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

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export MANPAGER='nvim +Man!'
export _JAVA_AWT_WM_NONREPARENTING=1
export GPG_TTY=$(tty)
export EDITOR=vim
