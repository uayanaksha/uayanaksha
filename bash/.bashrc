[[ $- != *i* ]] && return

# Use bash-completion, if available
# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion

eval "$(thefuck --alias fk)"
eval "$(zoxide init bash)"

# Activate aliases
[[ $PS1 && -f ~/.misc/.aliases ]] && . ~/.misc/.aliases

# import env vars
[[ -f ~/.bash_env ]] && . ~/.bash_env

# Setup: android-studio
# export ANDROID_HOME=$HOME/Android/Sdk
# [ -d $ANDROID_HOME/emulator ] && export PATH=$PATH:$ANDROID_HOME/emulator;
# [ -d $ANDROID_HOME/platform-tools ] && export PATH=$PATH:$ANDROID_HOME/platform-tools;

# Setup: bun
export BUN_INSTALL=$HOME/.bun
[ -d $BUN_INSTALL/bin ] && export PATH=$PATH:$BUN_INSTALL/bin;

# Setup: cargo
export CARGO_HOME=$HOME/.cargo;
[ -d $CARGO_HOME/bin ] && export PATH=$PATH:$CARGO_HOME/bin;

# Setup: deno 
export DENO_INSTALL_ROOT=$HOME/.deno/bin;
export DENO_DIR=$HOME/.deno/cache;
[ -d $HOME/.deno/bin ] && export PATH=$PATH:$HOME/.deno/bin;
. "/home/ayanaksha/.deno/env"

# local exec
[ -d $HOME/.local/bin ] && export PATH=$PATH:$HOME/.local/bin;

# Setup: golang
export GOPATH=$HOME/go;
export GOBIN=$GOPATH/bin;
[ -d $GOBIN ] && export PATH=$PATH:$GOBIN;

# Setup: java-17
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
[ -d $JAVA_HOME/bin ] && export PATH=$PATH:$JAVA_HOME/bin;

# Setup: nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
[[ -e /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# Setup: pyenv
export PYENV_ROOT="$HOME/.pyenv"
[ -d $PYENV_ROOT/shims ] && export PATH=$PATH:$PYENV_ROOT/shims;
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$( pyenv init --path )"
fi

[[ -x /usr/bin/fastfetch ]] && /usr/bin/fastfetch
