# ~/.bashrc
#
# Safer Bash defaults
set -o noclobber   # prevent overwriting files accidentally
# set -o nounset     # error on unset variables
set -o pipefail    # fail pipelines on any error
set -o vi

# Bash usability enhancements
shopt -s autocd          # just type directory name to cd
shopt -s cdspell         # auto-fix minor typos in 'cd'
shopt -s checkwinsize    # fix terminal size on resize
shopt -s cmdhist         # multi-line commands = 1 history entry
shopt -s dirspell        # auto-correct directory names when completing
shopt -s extglob         # enable extended glob patterns
shopt -s globstar        # enable ** recursive globbing
shopt -s histappend      # append to history file instead of overwriting

# Prompt customization
if tput setaf 1 &>/dev/null; then
  # Colored PS1 prompt
  PS1='\[\e[38;5;254;1m\][$?] \W $\[\e[0m\] '
  PS2="> "
else
  PS1='[$?] \w $ '
  PS2="> "
fi

# Aliases for productivity
alias l='eza -1'
alias la='eza -lah'
alias ll='eza -lh'
alias ls='eza -l'
alias cdroid="cd /run/user/1000/gvfs/mtp:host=realme_SM8350-IDP__SN%3AFAC71CD6_fac71cd6"
alias cls='clear'
alias clr='clear'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias journal='vim "journal_$(date +%Y%m%d-%H%M%S).txt"'
alias path='echo -e ${PATH//:/\\n}'
alias pbal="powerprofilesctl set balanced"
alias pperf="powerprofilesctl set performance"
alias psave="powerprofilesctl set power-saver"
alias play="cat ~/.misc/op-ed.txt | fzf-tmux | cut -d'|' -f 2 | xargs mpv --profile=fast --ytdl-format='bestvideo[height<=1440]+bestaudio/best'"
alias pl="mpv --ytdl-format='bestvideo[height<=1080]+bestaudio/best' "
alias v="vim -p"
alias vi="vim -p"
alias vim="vim -p"
alias nvim="vim -p"
alias :q="exit"
alias :x="exit"

_mz(){
    local path="$(fzf)"
    local type=$(file --mime-type -b "$path" )
    [[ "$type" =~ ^(video|audio)/ ]] && mpv "$path"
}

alias mz=_mz

# Git shortcuts
alias ga='git add .'
alias gb='git branch -a'
alias gc='git commit -S -m'
alias gco='git checkout'
alias gp='git push'
alias gs='git status'

# Safer defaults
alias rm='trash'
alias mv='mv -i'
alias cp='cp -i'

# Enable colorized man pages
man() {
    LESS_TERMCAP_mb=$'\e[1;31m' \
    LESS_TERMCAP_md=$'\e[1;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
    command man "$@"
}

eval "$(thefuck --alias fk)"
eval "$(zoxide init bash)"
