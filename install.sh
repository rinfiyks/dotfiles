#!/bin/bash

# change dir to files location in repo, in case script was called from somewhere else
cd "$(dirname "$0")"/files
filesdir=$(pwd)

backupdir="$HOME/.dotfiles.backup/$(date "+%Y%m%d%H%M%S")"
echo "Making backup dir: $backupdir"
mkdir -p $backupdir

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
git clone https://github.com/gmarik/vundle.git
vim +BundleInstall +qall
echo "All done"
