#!/usr/bin/env bash
SINK_INPUT_ID=$(pactl list sink-inputs | awk '/^Sink Input #/{id=$3} /application.process.binary = "tidal-hifi"/{print id; exit}' | tr -d '#')
pactl list sink-inputs | awk -v id="$SINK_INPUT_ID" ' $0 ~ "^Sink Input #" id "$" {found=1} found && /Volume:/ {print $5; exit}'
