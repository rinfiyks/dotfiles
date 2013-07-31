#!/bin/bash

# change dir to files location in repo, in case script was called from somewhere else
cd "$(dirname "$0")"/files
filesdir=$(pwd)

backupdir="$HOME/.dotfiles.backup/$(date "+%Y%m%d%H%M%S")"
mkdir -p $backupdir

for dotfile in $(ls -1A); do
	mv "$HOME/$dotfile" "$backupdir/$dotfile" 2>/dev/null
	ln -s "$filesdir/$dotfile" "$HOME/$dotfile" 
done
