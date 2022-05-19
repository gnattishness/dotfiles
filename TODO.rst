TODO
====

* systemd-cat sway
  * https://github.com/swaywm/sway/wiki/Systemd-integration#running-sway-itself-as-a---user-service
* sway env & launcher script
  https://www.reddit.com/r/swaywm/comments/gpzqcg/set_environment_variables/
  also for kitty
* vscode settings.json
* multiple swaylock instances running
* lock keepass before screen lock
* check lockman script - does it make sense?
* kitty handle clipboard/selection ok
* what suitable sysrq setting to use?
* Why eDP-1 now instead of '<eDP-1>'
* Periodically review https://github.com/EndeavourOS-Community-Editions/sway for any nice config updates
* .profile MOZ_ENABLE_WAYLAND in /etc/environment. Does this get removed/reset sometimes?
  - if so, can put it in .profile but check if wayland is present
  - https://unix.stackexchange.com/questions/202891/how-to-know-whether-wayland-or-x11-is-being-used/371164#371164
* global gitignore template?
  - in ~/.config/git/ignore
* interactive/reminder for machine specific config settings you probably want to set (e.g. git user.email)
* Document manjaro i3 workaround - to modify xflock4 to not use blurlock
  - might need to replace it after manjaro updates
* Add config and notes for time tracker
  - Hamster https://github.com/projecthamster/ (not very regularly maintained?)
    - reasonable, crashes kinda often but no problem, gtk in alpha
  - Other options might be:
    - https://www.kimai.org/ (more involved server setup, maybe better in the longer run)
    - Ktimetracker - KDE-based
* Document python-lsp-server install
  (pyls now unmaintained https://github.com/python-lsp/python-lsp-server/issues/27)

  ::

      $ pipx install python-lsp-server[rope,pyflakes]
      $ pipx inject python-lsp-server pylsp-black pyls-isort pylsp-mypy pylsp-rope


* File markdown highlighting bug::

      `rounds[_id].details.minAnswers - rounds[_id].details.answers.length`
  The underscore in ``_id`` starts an italics section, even though it is in an inline "code section"

* https://github.com/tomv564/pyls-mypy disable live mode
* use solc-select - https://github.com/crytic/solc-select
* extra brightness i3 keystroke
  xrandr --output eDP1 --brightness 2
* Check out https://github.com/reedes/vim-lexical, vim-pencil, supertab plugins?
* specific dictionary for technical things? - only bother if it starts getting annoying
  - add to dotfiles?

* easier movement between vim tabs? or easier movement between buffers?
* Change to `gopls` langserver when v1.0 is released
* dunstrc
* Set Xresources font to pragmata if present - include a dotfiles xresources?
* i3 font via xresources
  https://i3wm.org/docs/userguide.html#xresources
* Try alacritty terminal once https://github.com/jwilm/alacritty/pull/2677 ligatures are supported
* A bootstrap.sh that installs pipx and Homely
* update vim plugins?
* leave stub or included vim/bash sourced files,
  for system unique configurations?

* ssh, gpg configs as much as is safe

    * example configs

* install common software - taskwarrior, texlive,
  but only if prompted

* pipx installs: black, mypy, awscli?
  - probably want to prompt before larger software installs

* does homely create lines in the file if the file doesn't exist

* modify homely to allow custom revert for system calling

* organize included dotfiles more neatly
* install pipx if doesn't already exist
* install homely.py dependencies in a virtualenv (only later if we want jinja etc)

* homely can potentially use virtualenvs in the same way that pipsi get-pipsi.py
  does (to get the system python)
  sys.real_prefix

* au apt location if not already configured

* do i want homely be run as sudo or not?
* poetry via pipsi?

* pipsi updating pip, setuptools inside the venv

* build latest vim from source or add jonathonf apt repo

* split up into separate sections, functions/directories

* rst vim plugins

* troubleshoot why pyenv init takes so long in .bashrc
* if using pyenv installer, can upgrade using ``pyenv update``

* pyenv autocomplete?

* move node version manager config to xdg_config_home

* add ./stack/config.yaml base, and ~/.stack/global-project/stack.yaml
  pycodestyle config in dotfiles

* haskell ide_engine update without having to git pull

* pip3 install neovim to base package

* Documentation about what should be installed with pipx and how (e.g. pyls with relevant plugins injected)

PR Ideas
========

- vim-plug to prefer pythonx over python or python3
  (only occurs on vim < 8 without jobs, and not on autoload - on update etc, so not important)
