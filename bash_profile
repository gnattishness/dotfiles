if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

eval $( ssh-agent -t 120m ) > /dev/null

# at the very bottom because of shims being added
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
