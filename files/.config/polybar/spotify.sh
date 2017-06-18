#!/bin/bash

playerctl -p spotify metadata > /dev/null 2>&1

if [[ $? == 0 ]]; then
    artist=$(playerctl -p spotify metadata xesam:artist)
    title=$(playerctl -p spotify metadata xesam:title)

    echo -e "\uf1bc  $artist - $title"
fi
