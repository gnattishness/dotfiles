umask 077

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [ -d "$XDG_CONFIG_HOME/nvm" ] ; then
    export NVM_DIR="$XDG_CONFIG_HOME/nvm"
elif [ -d "$HOME/.nvm" ] ; then
    export NVM_DIR="$HOME/.nvm"
fi

if [ -d "$HOME/.cargo" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.poetry" ] ; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi

if [ -d "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

# TODO have a trusted "go tools" path that is added to PATH
# and in GOPATH, but by default `go get` doesn't install there
if [ -d "$HOME/go" ] ; then
    export PATH="$HOME/go/bin:$PATH"
fi


# TODO check is this ok to have here, cuz depends on the shell
# uses bashisms?
# at the very bottom because of shims being added
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval $( ssh-agent -t 120m ) > /dev/null

export EDITOR=vim

