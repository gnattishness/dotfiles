#########
Changelog
#########

All notable changes to this project will be documented in this file.

The format is based on `Keep a Changelog <https://keepachangelog.com/en/1.0.0/>`__.
and this project adheres to
`Semantic Versioning <https://semver.org/spec/v2.0.0.html>`__.


Unreleased_
===========

Removed
-------

* Temporarily disabled ``vim-erlang-skeletons`` plugin until PR19 is accepted,
  to stop it loading python2 when both 2 and 3 are supported.

Fixed
-----

* Vim LanguageClient not starting if log directory doesn't already exist.
* Rust LangServer having hard-coded executable path and failing in some installations,
  rather than running from $PATH.


0.7.0_ - 2019-12-02
===================

Added
-----

* PATH to include Rust bin directory, if it exists.
* Git config to GPG sign tags and commits by default.
* i3 configuration files and related scripts that are installed if an i3 executable is present.
* pre-commit auto-install hooks for newly cloned repos.
* C langserver support with clangd
* Vim editorconfig settings and default install with HOMELY


Changed
-------

* Vim solidity plugin to maintained fork: https://github.com/TovarishFin/vim-solidity

  - Need to use ``:PlugClean`` to remove old plugin with clashing name.


0.6.0_ - 2019-07-06
===================

Added
-----

* bashrc ``poetry()`` function wrapper that activates the virtual environment
  instead of calling ``poetry shell``.

  * As in https://github.com/sdispater/poetry/issues/571#issuecomment-496486190

Fixed
-----

* Fixed typo so ``.poetry`` now properly added to the ``PATH``.
* Terminal background color "bleeding" into vim's when using jellybeans colorscheme.
* Vimrc no longer overriding ``t_Co`` to say 256 colors are supported regardless of
  actual terminal support


0.5.0_ - 2019-06-06
===================

Added
-----

* Mediawiki syntax highlighting vim plugin.
* TOML syntax highlighting vim plugin.
* Solidity syntax highlighting vim plugin.
* Vimtex LaTeX plugin for vim
* Direnv hook in bashrc (only called if direnv is installed)
* Poetry installed directly (instead of via Pipsi)

Removed
-------

* ``.git-hooks`` and nested, per-folder git configuration

  * All ``.git-config`` files apart from ``~/.gitconfig`` should be replaced with
    environment variables in direnv's ``.envrc``
  * This is necessary to allow for `pre-commit <https://pre-commit.com/>`__


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
.. _Unreleased: https://github.com/gnattishness/dotfiles/compare/0.6.0...HEAD
.. _0.6.0: https://github.com/gnattishness/dotfiles/compare/0.5.0...0.6.0
.. _0.5.0: https://github.com/gnattishness/dotfiles/compare/0.4.0...0.5.0
.. _0.4.0: https://github.com/gnattishness/dotfiles/compare/0.3.0...0.4.0
.. _0.3.0: https://github.com/gnattishness/dotfiles/compare/0.2.0...0.3.0
.. _0.2.0: https://github.com/gnattishness/dotfiles/compare/0.1.0...0.2.0
