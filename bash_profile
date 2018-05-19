eval $( ssh-agent -t 120m ) > /dev/null
[[ -r "$HOME/.profile" ]] && . "$HOME/.profile"
[[ -r "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
