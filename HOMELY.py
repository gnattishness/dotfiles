#! /usr/bin/env python3

import sys
import os

from homely.files import mkdir, symlink
from homely.system import haveexecutable, execute

HERE_DIR = os.path.dirname(os.path.realpath(__file__))

def main():
    symlink('bashrc', '.bashrc')
    symlink('bash_profile', '.bash_profile')
    symlink('profile', '.profile')  # TODO maybe add lines instead?
    symlink('vimrc', '.vimrc')
    # TODO check if taskwarrior is installed and only symlink if so
    symlink('taskrc', '.taskrc')

    # git common config:
    # TODO error if git not present
    # TODO into separate function
    gitpath = os.path.join(HERE_DIR, 'git_common')
    execute('git config --global include.path ' + gitpath)
    # TODO revert/cleanup somehow?
    # TODO check that path specification using ~/ works

    mkdir('.git-hooks')
    symlink('post-checkout', '.git-hooks/post-checkout')

    return 0

if __name__ == '__main__':
    sys.exit(main)
