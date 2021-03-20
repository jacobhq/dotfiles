#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/.dotfiles/debian_10_wsl

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_prompt aliases zshrc zshrc.pre-oh-my-zsh zprofile shell.pre-oh-my-zsh"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done


