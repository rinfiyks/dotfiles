#!/bin/bash

while getopts c: flag
do
    case "${flag}" in
        c) config=${OPTARG};;
    esac
done

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
if [ -z $config ]; then
  ./generate-from-templates.py
else
  ./generate-from-templates.py -c $config
fi

# Recursively create symlinks
filesdir="$(pwd)/files"
cp -TdRbs "$filesdir" "$HOME"

echo "All done"
