#!/bin/bash

res=$(playerctl -p spotify metadata 2>&1)

if [[ "$res" != "No players found" ]]; then

  icon=$(playerctl -p spotify status |
    grep -q Paused
    if [[ $? == 0 ]]; then
      echo -e "\uf04c" # font-awesome paused icon
      else echo -e "\uf1bc" # font-awesome spotify icon
    fi)

  artist=$(playerctl -p spotify metadata xesam:artist)
  title=$(playerctl -p spotify metadata xesam:title)

  echo -e "$icon  $artist - $title"
else
  echo
fi

