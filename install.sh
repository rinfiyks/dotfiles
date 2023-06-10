#!/bin/bash

if [ -f ~/.bash_aliases_local ]; then
  . ~/.bash_aliases_local
  shopt -s expand_aliases
fi

if [ -n "$DISPLAY" ]; then
  xrdb "$HOME/.Xresources"
fi

# Change dir to files location in repo, in case script was called from somewhere else
cd "$(dirname "$0")"

# Make sure any git dependencies are cloned and up to date
git submodule update --init --recursive --remote

# Generate dotfiles from templates
./generate-from-templates.py

# Recursively create symlinks
filesdir="$(pwd)/files"
cp -TdRbs "$filesdir" "$HOME"

if [ ! -d "$HOME/.local/share/nvim/plugged" ]; then
  echo "Installing vim-plug for vim"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  nvim +PlugInstall +qall
else
  nvim +PlugUpgrade +qall
fi

echo "All done"
