TODO
====

* update vim plugins?
* leave stub or included vim/bash sourced files,
  for system unique configurations?

* ssh, gpg configs as much as is safe

    * example configs

* install common software - taskwarrior, texlive,
  but only if prompted

* pipsi installs: black, mypy, awscli?
  - probably want to prompt before larger software installs

* does homely create lines in the file if the file doesn't exist

* modify homely to allow custom revert for system calling

* organize included dotfiles more neatly
* install pipsi if doesn't already exist
* install homely.py dependencies in a virtualenv (only later if we want jinja etc)

* homely can potentially use virtualenvs in the same way that pipsi get-pipsi.py
  does (to get the system python)
  sys.real_prefix
 
* how does pipsi handle being called, if already in a venv?
 
* au apt location if not already configured

* do i want homely be run as sudo or not?
* poetry via pipsi?
 
* pipsi updating pip, setuptools inside the venv
 
* build latest vim from source or add jonathonf apt repo
 
* split up into separate sections, functions/directories
 
* get more up-to-date haskell vim plugins
 
* rst vim plugins
 
* troubleshoot why pyenv init takes so long in .bashrc
* if using pyenv installer, can upgrade using ``pyenv update``

* pyenv autocomplete?

* move node version manager config to xdg_config_home

* add ./stack/config.yaml base, and ~/.stack/global-project/stack.yaml
  pycodestyle config in dotfiles

* haskell ide_engine update without having to git pull

* create xdg_data_home/lsp?
* pip3 install neovim to base package
