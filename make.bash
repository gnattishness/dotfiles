#!/bin/bash
############################
# .make.bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Adapted from Michael Smalley's script: 
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT="$(basename "$(test -h "$0" && readlink "$0" || echo "$0")")"
FILES="$( cd "$DIR" && echo [^"$SCRIPT"]*)"   # list of files/folders to symlink in homedir

##########

echo "Installing dotfiles:"
for file in $FILES; do
    if [[ -h ~/."$file" && $( readlink ~/."$file") == "$DIR/$file" ]]
    then
        : # file already installed
    elif [[ -f ~/."$file" ]]
    then
        # Overwrites ~/$file.old if it already exists
        echo "~/.$file already exists, saving to ~/$file.old"
        mv  ~/."$file" ~/"$file.old"
    elif [[ -e ~/."$file" ]]
    then
        echo "unexpected filetype ~/.$file already exists, ignoring"
    else
        echo "    ~/.$file -> $DIR/$file"
        ln -s "$DIR/$file" ~/".$file"
    fi
done
