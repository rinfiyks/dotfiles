#!/bin/bash

res=$(playerctl -p chromium metadata 2>&1)

if [[ "$res" != "No players found" ]]; then

  icon=$(playerctl -p chromium status |
    grep -q Paused
    if [[ $? == 0 ]]; then
      echo -e "\uf04c" # font-awesome paused icon
      else echo -e "\uf04b" # font-awesome play icon
    fi)

  artist=$(playerctl -p chromium metadata xesam:artist)
  title=$(playerctl -p chromium metadata xesam:title)

  song_details="$artist - $title"
  echo -e "$icon  $song_details"
  echo "$song_details" > /tmp/chromium-song
else
  echo
  echo > /tmp/chromium-song
fi

