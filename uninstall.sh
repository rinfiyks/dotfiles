#!/bin/bash

# change dir to files location in repo, in case script was called from somewhere else
cd "$(dirname "$0")"
filesdir=$(pwd)/files

# get the 'oldest' directory in the backup dir
cd backup
backupdir="$(pwd)/$(ls -1d */ | head -1)"
echo "Using backupdir: $backupdir"

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
