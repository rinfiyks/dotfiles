#!/usr/bin/env bash
SINK_INPUT_ID=$(pactl list sink-inputs | awk '/^Sink Input #/{id=$3} /application.process.binary = "tidal-hifi"/{print id; exit}' | tr -d '#')
pactl set-sink-input-volume $SINK_INPUT_ID +5%
