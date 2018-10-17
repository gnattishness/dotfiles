#########
Changelog
#########

All notable changes to this project will be documented in this file.

The format is based on `Keep a Changelog <https://keepachangelog.com/en/1.0.0/>`__.
and this project adheres to 
`Semantic Versioning <https://semver.org/spec/v2.0.0.html>`__.


Unreleased_
===========

Added
-----

* Vimtex LaTeX plugin for vim
* Direnv hook in bashrc (only called if direnv is installed)

0.4.0_ - 2018-10-07
===================

Added
-----

* Vim language server protocol with 
  `LanguageClient-neovim <https://github.com/autozimu/LanguageClient-neovim/issues/467>`__.
  * Initial language servers for haskell, python.
  * Initial language server mappings.
* Some nvm (node version manager) initialization.

Removed
-------

* Vim python-mode plugin (replaced by pyls)


0.3.0_ - 2018-09-14
===================

Added
-----

* pyenv environment variables, auto-completion.

Changed
-------

* Improved readability of profile, bash_profile.

* From __version__.py to VERSION, as not a python package.

Fixed
-----

* vimrc failing to source ``~/.vimrc.local``.


0.2.0_ - 2018-08-13
===================

Added
-----

* vimrc to source a ``~/.vimrc.local`` if it exists.

* bashrc to source ``~/.bashrc.local`` if it exists.

Changed
-------

* vimrc to use vim-plug instead of Vundle.

* Only install .taskrc if taskwarrior is present.

* Only add bash completion for pipenv if pipenv is present.
  
   * Setting is added to ``~/.bashrc.local`` to avoid issues
     modifying a the symlinked ``~/.bashrc``.


0.1.0 - 2018-08-05
==================

Added
-----

* This CHANGELOG.rst.

* Initial version.

* Some TODO notes in TODO.rst.

* Simple HOMELY.py that mainly symlinks at this stage.

* A basic README.

* Vimrc using Vundle, configured for Vim 7.x.

Changed
-------

* Previously this used shell script to create symlinks, now using 
  `Homely <https://homely.readthedocs.io/en/latest/index.html>`_.


.. Links
.. _Unreleased: https://github.com/gnattishness/dotfiles/compare/0.4.0...HEAD
.. _0.4.0: https://github.com/gnattishness/dotfiles/compare/0.3.0...0.4.0
.. _0.3.0: https://github.com/gnattishness/dotfiles/compare/0.2.0...0.3.0
.. _0.2.0: https://github.com/gnattishness/dotfiles/compare/0.1.0...0.2.0
