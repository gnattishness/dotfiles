umask 077

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.yarn/bin" ]; then
    export PATH="$HOME/.yarn/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export JAVA_HOME="/usr/lib/jvm/default/"
export GO111MODULE=on #default to go modules

if [ -d "$HOME/.cargo" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.poetry" ]; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi

# find asdf-vm installation if present
if [ -d "$XDG_CONFIG_HOME/asdf" ]; then
    export ASDF_DIR="$XDG_CONFIG_HOME/asdf"
elif [ -d "/opt/asdf-vm" ]; then
    # location used by arch package
    export ASDF_DIR="/opt/asdf-vm"
elif [ -d "$HOME/.asdf" ]; then
    export ASDF_DIR="$HOME/.asdf"
else
    # Don't try to initialize other version managers if asdf-vm is present
    if [ -d "$HOME/.pyenv" ]; then
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
    fi
    if [ -d "$XDG_CONFIG_HOME/nvm" ]; then
        export NVM_DIR="$XDG_CONFIG_HOME/nvm"
    elif [ -d "$HOME/.nvm" ]; then
        export NVM_DIR="$HOME/.nvm"
    fi
fi

# TODO have a trusted "go tools" path that is added to PATH
# and in GOPATH, but by default `go get` doesn't install there
if [ -d "$HOME/go" ]; then
    export PATH="$HOME/go/bin:$PATH"
fi

eval $(ssh-agent -t 120m) >/dev/null

export EDITOR=vim
