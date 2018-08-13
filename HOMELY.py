#! /usr/bin/env python3

import sys
import os

import homely.files as files
import homely.system as system

HERE = os.path.dirname(os.path.realpath(__file__))


def main():
    files.symlink("bashrc", ".bashrc")
    files.symlink("bash_profile", ".bash_profile")
    files.symlink("profile", ".profile")  # TODO maybe add lines instead?
    if system.haveexecutable("task"):
        files.symlink("taskrc", ".taskrc")

    # git common config:
    # TODO error if git not present
    # TODO into separate function
    gitpath = os.path.join(HERE, "common.gitconfig")
    system.execute(["git", "config", "--global", "include.path", gitpath])
    # NOTE this might overwrite if there's another include.path already present
    # TODO revert/cleanup somehow?
    # TODO check that path specification using ~/ works

    files.mkdir(".git-hooks")
    files.symlink("post-checkout", ".git-hooks/post-checkout")

    files.symlink("vimrc", ".vimrc")
    # install vim-plug
    files.mkdir('.vim')
    files.mkdir('.vim/autoload')
    files.mkdir('.vim/swaps')
    files.mkdir('.vim/backups')
    files.mkdir('.vim/doc')
    files.download(
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
        "~/.vim/autoload/plug.vim",
    )

    if system.haveexecutable("pipenv"):
        # TODO warn that they need to reload for this to take effect
        # this might break horribly
        files.lineinfile(".bashrc", 'eval "$(pipenv --completion)"')

    return 0


if __name__ in ("__main__", "HOMELY"):
    sys.exit(main())
