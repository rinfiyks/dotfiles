#!/bin/bash

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
    shopt -s expand_aliases
fi

if [ -n "$DISPLAY" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

# Change dir to files location in repo, in case script was called from somewhere else
cd "$(dirname "$0")"

# Make sure any git dependencies are cloned and up to date
git submodule update --init --recursive --remote

filesdir="$(pwd)/files"

# Recursively create symlinks
cp -TdRbs "$filesdir" "$HOME"

echo "Installing vundle for vim"
cd "$HOME/.vim/bundle"
if [ -d vundle ]; then
    echo "vundle is already cloned, will pull instead"
    cd vundle
    git pull
    cd ..
else
    git clone https://github.com/gmarik/vundle.git
fi

vim +BundleInstall +qall

echo "All done"
