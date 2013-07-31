#!/bin/bash

# change dir to files location in repo, in case script was called from somewhere else
cd "$(dirname "$0")"/files
filesdir=$(pwd)

# get the 'latest' directory in the backup dir
backupdir="$HOME/.dotfiles.backup/$(ls -1d */ | tail -1)"

for dotfile in $(ls -1A); do
	rm "$HOME/$dotfile" 2>/dev/null
done

cd $backupdir

for dotfile in $(ls -1A); do
	cp "$dotfile" "$HOME/$dotfile"
done
