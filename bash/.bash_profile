# ~/.bash_profile

# Source .bash_env if exists
[[ ! -n "$_BASH_ENV_LOADED" ]] && [[ -f ~/.bash_env ]] && . ~/.bash_env

# Load .bashrc manually if interactive shell
[[ $- == *i* ]] && [[ -f ~/.bashrc ]] && . ~/.bashrc
