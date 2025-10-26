#!/usr/bin/env bash
if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q yes; then
  echo "muted"
else
  echo "unmuted"
fi
