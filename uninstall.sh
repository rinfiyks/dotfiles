#!/bin/bash

# change dir to files location in repo, in case script was called from somewhere else
cd "$(dirname "$0")"/files
filesdir=$(pwd)

# get the 'latest' directory in the backup dir
cd $HOME/.dotfiles.backup/
backupdir="$HOME/.dotfiles.backup/$(ls -1d */ | tail -1)"

cd $HOME/dotfiles/files/
for dotfile in $(ls -1A); do
    rm -r "$HOME/$dotfile" 2>/dev/null
    echo "Removed $dotfile"
done

cd $backupdir
for dotfile in $(ls -1A); do
    cp -r "$dotfile" "$HOME/$dotfile"
    echo "Restored original $dotfile"
done
