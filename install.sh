#!/bin/bash

# change dir to files location in repo, in case script was called from somewhere else
cd "$(dirname "$0")"
filesdir=$(pwd)/files

backupdir="$(pwd)/dotfiles.backup/$(date "+%Y%m%d%H%M%S")"
echo "Making backup dir: $backupdir"
mkdir -p "$backupdir"

cd "$filesdir"
for dotfile in $(ls -1A); do
	mv "$HOME/$dotfile" "$backupdir/$dotfile" 2>/dev/null
	if [ $? == 0 ]; then
		echo "Backed up previous copy of $dotfile"
	fi
	ln -s "$filesdir/$dotfile" "$HOME/$dotfile"
	echo "Added $dotfile"
done

echo "Installing vundle for vim"
cd ".vim/bundle"
if [ -d vundle ]; then
	echo "vundle is already cloned, will pull instead"
	cd vundle
	git pull
else
	git clone https://github.com/gmarik/vundle.git
fi
vim +BundleInstall +qall
echo "All done"
