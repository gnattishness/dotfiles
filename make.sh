#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Adapted from Michael Smalley's script: 
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="vimrc"    # list of files/folders to symlink in homedir

##########

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    [[ -f ~/.$file ]] && mv  ~/.$file ~/$file.old
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
