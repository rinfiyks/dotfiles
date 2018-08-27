#!/bin/bash

playerctl -p spotify metadata > /dev/null 2>&1

if [[ $? == 0 ]]; then

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

