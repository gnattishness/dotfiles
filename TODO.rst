TODO
====

* leave stub or included vim/bash sourced files,
  for system unique configurations

* ssh, gpg configs as much as is safe

* install common software - taskwarrior, texlive,
  but only if prompted

* pipsi installs: black, mypy, awscli?
  - probably want to prompt before larger software installs

* does homely create lines in the file if the file doesn't exist

* modify homely to allow custom revert for system calling

* organize included dotfiles more neatly
* install pipsi if doesn't already exist
* install vim-plug
* install vim plugins
* install homely.py dependencies in a virtualenv (only later if we want jinja etc)

homely can potentially use virtualenvs in the same way that pipsi get-pipsi.py
does (to get the system python)
sys.real_prefix

how does pipsi handle being called, if already in a venv?

au apt location if not already configured
do i want homely be run as sudo or not?
poetry via pipsi?

pipsi updating pip, setuptools inside the venv

build latest vim from source or add jonathonf apt repo

split up into separate sections, functions/directories

get more up-to-date haskell vim plugins

git config double check that it ignores including ~/.gitconfig

source .vimrc.local at the end if it exists

rst vim plugins
mediawiki vim plugin
