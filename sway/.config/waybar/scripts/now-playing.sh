#!/bin/bash

for player in $(playerctl -l); do
  if [[ "$player" == chromium.instance* ]]; then
    pid="${player#chromium.instance}"
    if pgrep -f tidal-hifi | grep -q "^${pid}$"; then
      icon=$(playerctl -p "$player" status | grep -q Paused
        if [[ $? == 0 ]]; then
          echo -e "\uf04c" # font-awesome paused icon
        else echo -e "\uf04b" # font-awesome play icon
      fi)
      song_details=$(playerctl -p "$player" metadata --format '{{artist}} - {{title}}')
      echo -e "$icon  $song_details"
      echo "$song_details" > /tmp/now-playing.txt
      exit
    fi
  fi
done

echo ""
echo > /tmp/now-playing.txt
