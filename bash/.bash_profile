#
# ~/.bash_profile
#

export EDITOR=vim
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CONFIG_HOME="$HOME/.config"

[[ -f ~/.bashrc ]] && . ~/.bashrc

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
# . "/home/ayanaksha/.deno/env"

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

# Setup: pyenv
export PYENV_ROOT="$HOME/.pyenv"
[ -d $PYENV_ROOT/shims ] && export PATH=$PATH:$PYENV_ROOT/shims;
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$( pyenv init --path )"
fi
