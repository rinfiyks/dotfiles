#!/usr/bin/env bash

CACHE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/fzf-launcher/cache"

# the command needs to be passed to this script with "${cmd@Q}"
cmd="$@"

# load non-zero entries from the cache
declare -A counts
if [ -s "$CACHE_FILE" ]; then
  while IFS= read -r line; do
    n=${line%% *}
    c=${line#* }
    (( n > 0 )) && counts["$c"]=$n
  done < "$CACHE_FILE"
fi

# get the list of available commands from compgen
mapfile -t current_cmds < <(compgen -c | grep -E '^[[:alnum:]]' | sort -u)

# set their counts to 0 if they're not already in the cache
for c in "${current_cmds[@]}"; do
  counts["$c"]=${counts["$c"]:-0}
done

# increment the count of the chosen command
if [ -n "$cmd" ]; then
  counts["$cmd"]=$(( counts["$cmd"] + 1 ))
fi

# update the cache with incremented count
{
  for c in "${!counts[@]}"; do
    printf "%d %s\n" "${counts[$c]}" "$c"
  done
} | sort -k1,1nr -k2,2 \
  > "$CACHE_FILE"

