#!/usr/bin/env bash

CACHE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/fzf-launcher/cache"
UPDATE_CACHE="${XDG_CONFIG_HOME:-$HOME/.config}/sway/scripts/update-fzf-launcher-cache.sh"

mkdir -p "${CACHE_FILE%/*}"

# generate cache on first run
if [ ! -s "$CACHE_FILE" ]; then
  "$UPDATE_CACHE"
fi

# let user choose a command to run with fzf
cmd=$(
  cut -d' ' -f2- "$CACHE_FILE" \
    | fzf --exit-0 --no-extended --print-query --tiebreak=index --reverse \
    | tail -n1
)

# execute the command
if [ -n "$cmd" ]; then
  swaymsg -t command exec -- $cmd
fi

# update the cache, incremending the chosen command's count
swaymsg -t command exec -- "$UPDATE_CACHE" "${cmd@Q}"
